#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
MPD_domain_generate.py

用法示例：
  python 03 MPD/MPD_domain_generate.py --products 3 --inputs 2  --outputs 2 --normals 3 --attributes 4 --num 10 --seed 42
  python 03 MPD/MPD_domain_generate.py --products 10 --inputs 3  --outputs 4 --normals 20 --attributes 4 --num 10 --seed 42

脚本功能：
    - 自动生成 MPD 实例文件夹及文件结构
    - 每个实例包含 goal.lp 和 instance.lp 文件
    - 支持随机种子以保持可重复性
"""

import argparse
import random
from pathlib import Path
from tqdm import tqdm
import os

cur_file_path = os.path.abspath(__file__)          # 脚本完整路径
cur_dir_path  = os.path.dirname(cur_file_path)     # 脚本所在文件夹


def generate_instances(num_products,
                       num_input_machines,
                       num_output_machines,
                       num_normal_machines,
                       num_attributes,
                       num_instances,
                       seed=None):
    """
    参数:
        num_products (int): 产品数量
        num_input_machines (int): 输入机器数量
        num_output_machines (int): 输出机器数量
        num_normal_machines (int): 普通机器数量（用于添加属性）
        num_attributes (int): 属性类型数量
        num_instances (int): 要生成的实例数量
        seed (int, optional): 随机种子，保持可重复性
    """
    if seed is not None:
        random.seed(seed)

    total_machines = num_input_machines + num_output_machines + num_normal_machines

    root_dir = Path(
        f'{cur_dir_path}/P{num_products}_M{total_machines}_A{num_attributes}')
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
                f'% Instance Products_num:{num_products}, Machines_num:{total_machines}, Attributes_num:{num_attributes}, idx {idx}\n'
            )
            f_inst.write('%============================\n\n')

            # 对象声明
            f_inst.write('%----------------------------\n')
            f_inst.write('% Object declarations (is/2)\n')
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

            # ==========================================================================
            # 属性赋予关系 gives/2
            attrs = attributes.copy()
            f_inst.write('%----------------------------\n')
            f_inst.write('% Attribute assignments (give/2)\n')
            f_inst.write('%----------------------------\n')
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

            # ==========================================================================
            # 产品进入时间 enter_time/3
            f_inst.write('%----------------------------\n')
            f_inst.write('% Enter times (enter_time/3)\n')
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
            # Connectivity relations (connected/2)
            #  - 随机生成有向边
            #  - 保证每个 input 都能到达每个 output
            edges = set()
            
            f_inst.write('%----------------------------\n')
            f_inst.write('% Connectivity (connected/2)\n')
            f_inst.write('%----------------------------\n')
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

            # 写入 connected/2 事实
            f_inst.write('%----------------------------\n')
            f_inst.write('% Connectivity (connected/2)\n')
            f_inst.write('%----------------------------\n')
            for u, v in edges:
                f_inst.write(f'connected({u},{v}).\n')
            f_inst.write('\n')

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
    parser.add_argument('--seed',
                        type=int,
                        default=42,
                        help='Random seed for reproducibility')
    args = parser.parse_args()
    generate_instances(args.products,
                       args.inputs,
                       args.outputs,
                       args.normals,
                       args.attributes,
                       args.num,
                       seed=args.seed)
