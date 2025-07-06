#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
MPD_domain_generate.py

用法示例：
  python 04 MPD_unrelated/MPD_domain_generate.py --products 3 --inputs 2  --outputs 2 --normals 3 --attributes 4 --num 10 --seed 42 --unrelated-factor 1
  python 04 MPD_unrelated/MPD_domain_generate.py --products 10 --inputs 3  --outputs 4 --normals 20 --attributes 4 --num 10 --seed 42 --unrelated-factor 0.5

脚本功能：
    - 自动生成 MPD 实例文件夹及文件结构
    - 在生成实例之后，再额外添加一些与求解结果无关的实例，例如若干与当前 machine 图完全不连通的子图
    - 每个实例包含 goal.lp 和 instance.lp 文件
    - 支持随机种子以保持可重复性
    - 可通过 --unrelated-factor 参数，指定“无关机器”数量是“相关机器”数量的倍数
"""

import argparse
import random
from pathlib import Path
from tqdm import tqdm
import os

cur_file_path = os.path.abspath(__file__)          
cur_dir_path  = os.path.dirname(cur_file_path)     


def generate_instances(num_products,
                       num_input_machines,
                       num_output_machines,
                       num_normal_machines,
                       num_attributes,
                       num_instances,
                       unrelated_factor=2.0,
                       seed=None):
    """
    参数:
        num_products (int): 产品数量
        num_input_machines (int): 输入机器数量
        num_output_machines (int): 输出机器数量
        num_normal_machines (int): 普通机器数量（用于添加属性）
        num_attributes (int): 属性类型数量
        num_instances (int): 要生成的实例数量
        unrelated_factor (float): 无关机器数量 = unrelated_factor * 相关机器总数
        seed (int, optional): 随机种子，保持可重复性
    """
    if seed is not None:
        random.seed(seed)

    total_related_machines = num_input_machines + num_output_machines + num_normal_machines
    num_unrelated_machines = max(1, int(unrelated_factor * total_related_machines))

    root_dir = Path(
        f'{cur_dir_path}/P{num_products}_M{total_related_machines}_A{num_attributes}')
    root_dir.mkdir(parents=True, exist_ok=True)
    products = [f'p{i+1}' for i in range(num_products)]
    input_machines = [f'input{i+1}' for i in range(num_input_machines)]
    output_machines = [f'output{i+1}' for i in range(num_output_machines)]
    normal_machines = [f'm{i+1}' for i in range(num_normal_machines)]
    attributes = [f'a{i+1}' for i in range(num_attributes)]

    for idx in tqdm(range(1, num_instances + 1), desc='Generating instances'):
        inst_dir = root_dir / f'{idx}'
        inst_dir.mkdir(exist_ok=True)

        # ==========================================================================
        # 生成目标文件 goal.lp, 主要是生成 has_attr 和 out 原子作为 body
        goal_path = inst_dir / 'goal.lp'
        with open(goal_path, 'w', encoding='utf-8') as f_goal:
            f_goal.write('#program step(t).\n')

            # 每个 product 都有一个输出原子，表示它在某个时间点被输出
            out_atoms = [
                f'h(out({p},{random.choice(output_machines)}),t)'
                for p in products
            ]

            # 生成 has_attr 原子：每个 (product, attribute) 对以 50% 的概率出现在 goal 中
            attr_atoms = [
                f'h(has_attr({p},{a}),t)' for p in products for a in attributes
                if random.random() < 0.5
            ]

            all_atoms = out_atoms + attr_atoms
            body = ', '.join(all_atoms)
            f_goal.write(f'goal_met(t):- {body}.\n')

        # ==========================================================================
        # 生成实例文件 instance.lp
        inst_path = inst_dir / 'instance.lp'
        with open(inst_path, 'w', encoding='utf-8') as f_inst:
            f_inst.write('#program base.\n')
            f_inst.write('%============================\n')
            f_inst.write(
                f'% Instance Products_num:{num_products}, RelatedMachines:{total_related_machines}, Attributes_num:{num_attributes}, UnrelatedMachines:{num_unrelated_machines}, idx {idx}\n'
            )
            f_inst.write('%============================\n\n')

            # --------------------------------------------------------------------------
            # 对象声明（is/2）：先写“相关” machines、products、attributes
            f_inst.write('%----------------------------\n')
            f_inst.write('% Object declarations - related (is/2)\n')
            f_inst.write('%----------------------------\n')
            for m in input_machines:
                f_inst.write(f'is({m}, input).\n')
            for m in output_machines:
                f_inst.write(f'is({m}, output).\n')
            for m in normal_machines:
                f_inst.write(f'is({m}, machine).\n')
            for p in products:
                f_inst.write(f'is({p}, product).\n')
            for a in attributes:
                f_inst.write(f'is({a}, attribute).\n')
            f_inst.write('\n')

            # --------------------------------------------------------------------------
            # === 添加“无关” machines 和 attributes ===
            # 为了避免不同实例间名称冲突，我们在名称里加入 idx
            unrelated_machines = [f'u_m_{idx}_{i+1}' for i in range(num_unrelated_machines)]
            unrelated_attributes = [f'u_a_{idx}_{i+1}' for i in range(num_attributes)]
            f_inst.write('%----------------------------\n')
            f_inst.write('% Object declarations - unrelated (is/2)\n')
            f_inst.write('%----------------------------\n')
            for um in unrelated_machines:
                f_inst.write(f'is({um}, machine).\n')
            for ua in unrelated_attributes:
                f_inst.write(f'is({ua}, attribute).\n')
            f_inst.write('\n')

            # ==========================================================================
            # 给“相关” normal machines 分配属性 gives/2（保持原逻辑，不含无关属性）
            f_inst.write('%----------------------------\n')
            f_inst.write('% Attribute assignments - related (gives/2)\n')
            f_inst.write('%----------------------------\n')
            attrs = attributes.copy()
            random.shuffle(attrs)
            for i, m in enumerate(normal_machines):
                if i < len(attrs):
                    a = attrs[i]
                else:
                    a = random.choice(attributes)
                f_inst.write(f'gives({m},{a}).\n')
            for a in attrs[len(normal_machines):]:
                m = random.choice(normal_machines)
                f_inst.write(f'gives({m},{a}).\n')
            f_inst.write('\n')

            # --------------------------------------------------------------------------
            # === 给“无关” machines 分配属性 gives/2（仅在它们内部使用无关属性） ===
            f_inst.write('%----------------------------\n')
            f_inst.write('% Attribute assignments - unrelated (gives/2)\n')
            f_inst.write('%----------------------------\n')
            # 先打乱无关属性列表
            u_attrs = unrelated_attributes.copy()
            random.shuffle(u_attrs)
            # 如果无关 machines 数量 > 无关 attributes 数量，就随机循环分配
            for i, um in enumerate(unrelated_machines):
                if i < len(u_attrs):
                    ua = u_attrs[i]
                else:
                    ua = random.choice(unrelated_attributes)
                f_inst.write(f'gives({um},{ua}).\n')
            for ua in u_attrs[len(unrelated_machines):]:
                um = random.choice(unrelated_machines)
                f_inst.write(f'gives({um},{ua}).\n')
            f_inst.write('\n')

            # ==========================================================================
            # 产品进入时间 enter_time/3（主流程）
            f_inst.write('%----------------------------\n')
            f_inst.write('% Enter times - related (enter_time/3)\n')
            f_inst.write('%----------------------------\n')
            max_t = num_products
            available = [(m, t) for m in input_machines
                         for t in range(1, max_t + 1)]
            random.shuffle(available)
            for p in products:
                m, t = available.pop()
                f_inst.write(f'enter_time({p},{m},{t}).\n')
            f_inst.write('\n')

            # ==========================================================================
            # Connectivity relations (connected/2) - 先生成“相关”主图
            edges = set()

            # 让 normal machines 形成一个有向环，保证强连通
            n = len(normal_machines)
            for i in range(n):
                u = normal_machines[i]
                v = normal_machines[(i + 1) % n]
                edges.add((u, v))

            # 添加额外的边以增加连通性，边的数量为 n/2 到 n*1.5 之间的随机数
            extra_norm_edges = random.randint(int(n / 2), int(n * 1.5))
            for _ in range(extra_norm_edges):
                u, v = random.sample(normal_machines, 2)
                edges.add((u, v))

            # 每个 input 唯一指向一个 normal machine
            assigned = random.sample(normal_machines, len(input_machines))
            for inp, m in zip(input_machines, assigned):
                edges.add((inp, m))

            # 每个 output 从某个 random normal machine 指出
            for out in output_machines:
                m = random.choice(normal_machines)
                edges.add((m, out))

            f_inst.write('%----------------------------\n')
            f_inst.write('% Connectivity - related (connected/2)\n')
            f_inst.write('%----------------------------\n')
            for u, v in edges:
                f_inst.write(f'connected({u},{v}).\n')
            f_inst.write('\n')

            # --------------------------------------------------------------------------
            # === Connectivity relations - unrelated (connected/2) ===
            # 让无关 machines 自己形成一个独立子图（首尾相连的环 + 随机额外边）
            f_inst.write('%----------------------------\n')
            f_inst.write('% Connectivity - unrelated (connected/2)\n')
            f_inst.write('%   它们与主图完全不连通，仅在自身内部连通\n')
            f_inst.write('%----------------------------\n')
            # 先让无关 machines 形成一个环
            um_n = len(unrelated_machines)
            if um_n > 0:
                for i in range(um_n):
                    u = unrelated_machines[i]
                    v = unrelated_machines[(i + 1) % um_n]
                    f_inst.write(f'connected({u},{v}).\n')
                # 再添加一些随机边来增加该子图的连通度
                extra_um_edges = random.randint(int(um_n / 2), int(um_n * 1.0))
                for _ in range(extra_um_edges):
                    u, v = random.sample(unrelated_machines, 2)
                    f_inst.write(f'connected({u},{v}).\n')
            f_inst.write('\n')

            # ==========================================================================

        # 到此为止，instance.lp 中已经写完包含：
        #  1. “相关” machines/products/attributes 的 is/2 声明
        #  2. “无关” machines/attributes 的 is/2 声明（unrelated_machines & unrelated_attributes）
        #  3. gives/2：主流程中“相关”机器与主属性；“无关”机器与“无关”属性
        #  4. enter_time/3：仅针对“相关”输入产品
        #  5. connected/2：主图内部连通；无关子图内部连通，且二者互不交叉

    print('All instances generated under:', root_dir)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='Generate MPD instances with goal and instance files.')
    parser.add_argument('--products',
                        type=int,
                        required=True,
                        help='Number of products')
    parser.add_argument('--inputs',
                        type=int,
                        required=True,
                        help='Number of input machines')
    parser.add_argument('--outputs',
                        type=int,
                        required=True,
                        help='Number of output machines')
    parser.add_argument('--normals',
                        type=int,
                        required=True,
                        help='Number of normal machines')
    parser.add_argument('--attributes',
                        type=int,
                        required=True,
                        help='Number of attributes')
    parser.add_argument('--num',
                        type=int,
                        default=10,
                        help='Number of instances to generate')
    parser.add_argument('--unrelated-factor',
                        type=float,
                        default=1.0,
                        help='Unrelated machines count = factor * total related machines')
    parser.add_argument('--seed',
                        type=int,
                        default=42,
                        help='Random seed for reproducibility')
    args = parser.parse_args()
    generate_instances(
        args.products,
        args.inputs,
        args.outputs,
        args.normals,
        args.attributes,
        args.num,
        unrelated_factor=args.unrelated_factor,
        seed=args.seed
    )