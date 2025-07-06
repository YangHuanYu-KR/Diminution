#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Clingo Incremental Solver with Resource Logging
==============================================

This script uses Clingo's Python API to incrementally solve ASP (Answer Set Programming) problems
and logs resource usage (Wall time, CPU time, Memory) at each step.
The collected statistics are output as a JSON file.

Purpose:
  - Solve ASP tasks for the MPD (Manufacturing Planning Domain).
  - Support incremental solving with configurable stopping conditions.
  - Record and output detailed resource consumption logs for performance analysis.

Running Examples:
-----------------
1. Run a default instance (equivalent to --domain "MPD/MPD_demo" --index 1 --lp_dir is not needed here):
    python3 this_script.py

2. Specify the instance directory and the number of models (domain should be the full path, e.g., "MPD/MPD_demo"):
    python3 this_script.py --domain MPD/MPD_demo --index 3 --models 2

3. Enable verbose output for resource logging:
    python3 this_script.py --domain MPD/MPD_demo --models 2 --verbose

Argument Explanations:
----------------------
--domain <str>:
    Specifies the full subdirectory path for the instance, e.g., "MPD/MPD_demo".
    This path must contain subfolders named MPD_<index> with MPD_goal.lp and MPD_instance.lp inside.

--index <int>:
    Specifies the instance number (uses MPD_<index>/MPD_goal.lp and MPD_<index>/MPD_instance.lp). Default is 1.

--models <int>:
    The maximum number of models Clingo should compute. Default is 1; set to 0 for no limit.

--verbose:
    If provided, prints detailed resource usage (Wall time, CPU time, memory) for each step to the terminal.

Output Explanation:
-------------------
- Resource usage information collected during solving is saved in logs/{domain}/mpd_stats_{index}.json.
  (Note: Earlier comments suggested logs/{lp_dir}/{domain}/..., but the actual implementation uses logs/{domain}/...,
   so this description has been corrected.)
- The function returns:
    1. log_data: A dictionary containing per-step and total resource data.
    2. collected_models: A list of ASP models (answer sets) obtained.

Important Notes:
----------------
- Requires the `clingo` Python bindings (e.g., potassco/clingo).
- Optionally, install `psutil` for accurate memory measurements; otherwise, memory usage will be reported as None.
"""


import argparse
import time
import gc
import json
import os

try:
    import psutil
    _PROC = psutil.Process()
except ImportError:
    psutil = None
    _PROC = None

from clingo import MessageCode, Control, Function, Number


def parse_arguments() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Solve ASP tasks incrementally with resource logging.")
    parser.add_argument(
        "--domain",
        type=str,
        default="MPD/MPD_demo",
        help="Full path to the instance subdirectory, e.g., \"MPD/MPD_demo\".")
    parser.add_argument(
        "--index",
        type=int,
        default=1,
        help="Instance number corresponding to <index> subfolder.")
    parser.add_argument(
        "--models",
        type=int,
        default=1,
        help="Maximum number of models to compute (0 for no limit).")
    parser.add_argument(
        "--verbose",
        action="store_true",
        help="Enable verbose output of resource usage for each step.")
    
    parser.add_argument(
        "--related",
        action="store_true",
        help="Use solve_related.lp to solve.")
    return parser.parse_args()


def logger(code, message):
    """
    Log only RuntimeError messages from Clingo; suppress other warnings.
    """
    if code is MessageCode.RuntimeError:
        print(f"[ERROR:{code.name}] {message}")


def incremental_solve(args) -> tuple[dict, list[list[str]]]:
    print(f"🚀 Starting Clingo solve: {args.domain} |"
          f" Instance: {args.index} | Model limit: {args.models}")
    
    domain_norm = os.path.normpath(args.domain)
    top_dir = domain_norm.split(os.sep)[0]

    ctl = Control([f"--models={args.models}"], logger, message_limit=1000)
    ctl.enable_cleanup = True

    conf = ctl.configuration
    conf.solve.parallel_mode = "16"

    if args.related:
        ctl.load(f"{top_dir}/solve_related.lp")
    else:
        ctl.load(f"{top_dir}/solve.lp")
    ctl.load(f"{top_dir}/show.lp")
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

    # Incremental solving loop
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
            print(f"=== Step {step} done: wall={t1-t0:.3f}s, cpu={c1-c0:.3f}s{mem_str}")

        step += 1

    gc.collect()
    end_wall = time.perf_counter()
    end_cpu = time.process_time()
    end_mem = _PROC.memory_info().rss if _PROC else None

    total_stats = {
        "total_wall": end_wall - start_wall,
        "total_cpu": end_cpu - start_cpu,
        "start_mem": start_mem,
        "end_mem": end_mem,
        "mem_delta": (end_mem - start_mem) if (start_mem is not None and end_mem is not None) else None
    }

    log_dir = os.path.join("logs",  args.domain)
    os.makedirs(log_dir, exist_ok=True)
    if args.related:
        log_path = os.path.join(log_dir, f"related_stats_{args.index}.json")
    else:
        log_path = os.path.join(log_dir, f"stats_{args.index}.json")

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

    print(f"Log saved to {log_path}")
    if args.verbose:
        print("\nResource Usage Summary:")
        for stat in per_step_stats:
            mem_str = f", mem={stat['mem']/1024**2:.2f}MB" if stat['mem'] is not None else ""
            print(f"Step {stat['step']}: wall={stat['wall']:.3f}s, cpu={stat['cpu']:.3f}s{mem_str}")
        print("\nOverall:")
        print(f"Total wall clock time: {total_stats['total_wall']:.3f}s")
        print(f"Total CPU time:       {total_stats['total_cpu']:.3f}s")
        if total_stats['start_mem'] is not None and total_stats['end_mem'] is not None:
            print(f"Memory at start:      {total_stats['start_mem']/1024**2:.2f}MB")
            print(f"Memory at end:        {total_stats['end_mem']/1024**2:.2f}MB")
            print(f"Memory change:        {total_stats['mem_delta']/1024**2:.2f}MB")

    return log_data, collected_models


if __name__ == "__main__":
    args = parse_arguments()
    incremental_solve(args)
