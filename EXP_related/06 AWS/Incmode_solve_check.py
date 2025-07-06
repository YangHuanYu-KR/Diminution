#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from pathlib import Path
import argparse
import time
import json
import os

try:
    import psutil
    _PROC = psutil.Process()
except ImportError:
    psutil = None
    _PROC = None

from clingo import Control, Function, Number

# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------


def parse_arguments() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Solve ASP tasks incrementally with resource logging.")
    parser.add_argument("--domain",
                        type=str,
                        default="AWS_demo",
                        help="Instance subdirectory, e.g. \"MPD/MPD_demo\".")
    parser.add_argument("--index",
                        type=int,
                        default=1,
                        help="Instance number inside the domain folder.")
    parser.add_argument(
        "--models",
        type=int,
        default=1,
        help="Maximum number of models to compute (0 = no limit).")
    parser.add_argument("--verbose",
                        action="store_true",
                        help="Print per‑step runtime + memory usage.")
    parser.add_argument("--related",
                        action="store_true",
                        help="Use solve_related.lp instead of solve.lp.")
    return parser.parse_args()


def incremental_solve(args) -> tuple[dict, list[list[str]]]:
    print(f"Starting Clingo solve: {args.domain} |"
          f" Instance: {args.index} | Model limit: {args.models}")
    ctl = Control([f"--models={args.models}"], logger, message_limit=1000)
    ctl.enable_cleanup = True

    conf = ctl.configuration

    # 多线程
    conf.solve.parallel_mode = "32"

    if args.related:
        ctl.load(f"./solve_related.lp")
    else:
        ctl.load(f"./solve.lp")
    ctl.load(f"./show.lp")
    goal_path = os.path.join(args.domain, f"{args.index}", "goal.lp")
    inst_path = os.path.join(args.domain, f"{args.index}", "instance.lp")
    ctl.load(goal_path)
    ctl.load(inst_path)

    collected_models: list[list[str]] = []

    def on_model(m):
        symbols = m.symbols(shown=True)
        collected_models.append(sorted(str(s) for s in symbols))
        return True

    gc.collect()
    start_wall = time.perf_counter()
    start_cpu = time.process_time()
    start_mem = _PROC.memory_info().rss if _PROC else None

    per_step_stats: list[dict] = [{
        "step": -1,
        "wall": 0.0,
        "cpu": 0.0,
        "mem": start_mem
    }]

    step = 0
    ret = None

    imin_const = ctl.get_const("imin")
    imin = imin_const.number if imin_const is not None else 1

    imax_const = ctl.get_const("imax")
    imax = imax_const.number if imax_const is not None else None

    istop_const = ctl.get_const("istop")
    istop = istop_const.name if istop_const is not None else "SAT"

    ctl.add("check", ["t"], "#external query(t).")

    # Incremental solving
    while (imax is None or step < imax) and (ret is None or step < imin or (
        (istop == "SAT" and not ret.satisfiable) or
        (istop == "UNSAT" and not ret.unsatisfiable) or
        (istop == "UNKNOWN" and ret.unknown))):

        gc.collect()
        t0 = time.perf_counter()
        c0 = time.process_time()

        parts = [("check", [Number(step)])]
        if step > 0:
            ctl.release_external(Function("query", [Number(step - 1)]))
            parts.append(("step", [Number(step)]))
            ctl.cleanup()
        else:
            parts.append(("base", []))
        ctl.ground(parts)

        ctl.assign_external(Function("query", [Number(step)]), True)
        ret = ctl.solve(on_model=on_model)

        t1 = time.perf_counter()
        c1 = time.process_time()
        m1 = _PROC.memory_info().rss if _PROC else None

        per_step_stats.append({
            "step": step,
            "wall": t1 - t0,
            "cpu": c1 - c0,
            "mem": m1
        })

        if args.verbose:
            mem_str = f", mem={m1/1024**2:.2f}MB" if m1 is not None else ""
            print(
                f"=== Step {step} done: wall={t1-t0:.3f}s, cpu={c1-c0:.3f}s{mem_str}"
            )

        step += 1

    gc.collect()
    end_wall = time.perf_counter()
    end_cpu = time.process_time()
    end_mem = _PROC.memory_info().rss if _PROC else None

    # 使用 ctl.statistics 给出 clingo 内置的统计信息
    ctl_stats = ctl.statistics
    print("type of ctl_stats:", type(ctl_stats))

    total_stats = {
        "total_wall":
        end_wall - start_wall,
        "total_cpu":
        end_cpu - start_cpu,
        "start_mem":
        start_mem,
        "end_mem":
        end_mem,
        "mem_delta": (end_mem - start_mem) if
        (start_mem is not None and end_mem is not None) else None
    }

    log_dir = os.path.join("logs", args.domain)
    os.makedirs(log_dir, exist_ok=True)
    if args.related:
        log_path = os.path.join(log_dir, f"related_stats_{args.index}.json")
        ctl_log_path = os.path.join(log_dir,
                                    f"related_ctl_stats_{args.index}.json")
        model_path = os.path.join(log_dir, f"related_models_{args.index}.lp")
    else:
        log_path = os.path.join(log_dir, f"stats_{args.index}.json")
        ctl_log_path = os.path.join(log_dir, f"ctl_stats_{args.index}.json")
        model_path = os.path.join(log_dir, f"models_{args.index}.lp")

    save_models_to_lp(collected_models, out_dir=log_dir)

    log_data = {
        "domain": args.domain,
        "index": args.index,
        "models_computed": len(collected_models),
        "total_steps": step,
        "per_step_stats": per_step_stats,
        "total_stats": total_stats
    }

    with open(log_path, "w", encoding="utf-8") as f:
        json.dump(log_data, f, ensure_ascii=False, indent=2)

    with open(ctl_log_path, "w", encoding="utf-8") as f:
        json.dump(ctl_stats, f, ensure_ascii=False, indent=2)

    print(f"Log saved to {log_path}")
    if args.verbose:
        print("\nResource Usage Summary:")
        for stat in per_step_stats:
            mem_str = f", mem={stat['mem']/1024**2:.2f}MB" if stat[
                'mem'] is not None else ""
            print(
                f"Step {stat['step']}: wall={stat['wall']:.3f}s, cpu={stat['cpu']:.3f}s{mem_str}"
            )
        print("\nOverall:")
        print(f"Total wall clock time: {total_stats['total_wall']:.3f}s")
        print(f"Total CPU time:       {total_stats['total_cpu']:.3f}s")
        if total_stats['start_mem'] is not None and total_stats[
                'end_mem'] is not None:
            print(
                f"Memory at start:      {total_stats['start_mem']/1024**2:.2f}MB"
            )
            print(
                f"Memory at end:        {total_stats['end_mem']/1024**2:.2f}MB"
            )
            print(
                f"Memory change:        {total_stats['mem_delta']/1024**2:.2f}MB"
            )

    return log_data, collected_models


def save_models_to_lp(models, out_dir: str = "."):
    """
    将 clingo 模型写入若干 .lp 文件。
    
    :param models: 形如 [['atom1', 'atom2', ...], [...]] 的模型列表
    :param out_dir: 保存目录，默认当前工作目录
    """
    Path(out_dir).mkdir(parents=True, exist_ok=True)

    for idx, model in enumerate(models, start=1):
        file_path = Path(out_dir) / f"{idx}.lp"
        with open(file_path, "w", encoding="utf-8") as f:
            for atom in model:
                atom = atom.rstrip(".")
                f.write(f"{atom}.\n")  # 每行一个原子并以 '.' 结束
        print(f"[+] Model {idx} written to {file_path}")


if __name__ == "__main__":
    args = parse_arguments()
    log_data, collected_models = incremental_solve(args)
