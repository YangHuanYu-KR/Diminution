#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
GW_domain_generate.py  ——  Grid-World ASP instance generator
------------------------------------------------------------

示例
=====
在目录 .\Inc-Domain 下

# 生成 1 份默认实例，自动放到 gw/1/instance.lp
python py/GW_domain_generate.py

# 批量 10 份，50×50，3 个盒子，index 自动续号
python py/GW_domain_generate.py -b 10 -W 50 -H 50 --boxes 3

# 指定 index=5 起步，起点终点固定，可达性不检查
python py/GW_domain_generate.py -i 5 --start 2 2 --goal 25 25 --ensure-reachability False
"""
from __future__ import annotations
import json
import random
import argparse, random
from collections import deque
from itertools import chain
from pathlib import Path
from typing import List, Tuple
from tqdm import tqdm

# ────────────────────────────── 几何工具 ───────────────────────────────────
Box = Tuple[int, int, int, int]
Coord = Tuple[int, int]
CellsSet = set[Coord]


def cells_of_box(box: Box) -> List[Coord]:
    x1, y1, x2, y2 = box
    return [(x, y) for x in range(x1, x2 + 1) for y in range(y1, y2 + 1)]


def boxes_overlap(b1: Box, b2: Box) -> bool:
    (a1, b1_, a2, b2_), (c1, d1, c2, d2) = b1, b2
    return not (a2 < c1 or c2 < a1 or b2_ < d1 or d2 < b1_)


def bfs_reachable(w: int, h: int, boxes: List[Box], s: Coord,
                  g: Coord) -> bool:
    blocked: CellsSet = set(chain.from_iterable(
        cells_of_box(b) for b in boxes))
    if s in blocked or g in blocked:
        return False

    dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    q, seen = deque([s]), {s}
    while q:
        x, y = q.popleft()
        if (x, y) == g:
            return True
        for dx, dy in dirs:
            nx, ny = x + dx, y + dy
            if 1 <= nx <= w and 1 <= ny <= h and (nx, ny) not in blocked:
                if (nx, ny) not in seen:
                    seen.add((nx, ny))
                    q.append((nx, ny))
    return False


# ────────────────────────────── 单实例生成 ─────────────────────────────────
def generate_one(cfg, rng: random.Random) -> Tuple[List[Box], Coord, Coord]:
    W, H = cfg.width, cfg.height
    for _ in range(1000):
        boxes: List[Box] = []

        for _ in range(cfg.boxes):
            for _inner in range(50):
                w = rng.randint(cfg.min_size, cfg.max_size)
                h = rng.randint(cfg.min_size, cfg.max_size)
                x1 = rng.randint(1, W - w + 1)
                y1 = rng.randint(1, H - h + 1)
                box = (x1, y1, x1 + w - 1, y1 + h - 1)
                if all(not boxes_overlap(box, b) for b in boxes):
                    boxes.append(box)
                    break
            else:
                break
        else:

            sx, sy = cfg.start if cfg.start else (rng.randint(1, W),
                                                  rng.randint(1, H))
            gx, gy = cfg.goal if cfg.goal else (rng.randint(1, W),
                                                rng.randint(1, H))
            manhattan = abs(sx - gx) + abs(sy - gy)
            if (not cfg.ensure_reachability) or bfs_reachable(
                    W, H, boxes, (sx, sy), (gx, gy)):
                if manhattan <= 100:
                    return boxes, (sx, sy), (gx, gy)
    raise RuntimeError(
        "Failed to generate a valid instance after 1000 attempts")


# ──────────────────────────────── CLI ─────────────────────────────────────
def parse_args():
    ap = argparse.ArgumentParser("Generate Grid-World ASP instances")
    ap.add_argument("-d",
                    "--domain",
                    default="gw/Instances",
                    help="root folder for instances")
    ap.add_argument("-i",
                    "--index",
                    type=int,
                    default=-1,
                    help="-1: auto-next index else start index")
    ap.add_argument("-b",
                    "--batch",
                    type=int,
                    default=1,
                    help="number of instances to generate")

    ap.add_argument("-W", "--width", type=int, default=50)
    ap.add_argument("-H", "--height", type=int, default=50)
    ap.add_argument("--boxes", type=int, default=3, dest="boxes")
    ap.add_argument("--min-size", type=int, default=2)
    ap.add_argument("--max-size", type=int, default=8)
    ap.add_argument("--start", nargs=2, type=int, metavar=("X", "Y"))
    ap.add_argument("--goal", nargs=2, type=int, metavar=("X", "Y"))
    ap.add_argument("--ensure-reachability",
                    type=lambda s: s.lower() != "false",
                    default=True,
                    help="ensure start→goal path (default: True)")
    ap.add_argument("--seed", type=int, default=42)
    return ap.parse_args()


# ──────────────────────────── Dir helpers ─────────────────────────────────
def next_index(domain: Path) -> int:
    idxs = [
        int(p.name) for p in domain.iterdir()
        if p.is_dir() and p.name.isdigit()
    ]
    return (max(idxs) + 1) if idxs else 1


def write_files(dir_: Path, boxes: List[Box], start: Coord, goal: Coord, cfg,
                idx: int):
    """写入 instance.lp 以及 params.json"""
    dir_.mkdir(parents=True, exist_ok=True)
    inst = dir_ / "instance.lp"
    params_json = dir_ / "params.json"

    # 1) ASP instance file
    with inst.open("w", encoding="utf-8") as f:
        f.write(f"m(1..{cfg.width}).\n")
        f.write(f"n(1..{cfg.height}).\n\n")
        for (x1, y1, x2, y2) in boxes:
            f.write(f"obstacle_box({x1},{y1}, {x2},{y2}).\n")
        f.write("\n")
        f.write(f"init(at({start[0]},{start[1]})).\n")
        f.write(f"goal(at({goal[0]},{goal[1]})).\n")

    # 3) Generation metadata
    meta = {
        "index": idx,
        "domain": cfg.domain,
        "width": cfg.width,
        "height": cfg.height,
        "boxes": cfg.boxes,
        "min_size": cfg.min_size,
        "max_size": cfg.max_size,
        "actual_boxes": boxes,
        "start": start,
        "goal": goal,
        "ensure_reachability": cfg.ensure_reachability,
        "seed": cfg.seed,
    }
    with params_json.open("w", encoding="utf-8") as meta_f:
        json.dump(meta, meta_f, indent=2, ensure_ascii=False)


# ─────────────────────────────── main ─────────────────────────────────────
def main():
    cfg = parse_args()
    if cfg.min_size > cfg.max_size:
        raise ValueError("min-size cannot exceed max-size")

    domain = Path(cfg.domain)
    domain.mkdir(exist_ok=True)
    start_idx = next_index(domain) if cfg.index == -1 else cfg.index

    rng_master = random.Random(cfg.seed)

    for k in tqdm(range(cfg.batch), desc="Generating instances"):
        cfg.seed = rng_master.randint(0, 2**31 - 1)
        rng = random.Random(cfg.seed)
        boxes, start, goal = generate_one(cfg, rng)

        idx = start_idx + k
        write_files(domain / str(idx), boxes, start, goal, cfg, idx)
        print(f"wrote {domain}/{idx}/instance.lp")
    print("All instances saved under:", domain.resolve())


if __name__ == "__main__":
    main()
