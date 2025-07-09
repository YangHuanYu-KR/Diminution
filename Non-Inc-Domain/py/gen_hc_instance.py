#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
生成 Hamiltonian-cycle 测试实例（instance.lp）。

功能
------
1. 自动在 <domain>/<index>/instance.lp 写入实例文件  
2. 支持批量生成，index 按现有最大值递增  
3. 可指定节点数、是否全连通、冗余边比例

使用
------
python gen_hc_instance.py                 # 生成 1 份默认实例
python gen_hc_instance.py -n 20 -r 0.6   # 20 节点，冗余率 0.6
python gen_hc_instance.py -b 5 --complete
python gen_hc_instance.py --domain data --index -1 -n 30

参数说明
------
--domain/-d    根目录（默认 hc）
--index/-i     起始 index；-1 = 自动使用当前最大 index+1
--batch/-b     批量个数（默认 1）
--nodes/-n     节点数量 N（≥3，默认 10）
--complete/-c  生成全连通图（忽略冗余率）
--redundancy/-r  冗余率 ∈ [0, N/2]；0 = 纯环，N/2 ≈ 完全图
"""
from __future__ import annotations

import argparse
import json
import random
from itertools import combinations
from pathlib import Path
from typing import List, Tuple


# ─────────────────── CLI ──────────────────────────────────────────────────
def parse_args():
    p = argparse.ArgumentParser(
        description="Generate Hamiltonian-cycle instances")
    p.add_argument("-d", "--domain", default="hc")
    p.add_argument("-i",
                   "--index",
                   type=int,
                   default=-1,
                   help="-1: auto-assign next index")
    p.add_argument("-b",
                   "--batch",
                   type=int,
                   default=1,
                   help="number of instances to generate")
    p.add_argument("-n", "--nodes", type=int, default=10)
    p.add_argument("-c",
                   "--complete",
                   action="store_true",
                   help="make the graph fully connected")
    p.add_argument("-r",
                   "--redundancy",
                   type=float,
                   default=0.0,
                   help="extra-edge rate (ignored if --complete)")
    p.add_argument("--seed",
                   type=int,
                   default=42,
                   help="master random seed (changes every batch item)")
    return p.parse_args()


# ──────────────── Instance generator ──────────────────────────────────────
Edge = Tuple[int, int]


def build_content(N: int, complete: bool, redund_rate: float,
                  rng: random.Random) -> tuple[str, List[Edge], List[Edge]]:
    """Return (lp_content, cycle_edges, extra_edges)."""
    lines: List[str] = []

    lines.append(f"n({N}).")
    lines.extend(f"node({i})." for i in range(1, N))
    lines.append(f"edge(0,1).")

    if complete:
        lines.append("edge(V1,V2) :- node(V1), node(V2).")
        return "\n".join(lines) + "\n", [], []

    # 1) 基本哈密尔顿环
    cycle_edges = [(v, v + 1) for v in range(1, N - 1)] + [(N - 1, 1)]
    lines.extend(f"edge({u},{v})." for u, v in cycle_edges)

    # 2) 冗余边
    all_pairs = {tuple(sorted(p)) for p in combinations(range(1, N), 2)}
    used_pairs = {tuple(sorted(e)) for e in cycle_edges}
    unused = list(all_pairs - used_pairs)
    rng.shuffle(unused)

    # 最大理论冗余率 ≈ N/2（补齐至完全图）
    extra_cnt = min(int(redund_rate * N), len(unused))
    extra_edges = [tuple(sorted(unused[i])) for i in range(extra_cnt)]
    lines.extend(f"edge({u},{v})." for u, v in extra_edges)

    return "\n".join(lines) + "\n", cycle_edges, extra_edges


# ──────────────── Directory helpers ───────────────────────────────────────
def next_index(domain: Path) -> int:
    idxs = [
        int(p.name) for p in domain.iterdir()
        if p.is_dir() and p.name.isdigit()
    ]
    return (max(idxs) + 1) if idxs else 1


def write_instance(domain: Path, idx: int, lp: str, meta: dict):
    inst_dir = domain / str(idx)
    inst_dir.mkdir(parents=True, exist_ok=True)
    (inst_dir / "instance.lp").write_text(lp, encoding="utf-8")
    (inst_dir / "params.json").write_text(json.dumps(meta,
                                                     indent=2,
                                                     ensure_ascii=False),
                                          encoding="utf-8")


# ─────────────────── main ─────────────────────────────────────────────────
def main():
    args = parse_args()
    if args.nodes < 3: raise ValueError("nodes must be ≥3")
    if not args.complete and not (0 <= args.redundancy <= args.nodes / 2):
        raise ValueError("redundancy out of range")

    domain = Path(args.domain)
    domain.mkdir(exist_ok=True)

    start_idx = next_index(domain) if args.index == -1 else args.index
    master_rng = random.Random(args.seed)

    for k in range(args.batch):
        idx = start_idx + k
        sub_seed = master_rng.randint(0, 2**31 - 1)
        rng = random.Random(sub_seed)

        lp, cycle_edges, extra_edges = build_content(args.nodes, args.complete,
                                                     args.redundancy, rng)

        meta = {
            "index": idx,
            "domain": args.domain,
            "nodes": args.nodes,
            "complete": args.complete,
            "redundancy": args.redundancy if not args.complete else 1.0,
            "seed": sub_seed,
            "cycle_edges": cycle_edges,
            "extra_edges": extra_edges,
        }
        write_instance(domain, idx, lp, meta)
        print(f"[ok] wrote {domain}/{idx}/instance.lp & params.json")


if __name__ == "__main__":
    main()
