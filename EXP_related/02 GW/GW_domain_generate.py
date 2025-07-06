#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
gridworld_domain_generate.py

用法示例：
  python 03 GW/GW_domain_generate.py --width 50 --height 50 --boxes 3 --min-size 2 --max-size 8 --num 10 --seed 42

  # 指定起点终点，且不检查可达性
  python GW/GW_domain_generate.py -W 30 -H 30 -b 5 --start 2 2 --goal 25 25 --ensure-reachability False
"""
import argparse
import random
from collections import deque
from pathlib import Path
from tqdm import tqdm

CUR_DIR = Path(__file__).resolve().parent


# ---------- 基础几何工具 -------------------------------------------------
def cells_of_box(box):
    """生成 (x,y) 单元格坐标，box=(x1,y1,x2,y2) 均闭区间"""
    x1, y1, x2, y2 = box
    for x in range(x1, x2 + 1):
        for y in range(y1, y2 + 1):
            yield (x, y)


def boxes_overlap(b1, b2):
    """判定两矩形是否相交（含边接触算重叠）"""
    a1, b1_, a2, b2_ = b1
    c1, d1, c2, d2 = b2
    return not (a2 < c1 or c2 < a1 or b2_ < d1 or d2 < b1_)


def point_in_box(pt, box):
    x, y = pt
    x1, y1, x2, y2 = box
    return x1 <= x <= x2 and y1 <= y <= y2


def bfs_reachable(width, height, boxes, start, goal):
    """简单 BFS，在 4-邻域上检查 start→goal 可达"""
    blocked = {cell for box in boxes for cell in cells_of_box(box)}
    if start in blocked or goal in blocked:
        return False
    q, seen = deque([start]), {start}
    dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    while q:
        x, y = q.popleft()
        if (x, y) == goal:
            return True
        for dx, dy in dirs:
            nx, ny = x + dx, y + dy
            if 1 <= nx <= width and 1 <= ny <= height and (nx,
                                                           ny) not in blocked:
                if (nx, ny) not in seen:
                    seen.add((nx, ny))
                    q.append((nx, ny))
    return False


# ---------- 单个实例生成 -------------------------------------------------
def generate_one_instance(cfg, attempt_limit=1000):
    """返回 (boxes, start, goal)"""
    W, H = cfg.width, cfg.height
    rng = random.Random(cfg.seed)  # 局部 RNG，方便复现
    for attempt in range(attempt_limit):
        # 1. 随机放置障碍
        boxes = []
        for _ in range(cfg.boxes):
            for _inner in range(50):  # 试 50 次找不重叠的
                w = rng.randint(cfg.min_size, cfg.max_size)
                h = rng.randint(cfg.min_size, cfg.max_size)
                x1 = rng.randint(1, W - w + 1)
                y1 = rng.randint(1, H - h + 1)
                box = (x1, y1, x1 + w - 1, y1 + h - 1)
                if all(not boxes_overlap(box, b) for b in boxes):
                    boxes.append(box)
                    break
            else:
                # 50 次都放不下，整体重来
                break
        else:  # 成功放置完全部 boxes
            # 2. 起点终点
            if cfg.start:
                sx, sy = cfg.start
            else:
                sx, sy = rng.randint(1, W), rng.randint(1, H)

            if cfg.goal:
                gx, gy = cfg.goal
            else:
                gx, gy = rng.randint(1, W), rng.randint(1, H)

            # 3. 可达性检查
            if (not cfg.ensure_reachability) or bfs_reachable(
                    W, H, boxes, (sx, sy), (gx, gy)):
                return boxes, (sx, sy), (gx, gy)

    raise RuntimeError(
        f"Unable to generate a valid instance after {attempt_limit} attempts")


# ---------- 主入口 -------------------------------------------------------
def main():
    ap = argparse.ArgumentParser(
        description="Generate Grid-World ASP instances.")
    ap.add_argument("--width",
                    "-W",
                    type=int,
                    default=50,
                    help="Grid width (m).")
    ap.add_argument("--height",
                    "-H",
                    type=int,
                    default=50,
                    help="Grid height (n).")
    ap.add_argument("--boxes",
                    "-b",
                    type=int,
                    default=3,
                    help="Number of obstacle rectangles.")
    ap.add_argument("--min-size",
                    type=int,
                    default=2,
                    help="Min side length of a box.")
    ap.add_argument("--max-size",
                    type=int,
                    default=8,
                    help="Max side length of a box.")
    ap.add_argument("--num",
                    type=int,
                    default=10,
                    help="Number of instances to generate.")
    ap.add_argument("--start",
                    nargs=2,
                    type=int,
                    metavar=("X", "Y"),
                    help="Fixed start coordinate.")
    ap.add_argument("--goal",
                    nargs=2,
                    type=int,
                    metavar=("X", "Y"),
                    help="Fixed goal coordinate.")
    ap.add_argument("--ensure-reachability",
                    type=lambda s: s.lower() != "false",
                    default=True,
                    help="Guarantee start→goal path (default: True).")
    ap.add_argument("--seed", type=int, default=42, help="Random seed.")
    cfg = ap.parse_args()

    root = CUR_DIR / f"W{cfg.width}_H{cfg.height}_B{cfg.boxes}"
    root.mkdir(parents=True, exist_ok=True)
    rng = random.Random(cfg.seed)

    for i in tqdm(range(1, cfg.num + 1), desc="Generating instances"):
        cfg.seed = rng.randint(0, 2**31 - 1)
        boxes, start, goal = generate_one_instance(cfg)

        inst_dir = root / f"{i}"
        inst_dir.mkdir(exist_ok=True)
        inst_file = inst_dir / "instance.lp"
        goal_file = inst_dir / "goal.lp"

        with inst_file.open("w", encoding="utf-8") as f:
            f.write("#program base.\n\n")
            f.write(f"m({cfg.width}).\n")
            f.write(f"n({cfg.height}).\n\n")
            for (x1, y1, x2, y2) in boxes:
                f.write(f"obstacle_box({x1},{y1}, {x2},{y2}).\n")
            f.write("\n")
            f.write(f"init(at({start[0]},{start[1]})).\n")
            f.write(f"goal(at({goal[0]},{goal[1]})).\n")

        with goal_file.open("w", encoding="utf-8") as g:
            g.write("#program step(t).\n")
            g.write("goal_met(t):- h(at(X,Y), t), goal(at(X,Y)).\n")

    print("All instances are under:", root.resolve())


if __name__ == "__main__":
    main()
