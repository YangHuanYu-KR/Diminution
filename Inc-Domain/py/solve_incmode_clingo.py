#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Incremental ASP Solver with Rich Per-Step Statistics
===================================================

nohup python Inc-Domain/py/solve_incmode_clingo.py --domain vh --index -1 --related --csv --verbose > out.log 2>&1 &

结合原 incmode 版本与 solve_main.py 的功能，支持：
  • 逐步 (step) ground+solve，并记录详细资源/规模指标
  • 批量运行 (--index -1) 与 CSV 汇总
  • 普通 / related 求解器切换
  • 多线程求解、可选 verbose 输出

输出：
  1. logs/{domain}/stats_{index}.json      —— 逐步 JSON
  2. {domain}/result.csv （--csv 时）      —— 汇总表
"""

from __future__ import annotations
import argparse, sys, os, time
from pathlib import Path
from typing import List, Dict, Any

import clingo
from clingo import Control, Function, Number
from clingo.control import BackendType

import platform, threading, queue
import timeout_decorator  # pip install timeout-decorator
from timeout_decorator import TimeoutError as StepTimeout

IS_WINDOWS = platform.system() == "Windows"

def find_base_dir(target_dirname: str = "Diminution") -> Path:
    current = Path(__file__).resolve()
    for parent in current.parents:
        if parent.name == target_dirname:
            return parent
    raise RuntimeError(f"未在路径中找到名为 {target_dirname} 的父目录。请确认你的文件是否在该项目结构下。")


BASE_DIR = find_base_dir()
sys.path.append(str(BASE_DIR))

from deps.utils import _mb, _rss, all_constants_size, upsert_and_sort_csv


# ─────────────────────────── CLI ────────────────────────────────────────────
def parse_args() -> argparse.Namespace:
    p = argparse.ArgumentParser("Incremental ASP solver with rich statistics")
    p.add_argument("--domain",
                   default="gw",
                   help="e.g. ./gw  (必须包含 <idx>/instance.lp)")
    p.add_argument("--index",
                   type=int,
                   default=1,
                   help="-1 ⇒ 遍历 domain 下全部数字子目录")
    p.add_argument("--models",
                   type=int,
                   default=1,
                   help="clingo --models=N  (0 = 无上限)")
    p.add_argument("--threads", type=int, default=1, help="并行线程数；0=自动检测 CPU")
    p.add_argument("--verbose", action="store_true", help="打印每步资源消耗")
    p.add_argument("--related",
                   action="store_true",
                   help="加载 solve_related 而非 solve")
    p.add_argument("--csv",
                   action="store_true",
                   help="将总览结果写入 <domain>/result.csv")
    p.add_argument('--time_limit', type=int, default=30)
    return p.parse_args()


def run_step_with_timeout(ctl: Control, aspif_path: str, step: int,
                          time_limit: int) -> "clingo.SolveResult":
    """
    Ground + solve *one* incremental step with an OS‑aware timeout strategy.
    Raises `timeout_decorator.TimeoutError` on timeout.
    """

    def _do_ground_and_solve():
        collected_models: List[List[str]] = []
        parts = [("check", [Number(step)])]
        
        # ---------- ground this step --------------------------------------
        g_wall0 = time.perf_counter()
        g_cpu0 = time.process_time()
        
        if step == 0:
            parts.append(("base", []))
        else:
            ctl.release_external(Function("query", [Number(step - 1)]))
            parts.append(("step", [Number(step)]))
            ctl.cleanup()

        ctl.ground(parts)
        ctl.assign_external(Function("query", [Number(step)]), True)
        mem_g = _rss()

        consts_size = all_constants_size(ctl)

        g_wall1 = time.perf_counter()
        g_cpu1 = time.process_time()
        
        # ---------- measure ground file size ------------------------------
        aspif_size = os.path.getsize(aspif_path)
        
        # ---------- statistics after ground -------------------------------

        stats_lp = ctl.statistics["problem"]["lp"]
        rules = int(stats_lp.get("rules", 0))
        atoms = int(stats_lp.get("atoms", 0))

        rel_facts = sum(1 for a in ctl.symbolic_atoms
                        if "related" in a.symbol.name and a.is_fact)
        rel_nfacts = sum(1 for a in ctl.symbolic_atoms
                         if "related" in a.symbol.name and not a.is_fact)
        
        # ---------- solve --------------------------------------------------
        s_wall0 = time.perf_counter()
        s_cpu0 = time.process_time()
        
        ret = ctl.solve(on_model=lambda m: collected_models.append(
                sorted(str(s) for s in m.symbols(shown=True))), on_statistics=None)

        
        mem_s = _rss()
        s_wall1 = time.perf_counter()
        s_cpu1 = time.process_time()

        return ret, g_wall1, g_wall0, g_cpu1, g_cpu0, s_wall1, s_wall0, s_cpu1, s_cpu0, rules, atoms, consts_size, rel_facts, rel_nfacts, aspif_size, mem_s, mem_g, collected_models

    if not IS_WINDOWS:

        @_wrap_with_timeout(time_limit)
        def _linux_runner():
            return _do_ground_and_solve()

        return _linux_runner()

    q: "queue.Queue[clingo.SolveResult]" = queue.Queue()

    def _worker():
        try:
            q.put(_do_ground_and_solve())
        except Exception as exc:
            q.put(exc)

    t = threading.Thread(target=_worker, daemon=True)
    t.start()
    t.join(time_limit)

    if t.is_alive():
        ctl.interrupt()
        t.join()
        raise StepTimeout(f"step {step} exceeded {time_limit}s")

    res = q.get()
    if isinstance(res, Exception):
        raise res
    return res


def _wrap_with_timeout(seconds: int):

    def _decorator(fn):
        return timeout_decorator.timeout(
            seconds,
            timeout_exception=StepTimeout,  # 保持同一种异常
        )(fn)

    return _decorator

# ─────────────────────── control & helpers ─────────────────────────────────
def build_control(args: argparse.Namespace) -> Control:
        
    # ctl = Control(arguments=["--stats=2"])
    ctl = Control(arguments=["--stats=2"])
    ctl.configuration.solve.models = str(args.models)
    if args.threads == 0:
        import multiprocessing as mp
        threads = mp.cpu_count()
        threads = min(threads, 64)

    ctl.configuration.solve.parallel_mode = str(max(1, args.threads))
    ctl.enable_cleanup = True
    return ctl


# ─────────────────────── 单实例求解 ────────────────────────────────────────
def solve_incremental(domain: Path, idx: int,
                      args: argparse.Namespace) -> Dict[str, Any]:
    ctl = build_control(args)

    # === load base / show / instance =======================================
    solver = "solve_related" if args.related else "solve"
    base_lp = domain / solver / "solve_base.lp"
    check_lp = domain / solver / "solve_check.lp"
    step_lp = domain / solver / "solve_step.lp"
    inst_lp = domain / "Instances" / str(idx) / "instance.lp"

    instance_base_lp = domain / "Instances" /str(idx) / "instance_base.lp"
    instance_step_lp = domain / "Instances" / str(idx) / "instance_step.lp"

    path_list = [
        base_lp, check_lp, step_lp, inst_lp
    ] if args.domain != 'vh' else [
        base_lp, check_lp, step_lp, instance_base_lp, instance_step_lp
    ]

    for path in path_list:
        if path.exists():
            ctl.load(str(path))

    # === external & imin/imax/istop ========================================
    ctl.add("check", ["t"], "#external query(t).")
    imin = ctl.get_const("imin")
    imin = imin.number if imin is not None else 1
    imax_c = ctl.get_const("imax")
    imax = imax_c.number if imax_c is not None else None
    istop_c = ctl.get_const("istop")
    istop = istop_c.name if istop_c is not None else "SAT"

    # === prepare aspif file (compute the size of grounded program) =========
    aspif_path = BASE_DIR / "Inc-Domain" / "temp" / "temp_gc_gringo.aspif"
    ctl.register_backend(BackendType.Aspif, str(aspif_path), replace=False)

    # === statistic container ===============================================
    step_stats: List[Dict[str, Any]] = []
    stats_lists = {
        "wall_ground": [],
        "cpu_ground": [],
        "wall_solve": [],
        "cpu_solve": [],
        "consts_size": [],
        "rules": [],
        "atoms": [],
        "rel_facts": [],
        "rel_nonfacts": [],
        "rel_total": [],
        "aspif_bytes": [],
        "mem_grounding_mb": [],
        "mem_solve_mb": [],
    }

    #########################################################################
    #                        Incremental Loop                               #
    #########################################################################
    step = 0
    ret = None

    mem0 = _rss()
    wall0 = time.perf_counter()
    cpu0 = time.process_time()
    while (imax is None or step < imax) and (ret is None or step < imin or (
        (istop == "SAT" and not ret.satisfiable) or
        (istop == "UNSAT" and not ret.unsatisfiable) or
        (istop == "UNKNOWN" and ret.unknown))):

        # ---------- ground this step --------------------------------------
        try:
            ret, g_wall1, g_wall0, g_cpu1, g_cpu0, \
                 s_wall1, s_wall0, s_cpu1, s_cpu0, \
                 rules, atoms, consts_size, \
                 rel_facts, rel_nfacts, \
                 aspif_size, mem_s, mem_g, collected_models = run_step_with_timeout(
                aspif_path=aspif_path,
                ctl=ctl,
                step=step,
                time_limit=args.time_limit)
                 
        except StepTimeout:
            print(f"[step {step:3d}]  超时 (> {args.time_limit}s)，跳过后续步骤")
            
            step_stats.append({
            "step": step,
            "wall_ground": -1,
            "cpu_ground": -1,
            "wall_solve": -1,
            "cpu_solve": -1,
            "rules": -1,
            "atoms": -1,
            "consts_size": -1,
            "rel_facts": -1,
            "rel_nonfacts": -1,
            "rel_total": -1,
            "aspif_bytes": -1,
            "mem_grounding_mb": -1,
            "mem_solve_mb": -1,
            "models_cum": -1,
        })
            for key in stats_lists:
                stats_lists[key].append(step_stats[-1][key])
            break

        # ---------- record step -------------------------------------------
        step_stats.append({
            "step": step,
            "wall_ground": round(g_wall1 - g_wall0, 6),
            "cpu_ground": round(g_cpu1 - g_cpu0, 6),
            "wall_solve": round(s_wall1 - s_wall0, 6),
            "cpu_solve": round(s_cpu1 - s_cpu0, 6),
            "rules": rules,
            "atoms": atoms,
            "consts_size": consts_size,
            "rel_facts": rel_facts,
            "rel_nonfacts": rel_nfacts,
            "rel_total": rel_facts + rel_nfacts,
            "aspif_bytes": aspif_size,
            "mem_grounding_mb": _mb(mem_g),
            "mem_solve_mb": _mb(mem_s),
            "models_cum": len(collected_models),
        })
        for key in stats_lists:
            stats_lists[key].append(step_stats[-1][key])

        if args.verbose:
            print(f"[step {step:3d}] "
                  f"G {g_wall1-g_wall0:0.3f}s | "
                  f"S {s_wall1-s_wall0:0.3f}s | "
                  f"C {consts_size} | "
                  f"rules {rules:6d} atoms {atoms:7d} | "
                  f"rel {rel_facts}/{rel_nfacts} | "
                  f"G size {aspif_size}B |"
                  f"mem {_mb(mem_g):.2f}/{_mb(mem_s):.2f} MB")
        step += 1

    #########################################################################

    wall1 = time.perf_counter()
    cpu1 = time.process_time()
    mem2 = _rss()

    summary = {
        "index": (-idx if args.related else idx),
        "models":
        len(collected_models),
        "steps":
        step,
        "total_wall":
        round(wall1 - wall0, 3),
        "total_cpu":
        round(cpu1 - cpu0, 3),
        "mem_start_bytes":
        mem0,
        "mem_end_bytes":
        mem2,
        "mem_delta_bytes":
        None if (mem0 is None or mem2 is None) else _mb(mem2 - mem0),
    }
    for k, v in stats_lists.items():
        summary[f"{k}_list"] = ";".join(map(str, v))

    return summary


# ───────────────────── 批处理 & CSV ────────────────────────────────────────
def run(args: argparse.Namespace):
    domain = BASE_DIR / "Inc-Domain" / args.domain
    instances  = domain / "Instances"
    if not instances.exists():
        raise FileNotFoundError(instances)

    if args.index == -1:
        args.csv = True  
        indices = sorted(
            int(p.name) for p in instances.iterdir()
            if p.is_dir() and p.name.isdigit())
    else:
        indices = [args.index]

    csv_path = domain / "result_clingo_719_unrelated.csv"
    
    for idx in indices:
        idx = idx
        print(f"Now solving the {idx} instance in {domain}")
        row = solve_incremental(domain, idx, args)
        if args.csv:
            upsert_and_sort_csv(row, csv_path)


# ─────────────────────────── entry ─────────────────────────────────────────
if __name__ == "__main__":
    run(parse_args())
