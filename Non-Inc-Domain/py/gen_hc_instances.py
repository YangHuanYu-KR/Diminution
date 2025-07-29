#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
生成 Hamiltonian-cycle 测试实例（instance.lp）。

功能
------
1. 自动在 <domain>/Instances/<index>/instance.lp 写入实例文件  
2. 支持批量生成，index 按现有最大值递增  
3. 可通过 --redundancy 指定固定或区间冗余率  
4. 可通过 --random 从 0 到 N/2 之间的全区间随机选取冗余率

使用示例
------
# 固定冗余率 0.6
python gen_hc_instance.py -n 20 -r 0.6   
# 冗余率 ∈ [0.2,0.8] 随机
python gen_hc_instance.py -n 20 -r 0.2 0.8  
# 从 [0, N/2] 区间随机
python gen_hc_instance.py -n 20 -R
# 完全连通，忽略冗余
python gen_hc_instance.py -n 20 -c
"""
from __future__ import annotations

import argparse
import json
import random
from itertools import combinations
from pathlib import Path
from typing import List, Tuple

Edge = Tuple[int, int]


def parse_args():
    p = argparse.ArgumentParser(
        description="Generate Hamiltonian-cycle instances")
    p.add_argument("-d", "--domain", default="hc", help="根目录（默认 hc）")
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
    p.add_argument("-n", "--nodes", type=int, default=10, help="节点数量 N（≥3）")
    p.add_argument("-c",
                   "--complete",
                   action="store_true",
                   help="make the graph fully connected")
    p.add_argument("-r",
                   "--redundancy",
                   type=float,
                   nargs="+",
                   default=[0.0],
                   help=("extra-edge rate；"
                         "提供 1 个值则固定；提供 2 个值则为 [min, max] 范围随机"))
    p.add_argument("-R",
                   "--random",
                   action="store_true",
                   help="从 [0, N/2] 区间均匀随机选取冗余率（优先级高于 -r）")
    p.add_argument("--seed", type=int, default=42, help="master random seed")
    return p.parse_args()


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

    # cycle
    cycle_edges = [(v, v + 1) for v in range(1, N - 1)] + [(N - 1, 1)]
    lines.extend(f"edge({u},{v})." for u, v in cycle_edges)

    # extra edges
    all_pairs = {tuple(sorted(p)) for p in combinations(range(1, N), 2)}
    used_pairs = {tuple(sorted(e)) for e in cycle_edges}
    unused = list(all_pairs - used_pairs)
    rng.shuffle(unused)

    extra_cnt = min(int(redund_rate * N), len(unused))
    extra_edges = [tuple(sorted(unused[i])) for i in range(extra_cnt)]
    lines.extend(f"edge({u},{v})." for u, v in extra_edges)

    return "\n".join(lines) + "\n", cycle_edges, extra_edges


def next_index(domain: Path) -> int:
    idxs = [
        int(p.name) for p in domain.iterdir()
        if p.is_dir() and p.name.isdigit()
    ]
    return (max(idxs) + 1) if idxs else 1


def write_instance(domain: Path, idx: int, lp: str, meta: dict):
    inst_dir = domain / "Instances" / str(idx)
    inst_dir.mkdir(parents=True, exist_ok=True)
    (inst_dir / "instance.lp").write_text(lp, encoding="utf-8")
    (inst_dir / "params.json").write_text(json.dumps(meta,
                                                     indent=2,
                                                     ensure_ascii=False),
                                          encoding="utf-8")


def main():
    args = parse_args()

    if args.nodes < 3:
        raise ValueError("nodes must be ≥3")

    # parse redundancy range from -r
    reds = args.redundancy
    if len(reds) not in (1, 2):
        raise ValueError("--redundancy requires 1 or 2 floats")
    min_r, max_r = reds[0], reds[-1]

    if not args.complete and not args.random:
        # only validate when not complete 且 非 random 模式
        if not (0.0 <= min_r <= args.nodes / 2
                and 0.0 <= max_r <= args.nodes / 2 and min_r <= max_r):
            raise ValueError("冗余率必须满足 0 ≤ min ≤ max ≤ nodes/2")

    domain = Path(args.domain)
    domain.mkdir(exist_ok=True)

    start_idx = next_index(domain /
                           "Instances") if args.index == -1 else args.index
    master_rng = random.Random(args.seed)

    for k in range(args.batch):
        idx = start_idx + k
        sub_seed = master_rng.randint(0, 2**31 - 1)
        rng = random.Random(sub_seed)

        # 选取冗余率
        if args.complete:
            chosen_r = 1.0
        elif args.random:
            chosen_r = rng.uniform(0.0, args.nodes / 2)
        else:
            chosen_r = rng.uniform(min_r, max_r)

        lp, cycle_edges, extra_edges = build_content(args.nodes, args.complete,
                                                     chosen_r, rng)

        meta = {
            "index": idx,
            "domain": args.domain,
            "nodes": args.nodes,
            "complete": args.complete,
            "redundancy": chosen_r,
            "seed": sub_seed,
            "cycle_edges": cycle_edges,
            "extra_edges": extra_edges,
        }
        write_instance(domain, idx, lp, meta)
        print(f"[ok] wrote {domain}/Instances/{idx}/instance.lp & params.json")


if __name__ == "__main__":
    main()
