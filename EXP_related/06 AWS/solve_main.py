from __future__ import annotations

import argparse
import json
import time
from pathlib import Path
from typing import Dict, List, Tuple

try:
    import psutil
    _PROC = psutil.Process()
except ImportError:  # graceful degradation if psutil is missing
    psutil = None
    _PROC = None

from clingo import Control, Function, MessageCode, Number

################################################################################
# ── Argument parsing                                                          ──
################################################################################


def parse_arguments() -> argparse.Namespace:
    p = argparse.ArgumentParser(
        description="Solve ASP tasks incrementally with extended statistics.")
    p.add_argument("--domain",
                   default="AWS_demo",
                   help="Path to instance folder (e.g. 'MPD/MPD_demo').")
    p.add_argument("--index",
                   type=int,
                   default=1,
                   help="Instance number (sub‑folder of --domain).")
    p.add_argument("--models",
                   type=int,
                   default=1,
                   help="Maximum models to enumerate (0 = unlimited).")
    p.add_argument(
        "--threads",
        "-t",
        type=int,
        default=0,
        help="Number of parallel solver threads (0 = all logical cores).")
    p.add_argument("--verbose", action="store_true", help="Verbose progress.")
    p.add_argument("--related",
                   action="store_true",
                   help="Load solve_related.lp instead of solve.lp")
    return p.parse_args()


################################################################################
# ── Control construction & program loading                                   ──
################################################################################


def build_control(model_limit: int, nthreads: int, logger) -> Control:
    """Create and configure a **clingo.Control** instance."""
    ctl = Control([f"--models={model_limit}"], logger, message_limit=1000)
    ctl.enable_cleanup = True
    if nthreads == 0:
        try:
            import multiprocessing as _mp
            nthreads = _mp.cpu_count()
        except Exception:
            nthreads = 1
    nthreads = max(1, nthreads)

    print(f"Using {nthreads} parallel threads for solving.")
    ctl.configuration.solve.parallel_mode = str(nthreads)
    return ctl


def load_program(ctl: Control, args: argparse.Namespace) -> None:
    base_lp = "solve_related.lp" if args.related else "solve.lp"
    ctl.load(base_lp)
    ctl.load("show.lp")
    inst_dir = Path(args.domain) / str(args.index)
    goal_file = inst_dir / "goal.lp"
    instance_file = inst_dir / "instance.lp"
    print(f"Loading goal     from: {goal_file}")
    print(f"Loading instance from: {instance_file}")
    ctl.load(str(goal_file))
    ctl.load(str(instance_file))


################################################################################
# ── Statistics helpers                                                       ──
################################################################################


def serialise_statistics(stats) -> Dict:
    """Recursively turn clingo statistics maps into plain Python dicts."""
    if isinstance(stats, (int, float, str, bool)):
        return stats
    return {k: serialise_statistics(stats[k]) for k in stats}


def inject_memory(stats, rss_bytes: int) -> None:
    """Insert an RSS value into the *user* branches of the statistics tree."""
    # per‑step value
    step_map = stats.setdefault("user_step", {})
    step_map["memory_rss"] = rss_bytes
    # keep the maximum ever seen in an accumulator branch
    accu_map = stats.setdefault("user_accu", {})
    accu_map["memory_rss"] = max(rss_bytes, accu_map.get("memory_rss", 0))


################################################################################
# ── Incremental solving utilities                                           ──
################################################################################


def ground_step(ctl: Control, t: int) -> None:
    """Ground `base` or `step` & activate the external query(t)."""
    parts: List[Tuple[str, List[Number]]] = []
    if t == 0:
        parts.append(("base", []))
    else:
        ctl.release_external(Function("query", [Number(t - 1)]))
        ctl.cleanup()  # free clauses rendered useless by previous externals
        parts.append(("step", [Number(t)]))
    # always ground the auxiliary check module for optimisation termination
    parts.append(("check", [Number(t)]))
    ctl.ground(parts)
    ctl.assign_external(Function("query", [Number(t)]), True)


