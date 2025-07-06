#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Incremental ASP Solver with Rich Per-Step Statistics
===================================================

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
import argparse, csv, json, os, time
from pathlib import Path
from typing import List, Dict, Any, Set

import clingo
from clingo import Control, Function, Number, MessageCode
from clingo.control import BackendType

try:
    import psutil
    _PROC = psutil.Process()
except ImportError:
    _PROC = None


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
    p.add_argument("--threads", type=int, default=0, help="并行线程数；0=自动检测 CPU")
    p.add_argument("--verbose", action="store_true", help="打印每步资源消耗")
    p.add_argument("--related",
                   action="store_true",
                   help="加载 solve_related.lp 而非 solve.lp")
    p.add_argument("--csv",
                   action="store_true",
                   help="将总览结果写入 <domain>/result.csv")
    return p.parse_args()


# ─────────────────────── control & helpers ─────────────────────────────────
def build_control(models: int, threads: int) -> Control:
    ctl = Control(arguments=["--stats=2"], logger=logger)
    ctl.configuration.solve.models = str(models)
    if threads == 0:
        import multiprocessing as mp
        threads = mp.cpu_count()
    ctl.configuration.solve.parallel_mode = str(max(1, threads))
    ctl.enable_cleanup = True
    return ctl


def herbrand_size(ctl: Control) -> int:
    """遍历 symbolic_atoms 统计常量个数（数值 / 字符串 / 0 元函数符号）。"""
    consts: Set[clingo.Symbol] = set()

    def rec(sym: clingo.Symbol):
        if sym.type in (clingo.SymbolType.Number, clingo.SymbolType.String):
            consts.add(sym)
        elif sym.type is clingo.SymbolType.Function:
            if not sym.arguments:
                consts.add(sym)
            else:
                for a in sym.arguments:
                    rec(a)

    for a in ctl.symbolic_atoms:
        rec(a.symbol)
    return len(consts)


def _rss() -> int | None:
    return _PROC.memory_info().rss if _PROC else None


def _mb(b: int | None) -> float | None:
    return None if b is None else round(b / 2**20, 2)


def logger(code: MessageCode, msg: str):
    if code is MessageCode.RuntimeError:
        print(f"[clingo:{code.name}] {msg}")


# ─────────────────────── 单实例求解 ────────────────────────────────────────
def solve_incremental(domain: Path, idx: int,
                      args: argparse.Namespace) -> Dict[str, Any]:
    print(f"\n solving  {domain.name}/{idx}  "
          f"({'related' if args.related else 'normal'})")
    ctl = build_control(args.models, args.threads)

    # === load base / show / instance =======================================
    base_lp = domain / ("solve_related.lp" if args.related else "solve.lp")
    inst_lp = domain / str(idx) / "instance.lp"
    goal_lp = domain / str(idx) / "goal.lp"
    for path in (base_lp, goal_lp, inst_lp):
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
    aspif_path = Path("./temp") / "step.aspif"
    ctl.register_backend(BackendType.Aspif, str(aspif_path), replace=False)

    # === statistic container ===============================================
    collected_models: List[List[str]] = []
    step_stats: List[Dict[str, Any]] = []

    mem0 = _rss()
    wall0 = time.perf_counter()
    cpu0 = time.process_time()

    stats_lists = {
        "wall_ground": [],
        "cpu_ground": [],
        "wall_solve": [],
        "cpu_solve": [],
        "herbrand": [],
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
    while (imax is None or step < imax) and (ret is None or step < imin or (
        (istop == "SAT" and not ret.satisfiable) or
        (istop == "UNSAT" and not ret.unsatisfiable) or
        (istop == "UNKNOWN" and ret.unknown))):

        # ---------- ground this step --------------------------------------
        g_wall0 = time.perf_counter()
        g_cpu0 = time.process_time()

        parts = [("check", [Number(step)])]
        if step == 0:
            parts.append(("base", []))
        else:
            ctl.release_external(Function("query", [Number(step - 1)]))
            parts.append(("step", [Number(step)]))
            ctl.cleanup()
        ctl.ground(parts)
        ctl.assign_external(Function("query", [Number(step)]), True)
        mem_g = _rss()

        g_wall1 = time.perf_counter()
        g_cpu1 = time.process_time()

        # ---------- measure ground file size ------------------------------
        aspif_size = os.path.getsize(aspif_path)

        # ---------- statistics after ground -------------------------------
        stats_lp = ctl.statistics["problem"]["lp"]
        rules = int(stats_lp.get("rules", 0))
        atoms = int(stats_lp.get("atoms", 0))
        hbsize = herbrand_size(ctl)

        rel_facts = sum(1 for a in ctl.symbolic_atoms
                        if "related" in a.symbol.name and a.is_fact)
        rel_nfacts = sum(1 for a in ctl.symbolic_atoms
                         if "related" in a.symbol.name and not a.is_fact)

        # ---------- solve --------------------------------------------------
        s_wall0 = time.perf_counter()
        s_cpu0 = time.process_time()
        ret = ctl.solve(on_model=lambda m: collected_models.append(
            sorted(str(s) for s in m.symbols(shown=True))))
        mem_s = _rss()
        s_wall1 = time.perf_counter()
        s_cpu1 = time.process_time()

        # ---------- record step -------------------------------------------
        step_stats.append({
            "step": step,
            "wall_ground": round(g_wall1 - g_wall0, 6),
            "cpu_ground": round(g_cpu1 - g_cpu0, 6),
            "wall_solve": round(s_wall1 - s_wall0, 6),
            "cpu_solve": round(s_cpu1 - s_cpu0, 6),
            "rules": rules,
            "atoms": atoms,
            "herbrand": hbsize,
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
                  f"H {hbsize} | "
                  f"rules {rules:6d} atoms {atoms:7d} | "
                  f"rel {rel_facts}/{rel_nfacts} | "
                  f"G size {aspif_size}B |"
                  f"mem {_mb(mem_g):.2f}/{_mb(mem_g):.2f} MB")

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
        "mem_start_mb":
        _mb(mem0),
        "mem_end_mb":
        _mb(mem2),
        "mem_delta_mb":
        None if (mem0 is None or mem2 is None) else _mb(mem2 - mem0),
    }
    for k, v in stats_lists.items():
        summary[f"{k}_list"] = ";".join(map(str, v))

    return summary


# ───────────────────── 批处理 & CSV ────────────────────────────────────────
def run(args: argparse.Namespace):
    domain = Path(args.domain)
    if not domain.exists():
        raise FileNotFoundError(domain)

    indices = (sorted(
        int(p.name) for p in domain.iterdir()
        if p.is_dir() and p.name.isdigit())
               if args.index == -1 else [args.index])

    rows = []
    for idx in indices:
        rows.append(solve_incremental(domain, idx, args))

    if args.csv:
        _write_csv(domain / "result.csv", rows)


def _write_csv(path: Path, new_rows: List[Dict[str, Any]]):
    header = list(new_rows[0].keys())
    old: List[Dict[str, Any]] = []
    if path.exists():
        with path.open("r", newline="", encoding="utf-8") as f:
            rdr = csv.DictReader(f)
            header = rdr.fieldnames or header
            old = list(rdr)
    keep = {int(r["index"]): r for r in old}
    for r in new_rows:
        keep[int(r["index"])] = r
    with path.open("w", newline="", encoding="utf-8") as f:
        wr = csv.DictWriter(f, fieldnames=header)
        wr.writeheader()
        wr.writerows(keep.values())
    print(f"CSV updated → {path}")


# ─────────────────────────── entry ─────────────────────────────────────────
if __name__ == "__main__":
    run(parse_args())
