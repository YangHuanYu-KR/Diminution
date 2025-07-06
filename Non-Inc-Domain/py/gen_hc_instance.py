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

import argparse, random
from pathlib import Path
from itertools import combinations


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
    return p.parse_args()


# ──────────────── Instance generator ──────────────────────────────────────
def build_content(N: int, complete: bool, redund_rate: float) -> str:
    lines = [f"#const n={N}.", f"node(1..n-1).", "edge(0,1)."]

    # 完全图：用规则一次性定义
    if complete:
        lines.append("edge(V1,V2) :- node(V1), node(V2).")
        return "\n".join(lines) + "\n"

    # 1) 基本哈密尔顿环
    cycle_edges = [(v, v + 1) for v in range(1, N - 1)] + [(N - 1, 1)]
    lines.extend(f"edge({u},{v})." for u, v in cycle_edges)

    # 2) 计算可选冗余边集合
    unused = list({tuple(sorted(p))
                   for p in combinations(range(1, N), 2)} -
                  {tuple(sorted(e))
                   for e in cycle_edges})
    random.shuffle(unused)

    # 最大理论冗余率 = N/2（补齐到完全图）
    max_extra = len(unused)
    extra_cnt = min(int(redund_rate * N), max_extra)
    extra_edges = unused[:extra_cnt]

    lines.extend(f"edge({u},{v})." for u, v in extra_edges)
    return "\n".join(lines) + "\n"


# ──────────────── Directory helpers ───────────────────────────────────────
def next_index(domain: Path) -> int:
    idxs = [
        int(p.name) for p in domain.iterdir()
        if p.is_dir() and p.name.isdigit()
    ]
    return (max(idxs) + 1) if idxs else 1


def write_instance(domain: Path, idx: int, content: str):
    inst_dir = domain / str(idx)
    inst_dir.mkdir(parents=True, exist_ok=True)
    (inst_dir / "instance.lp").write_text(content, encoding="utf-8")


# ─────────────────── main ─────────────────────────────────────────────────
def main():
    args = parse_args()
    if args.nodes < 3: raise ValueError("nodes must be ≥3")
    if not args.complete and not (0 <= args.redundancy <= args.nodes / 2):
        raise ValueError("redundancy out of range")

    domain = Path(args.domain)
    domain.mkdir(exist_ok=True)

    # 确定起始 index
    start_idx = next_index(domain) if args.index == -1 else args.index

    for k in range(args.batch):
        idx = start_idx + k
        content = build_content(args.nodes, args.complete, args.redundancy)
        write_instance(domain, idx, content)
        print(f"[ok] wrote {domain}/{idx}/instance.lp")


if __name__ == "__main__":
    main()