def solve_step(ctl: Control, t: int,
               collected_models: List[List[str]]) -> None:
    """Solve once, append models, and write step statistics to disk."""

    def on_model(m):
        collected_models.append(sorted(str(s) for s in m.symbols(shown=True)))
        return True  # keep searching if necessary

    return ctl.solve(on_model=on_model)


################################################################################
# ── Main incremental loop                                                   ──
################################################################################


def incremental_solve(args: argparse.Namespace):
    ctl = build_control(args.models, args.threads, logger)
    load_program(ctl, args)

    imin = ctl.get_const("imin").number if ctl.get_const("imin") else 1
    imax = ctl.get_const("imax").number if ctl.get_const("imax") else None
    istop = ctl.get_const("istop").name if ctl.get_const("istop") else "SAT"

    ctl.add("check", ["t"], "#external query(t).")

    collected_models: List[List[str]] = []
    step = 0
    winner_status = None  # last solve status object

    # bookkeeping for overall wall / CPU – statistics has its own timers
    wall0, cpu0 = time.perf_counter(), time.process_time()
    mem0 = _PROC.memory_info().rss if _PROC else None

    log_dir = Path("logs") / args.domain / str(args.index)
    log_dir.mkdir(parents=True, exist_ok=True)

    while (imax is None
           or step < imax) and (winner_status is None or step < imin or (
               (istop == "SAT" and not winner_status.satisfiable) or
               (istop == "UNSAT" and not winner_status.unsatisfiable) or
               (istop == "UNKNOWN" and winner_status.unknown))):

        ground_step(ctl, step)

        struct_path = log_dir / f"stats_structure_{step}.json"
        with struct_path.open("w", encoding="utf-8") as fp:
            json.dump(serialise_statistics(ctl.statistics), fp, indent=2)

        winner_status = solve_step(ctl, step, collected_models)

        # grab memory *after* solving and inject into statistics tree
        rss = _PROC.memory_info().rss if _PROC else 0
        inject_memory(ctl.statistics, rss)

        # serialise and write per‑step statistics
        step_stats_path = log_dir / f"stats_step_{step}.json"
        with step_stats_path.open("w", encoding="utf-8") as fp:
            json.dump(serialise_statistics(ctl.statistics), fp, indent=2)

        if args.verbose:
            print(
                f"[STEP {step}] models={len(collected_models)} mem={rss/2**20:.2f} MB"
            )

        step += 1

    # write complete statistics at the end as well
    ctl_stats_path = log_dir / "stats_final.json"
    with ctl_stats_path.open("w", encoding="utf-8") as fp:
        json.dump(serialise_statistics(ctl.statistics), fp, indent=2)

    # wall / CPU summary (optional human‑readable)
    if args.verbose:
        wall1, cpu1 = time.perf_counter(), time.process_time()
        mem1 = _PROC.memory_info().rss if _PROC else 0
        print("\n=== Summary ===")
        print(f"Wall time: {(wall1-wall0):.3f}s  CPU: {(cpu1-cpu0):.3f}s")
        if mem0 is not None:
            print(f"Memory Δ: {(mem1-mem0)/2**20:.2f} MB")

    # dump models (same helper as before)
    save_models_to_lp(collected_models, out_dir=log_dir)

    return collected_models


################################################################################
# ── Model persistence (unchanged)                                           ──
################################################################################


def save_models_to_lp(models: List[List[str]],
                      out_dir: str | Path = ".") -> None:
    Path(out_dir).mkdir(parents=True, exist_ok=True)
    for i, m in enumerate(models, 1):
        fp = Path(out_dir) / f"model_{i}.lp"
        with fp.open("w", encoding="utf-8") as f:
            for a in m:
                f.write(f"{a.rstrip('.')}.\n")


################################################################################
# ── Logger                                                                   ──
################################################################################


def logger(code: MessageCode, message: str):
    # show only runtime errors, silence warnings etc.
    if code is MessageCode.RuntimeError:
        print(f"[clingo:{code.name}] {message}")


################################################################################
# ── Entry point                                                             ──
################################################################################

if __name__ == "__main__":
    args = parse_arguments()
    incremental_solve(args)
