#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# solve_clingo.py  ── ground-solve 资源 / related 计数 (改为了谓词中含 “related” 的计数)  → 支持批模式
# clingo 5.8.0，Python 3.8+

from __future__ import annotations
import argparse, csv, time
import os,sys
from pathlib import Path

from clingo import Control
from clingo.control import BackendType

def find_base_dir(target_dirname: str = "AAAI2025") -> Path:
    current = Path(__file__).resolve()
    for parent in current.parents:
        if parent.name == target_dirname:
            return parent
    raise RuntimeError(f"未在路径中找到名为 {target_dirname} 的父目录。请确认你的文件是否在该项目结构下。")

BASE_DIR = find_base_dir()
sys.path.append(str(BASE_DIR))

from deps.utils import _mb, _rss,  logger, all_constants_size

# ─────────────────────── CLI ────────────────────────────────────────────────
def parse_args() -> argparse.Namespace:
    p = argparse.ArgumentParser("ASP solver with rich statistics")
    p.add_argument("--domain", default="hc")
    p.add_argument("--index",
                   type=int,
                   default=1,
                   help="instance sub-folder; -1 ⇢ run all")
    p.add_argument("--models", type=int, default=1)
    p.add_argument("--threads", type=int, default=0)
    p.add_argument("--verbose", action="store_true")
    p.add_argument("--related",
                   action="store_true",
                   help="load solve_related.lp instead of solve.lp")
    p.add_argument("--csv",
                   action="store_true",
                   help="append/overwrite stats in <domain>/result_clingo.csv")
    p.add_argument('--time_limit', type=int, default=300)
    return p.parse_args()


# ───────────────────── Control ──────────────────────────────────────────────
def build_control(models: int, threads: int) -> Control:
    ctl = Control(arguments=["--stats=2"], logger=logger)
    ctl.configuration.solve.models = str(models)
    if threads == 0:
        import multiprocessing as mp
        threads = mp.cpu_count()
    ctl.configuration.solve.parallel_mode = str(max(1, threads))
    ctl.enable_cleanup = False
    return ctl

# ───────────────────── 单个实例求解 ──────────────────────────────────────────
def solve_one(domain: Path, idx: int, args) -> dict:
    domain = BASE_DIR / "Non-Inc-Domain" / args.domain
    base_lp = domain / "solve_related.lp" if args.related else domain / "solve.lp"
    inst_lp = domain / str(idx) / "instance.lp"
    ctl = build_control(args.models, args.threads)
    ctl.load(str(base_lp))
    ctl.load(str(inst_lp))

    aspif_path = BASE_DIR / "Non-Inc-Domain" / "temp" / f"temp_gc_gringo.aspif"
    ctl.register_backend(BackendType.Aspif, str(aspif_path), replace=False)
    
    # --- ground ------------------------------------------------------------
    t0 = time.perf_counter()
    m0 = _rss()
    ctl.ground([("base", [])])
    
    size_bytes = os.path.getsize(aspif_path)
    
    n_facts = sum(1 for a in ctl.symbolic_atoms if "related" in a.symbol.name and a.is_fact)
    n_nonfacts = sum(1 for a in ctl.symbolic_atoms if "related" in a.symbol.name and not a.is_fact)
    
    t1 = time.perf_counter()
    m1 = _rss()

    # --- solve -------------------------------------------------------------
    models = []
    s0 = time.perf_counter()
    ctl.solve(on_model=lambda m: models.append(
        [str(s) for s in m.symbols(shown=True)]))
    s1 = time.perf_counter()
    m2 = _rss()

    lp = ctl.statistics["problem"]["lp"]
    sign_idx = -idx if args.related else idx
    return {
        "index": sign_idx,
        "consts_size": all_constants_size(ctl),
        "rules": int(lp.get("rules", 0)),
        "atoms": int(lp.get("atoms", 0)),
        "t_ground": round(t1 - t0, 3),
        "t_solve": round(s1 - s0, 3),
        "ground_file_size_bytes": size_bytes,
        "mem_start_bytes": m0,
        "mem_ground_bytes": m1,
        "mem_solve_bytes": m2,
        "models": len(models),
        "rel_facts": n_facts,
        "rel_nonfacts": n_nonfacts,
        "rel_total": n_facts + n_nonfacts,
    }


# ─────────────────────── main runner ────────────────────────────────────────
def run(args: argparse.Namespace):
    domain_path = BASE_DIR / "Non-Inc-Domain" / args.domain
    rows: list[dict] = []

    if args.index == -1:
        args.verbose = False  
        args.csv = True  
        indices = sorted(
            int(p.name) for p in domain_path.iterdir()
            if p.is_dir() and p.name.isdigit())
    else:
        indices = [args.index]

    for idx in indices:
        stats = solve_one(domain_path, idx, args)
        rows.append(stats)
        if args.verbose: _print_summary(stats)

    if args.csv:
        _write_csv(domain_path / "result_clingo.csv", rows)


# ──────────────────── helpers ───────────────────────────────────────────────

def _print_summary(s: dict):
    print(f"\n===== SUMMARY (idx {s['index']}) =====")
    print(f"constants size            : {s['consts_size']}")
    print(f"Grounded rules/atoms      : {s['rules']:,} / {s['atoms']:,}")
    print(f"ground_file_size_bytes    : {s["ground_file_size_bytes"]} B")
    print(f"Time  ground | solve      : {s['t_ground']}s | {s['t_solve']}s")
    if s['mem_start_bytes'] is not None:
        print(f"Mem  start → ground       : {_mb(s['mem_start_bytes']):8.2f} → "
              f"{_mb(s['mem_ground_bytes']):8.2f} MB")
        print(f"Mem  ground → solve       : {_mb(s['mem_ground_bytes']):8.2f} → "
              f"{_mb(s['mem_solve_bytes']):8.2f} MB")
    print(f"Models enumerated         : {s['models']}")
    print(f"related_aux  facts|rules  : {s['rel_facts']} | {s['rel_nonfacts']}")


def _write_csv(path: Path, new_rows: list[dict]):
    header = list(new_rows[0].keys())
    old: list[dict] = []
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


# ────────────────────── entry ───────────────────────────────────────────────
if __name__ == "__main__":
    run(parse_args())
