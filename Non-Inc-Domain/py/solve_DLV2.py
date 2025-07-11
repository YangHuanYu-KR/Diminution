#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
solve_dlv2.py — Run ASP instances with DLV2 via subprocess
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
关注字段：Atoms, Constraints, Normal rules, Disjunctive rules, Choice rules,
  Counts, Sums, Weak constraints, Variables, Tight, Cyclic components,
  Atoms in component 1, Non-ground program parsing time, Grounding time,
  Solving time。
解析器 parse_dlv2_stats 现仅收集上述键；其余行直接忽略。
其余流程（verbose/CSV 合并）保持不变。
"""

from __future__ import annotations

import argparse
import csv
import subprocess
import time
import sys
from pathlib import Path
from typing import Dict, List


def find_base_dir(target_dirname: str = "AAAI2025") -> Path:
    current = Path(__file__).resolve()
    for parent in current.parents:
        if parent.name == target_dirname:
            return parent
    raise RuntimeError(f"未在路径中找到名为 {target_dirname} 的父目录。请确认你的文件是否在该项目结构下。")


BASE_DIR = find_base_dir()
sys.path.append(str(BASE_DIR))

from deps.utils import _mb, _rss, parse_dlv2_stats

# ───── CLI ────────────────────────────────────────────────────────────────


def parse_args() -> argparse.Namespace:
    p = argparse.ArgumentParser("ASP solver (DLV2 via subprocess)")
    p.add_argument("--domain", default="hc")
    p.add_argument("--index",
                   type=int,
                   default=1,
                   help="instance sub-folder；-1⇢run all")
    p.add_argument("--models",
                   type=int,
                   default=1,
                   help="max models per run  (DLV2 -n=<m>)")
    p.add_argument("--related",
                   action="store_true",
                   help="load solve_related.lp instead of solve.lp")
    p.add_argument("--csv",
                   action="store_true",
                   help="append/overwrite stats in <domain>/result_DLV2.csv")
    p.add_argument("--verbose", action="store_true")
    p.add_argument("--dlv2-path",
                   default="deps/dlv-2.1.2-win64.exe",
                   help="absolute path to dlv2 binary")
    # p.add_argument("--dlv2-path",
    #                default="deps/dlv-2.1.2-arm64",
    #                help="absolute path to dlv2 binary")
    return p.parse_args()


# ───── helpers ────────────────────────────────────────────────────────────


def _print_summary(d: Dict[str, object]):
    print(f"===== SUMMARY (idx {d['index']}) =====")
    for k in sorted(d):
        if k == "index":
            continue
        val = d[k]
        if k in ("mem_start_mb", "mem_solve_mb"):
            try:
                num = float(val)
                if num > 1024 * 10:
                    num = _mb(num)
                val = f"{num:.2f} MB"
            except (TypeError, ValueError):
                pass
        print(f"{k:<20}: {val}")


def _write_csv(path: Path, new_rows: List[Dict[str, object]]):
    existing: Dict[str, Dict[str, str]] = {}
    if path.exists():
        with path.open("r", newline="", encoding="utf-8") as f:
            for row in csv.DictReader(f):
                existing[row["index"]] = row
    for r in new_rows:
        idx = str(r["index"])
        existing[idx] = {
            **existing.get(idx, {}),
            **{
                k: str(v)
                for k, v in r.items()
            }
        }
    header: List[str] = []
    for row in existing.values():
        for k in row.keys():
            if k not in header:
                header.append(k)
    with path.open("w", newline="", encoding="utf-8") as f:
        wr = csv.DictWriter(f, fieldnames=header)
        wr.writeheader()
        wr.writerows(existing.values())


# ───── single instance solve ─────────────────────────────────────────────


def solve_one(domain: Path, idx: int,
              args: argparse.Namespace) -> Dict[str, object]:
    domain = BASE_DIR / "Non-Inc-Domain" / args.domain
    base_lp = domain / ("solve_related.lp" if args.related else "solve.lp")
    inst_lp = domain / str(idx) / "instance.lp"

    dlv2_exec = BASE_DIR / args.dlv2_path
    m0 = _rss()
    t0 = time.perf_counter()

    proc = subprocess.run(
        [
            dlv2_exec,
            "--stats=2",
            f"-n={args.models}",
            str(base_lp),
            str(inst_lp),
        ],
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
    )
    if proc.returncode != 0:
        raise RuntimeError(
            f"DLV2 exited with {proc.returncode}:\n{proc.stdout}")

    t1 = time.perf_counter()
    m1 = _rss()
    raw = proc.stdout

    idlv_proc = subprocess.run(
        [
            str(dlv2_exec),
            "--mode=idlv",
            str(base_lp),
            str(inst_lp),
        ],
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
    )
    idlv_output = idlv_proc.stdout

    out_file = BASE_DIR / "Non-Inc-Domain" / "temp" / f"temp_gc_idlv.aspif"
    out_file.write_text(idlv_output, encoding="utf-8")
    file_size_bytes = out_file.stat().st_size

    sign_idx = -idx if args.related else idx
    stats: Dict[str, object] = {
        "index": sign_idx,
        "t_solve_python": round(t1 - t0, 3),
        "mem_start_bytes": m0,
        "mem_solve_bytes": m1,
        "ground_file_bytes": file_size_bytes
    }
    stats.update(parse_dlv2_stats(raw))
    return stats


# ───── batch runner ──────────────────────────────────────────────────────


def run(args: argparse.Namespace):
    domain_path = Path(args.domain)
    rows: List[Dict[str, object]] = []

    indices = (sorted(
        int(p.name) for p in domain_path.iterdir()
        if p.is_dir() and p.name.isdigit())
               if args.index == -1 else [args.index])
    if args.index == -1:
        args.verbose = False
        args.csv = True

    for idx in indices:
        row = solve_one(domain_path, idx, args)
        rows.append(row)
        if args.verbose:
            _print_summary(row)

    if args.csv and rows:
        _write_csv(domain_path / "result_DLV2.csv", rows)


# ───── entry ─────────────────────────────────────────────────────────────

if __name__ == "__main__":
    run(parse_args())
