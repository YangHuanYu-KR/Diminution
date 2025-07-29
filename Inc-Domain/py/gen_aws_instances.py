#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
grid_instance_generator.py
==========================
随机批量生成 Asprilo/Grid‑World 风格的 ASP 实例文件。

★ 仅需 5 个必填参数：
    W H PRODUCTS SHELVES ORDERS MAX_LINES
  其余（拣货位数、机器人数、库存量等）脚本自动推导。

★ 调用示例
    python grid_instance_generator.py 20 12 15 40 25 4 \
           -n 5 -o Random-Domain/gw

生成目录结构：
    Random-Domain/gw/1/instance.lp
    Random-Domain/gw/2/instance.lp
    ...
"""
from __future__ import annotations

import argparse, random, textwrap
from collections import defaultdict
from itertools import product
from pathlib import Path


# ───────────────────────────── 通用工具 ──────────────────────────────
def next_instance_index(root: Path) -> int:
    """返回 root 下下一个可用子目录编号（1 起）"""
    existing = [
        int(p.name) for p in root.iterdir() if p.is_dir() and p.name.isdigit()
    ]
    return 1 if not existing else max(existing) + 1


# ───────────────────────────── 布局生成 ──────────────────────────────
def generate_highways_random(
        W: int,
        H: int,
        n_rows: int | None = None,
        n_cols: int | None = None) -> set[tuple[int, int]]:
    """边框 + 随机若干横/纵通道"""
    hw: set[tuple[int, int]] = set()

    # 1) 四周
    hw.update({(x, 1) for x in range(1, W + 1)})
    hw.update({(x, H) for x in range(1, W + 1)})
    hw.update({(1, y) for y in range(1, H + 1)})
    hw.update({(W, y) for y in range(1, H + 1)})

    # 2) 随机挑行/列
    rng = random.Random()
    n_rows = n_rows or max(1, H // 4)
    n_cols = n_cols or max(1, W // 4)
    rows = rng.sample(range(2, H), k=min(n_rows, max(0, H - 2)))
    cols = rng.sample(range(2, W), k=min(n_cols, max(0, W - 2)))

    for y in rows:
        hw.update({(x, y) for x in range(1, W + 1)})
    for x in cols:
        hw.update({(x, y) for y in range(1, H + 1)})

    return hw


def auto_derive_counts(W: int, H: int) -> tuple[int, int]:
    """根据尺寸推断拣货位数、机器人数"""
    n_ps = max(1, min(4, (W + 3) // 4))  # 每 ~4 列一个
    n_bot = n_ps + max(1, (W * H) // 120)  # 每 PS 配一台 + 少量冗余
    return n_ps, n_bot


def generate_shelves(W: int, H: int, count: int,
                     forbidden: set[tuple[int, int]]) -> list[tuple[int, int]]:
    """在非高速道/拣货位的内部区域随机布置货架"""
    area = [(x, y) for x, y in product(range(2, W), range(3, H - 1))]
    usable = [c for c in area if c not in forbidden]
    if len(usable) < count:
        raise ValueError("可用空间不足以放置全部货架，请减小货架数或增大地图")
    return random.sample(usable, count)


# ─────────────────────────── 订单 ➊ → 库存 ➋ ───────────────────────────
def plan_orders_then_stock(
        num_products: int,
        num_orders: int,
        max_lines: int,
        max_qty_per_line: int = 3) -> tuple[dict, list[int]]:
    """先生成订单，统计需求，再按需求×1.2 规划库存"""
    rng = random.Random()
    orders: dict[int, dict] = {}
    demand = [0] * (num_products + 1)  # 1‑based

    for oid in range(1, num_orders + 1):
        k = rng.randint(1, max_lines)
        prods = rng.sample(range(1, num_products + 1), k=k)
        lines = []
        for pid in prods:
            qty = rng.randint(1, max_qty_per_line)
            demand[pid] += qty
            lines.append((pid, qty))
        orders[oid] = {"lines": lines}  # PS ID 稍后填写

    stock = [0]  # index 0 unused
    for need in demand[1:]:
        s = max(3, int(need * 1.2 + 0.999))  # 至少 3 件，向上取整
        stock.append(s)
    return orders, stock  # list[units per product]


# ───────────────────────────── 写文件 ────────────────────────────────
def dump_instance(path: Path, W: int, H: int, highways: list[tuple[int, int]],
                  shelves: list[tuple[int, int]],
                  picking_stations: list[tuple[int,
                                               int]], robots: list[tuple[int,
                                                                         int]],
                  products: dict[int, list[tuple[int,
                                                 int]]], orders: dict[int,
                                                                      dict]):
    lines: list[str] = []
    # 统计头
    lines.extend([
        "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%",
        f"% Grid Size X:                      {W}",
        f"% Grid Size Y:                      {H}",
        f"% Number of Nodes:                  {W * H}",
        f"% Number of Highway Nodes:          {len(highways)}",
        f"% Number of Robots:                 {len(robots)}",
        f"% Number of Shelves:                {len(shelves)}",
        f"% Number of Picking Stations:       {len(picking_stations)}",
        f"% Number of Products:               {len(products)}",
        f"% Number of Product Units in Total: {sum(len(u) for u in products.values())}",
        f"% Number of Orders:                 {len(orders)}",
        "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%", "",
        "#program base."
    ])

    def emit(obj: str, oid: int, prop: str, val: str):
        lines.append(f"init(object({obj},{oid}),value({prop},({val}))).")

    # 高速道
    for hid, (x, y) in enumerate(highways, start=1):
        emit("highway", hid, "at", f"{x},{y}")

    # 全节点
    nid = 1
    for y in range(1, H + 1):
        for x in range(1, W + 1):
            emit("node", nid, "at", f"{x},{y}")
            nid += 1

    # 拣货位
    for pid, (x, y) in enumerate(picking_stations, start=1):
        emit("pickingStation", pid, "at", f"{x},{y}")

    # 机器人
    for rid, (x, y) in enumerate(robots, start=1):
        emit("robot", rid, "at", f"{x},{y}")

    # 货架
    for sid, (x, y) in enumerate(shelves, start=1):
        emit("shelf", sid, "at", f"{x},{y}")

    # 商品
    for pid, units in products.items():
        for sid, slot in units:
            emit("product", pid, "on", f"{sid},{slot}")

    # 订单
    for oid, info in orders.items():
        for pid, qty in info["lines"]:
            emit("order", oid, "line", f"{pid},{qty}")
        emit("order", oid, "pickingStation", info["ps"])

    path.write_text("\n".join(lines), encoding="utf-8")


# ─────────────────────────── 实例生成主函数 ───────────────────────────
def generate_instance_random(W: int, H: int, n_products: int, n_shelves: int,
                             n_orders: int, max_lines: int) -> dict:
    random.seed()  # 让每次调用都独立随机；可改成固定种子

    # 0) 推断拣货位 & 机器人数量
    n_ps, n_robots = auto_derive_counts(W, H)

    # 1) 随机高速道
    highways = sorted(generate_highways_random(W, H))

    # 2) 拣货位：第一行高速道（排除两端）
    ps_candidates = [(x, 1) for x in range(2, W) if (x, 1) in highways]
    if len(ps_candidates) < n_ps:
        raise ValueError("高速道太少，容纳不下自动推断的拣货位数")
    picking_stations = random.sample(ps_candidates, n_ps)
    forbidden = set(highways) | set(picking_stations)

    # 3) 货架
    shelves = generate_shelves(W, H, n_shelves, forbidden)
    forbidden |= set(shelves)

    # 4) 机器人：放在底边高速道随机位置
    bottom_hw = [(x, H) for (x, y) in highways if y == H]
    robots = random.sample(bottom_hw, n_robots)

    # 5) 先生成订单 → 再规划库存
    orders, units_per_product = plan_orders_then_stock(n_products, n_orders,
                                                       max_lines)

    # 为订单指定拣货位
    for order in orders.values():
        order["ps"] = random.randint(1, n_ps)

    # 6) 把库存分配到货架槽
    shelf_slot_counter = defaultdict(int)  # shelfID -> used slots
    products: dict[int, list[tuple[int, int]]] = defaultdict(list)
    for pid, total_units in enumerate(units_per_product[1:], start=1):
        for _ in range(total_units):
            sid = random.randint(1, n_shelves)
            shelf_slot_counter[sid] += 1
            slot = shelf_slot_counter[sid]
            products[pid].append((sid, slot))

    return dict(W=W,
                H=H,
                highways=highways,
                shelves=shelves,
                picking_stations=picking_stations,
                robots=robots,
                products=products,
                orders=orders)


# ──────────────────────────── CLI & 主入口 ───────────────────────────
def main():
    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawDescriptionHelpFormatter,
        description=textwrap.dedent("""
        随机批量生成 Asprilo/Grid‑World 实例。

        必填参数：W H PRODUCTS SHELVES ORDERS MAX_LINES
          W, H              -- 网格尺寸
          PRODUCTS          -- 商品种类数
          SHELVES           -- 货架数量
          ORDERS            -- 订单数量
          MAX_LINES         -- 单张订单最多包含的商品行数

        其它：
          -n/--num N        -- 生成 N 份实例 (默认 1)
          -o/--out DIR      -- 输出根目录 (默认 Inc-Domain/gw)

        例：
          python py\gen_aws_instances.py 20 12 15 40 25 4 -n 5 -o Random-Domain/gw
        """))

    parser.add_argument("W", type=int, help="网格宽度")
    parser.add_argument("H", type=int, help="网格高度")
    parser.add_argument("PRODUCTS", type=int, help="商品种类数")
    parser.add_argument("SHELVES", type=int, help="货架数量")
    parser.add_argument("ORDERS", type=int, help="订单数量")
    parser.add_argument("MAX_LINES", type=int, help="单张订单最多包含的商品行数")

    parser.add_argument("-b",
                        "--batch",
                        type=int,
                        default=10,
                        help="一次生成多少份实例 (默认 10)")
    parser.add_argument(
        "-o",
        "--out",
        type=Path,
        default=Path("aws/Instances"),
    )

    args = parser.parse_args()

    args.out.mkdir(parents=True, exist_ok=True)
    index = next_instance_index(args.out)

    for _ in range(args.batch):
        data = generate_instance_random(args.W, args.H, args.PRODUCTS,
                                        args.SHELVES, args.ORDERS,
                                        args.MAX_LINES)

        inst_dir = args.out / str(index)
        inst_dir.mkdir(parents=True, exist_ok=True)
        dump_instance(inst_dir / "instance.lp", **data)
        print(f"[✓] 生成实例 {index:>3} → {inst_dir/'instance.lp'}")
        index += 1


if __name__ == "__main__":
    main()
