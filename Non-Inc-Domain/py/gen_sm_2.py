#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
批量生成 Stable‑Marriage 测试实例（instance.lp + params.json）

保留原有的“单实例”函数不动，只在外层增加：
1. --domain        根目录，默认 sm
2. --index -1      自动取 Instances/ 下一个可用编号
3. --batch         一次生成多份实例
4. --seed          主随机种子，批量时派生子种子
5. 统一目录结构   <domain>/Instances/<index>/{instance.lp,params.json}
6. params.json     记录生成参数与 Gale‑Shapley 匹配结果
"""
from __future__ import annotations
import json, os, random
from pathlib import Path
from typing import List, Tuple


def gale_shapley(men_preferences, women_preferences):
    """
    Men proposing to women
    """
    # Number of men and women
    N = len(men_preferences)

    # Each man is free at the start
    free_men = list(range(N))

    # Initialize the current partner for each man and woman
    current_partner = [-1] * N  # -1 means no partner
    women_partner = [-1] * N  # -1 means no partner

    # While there are free men
    while free_men:
        man = free_men.pop(0)  # Get the first free man
        man_pref = men_preferences[man]

        # Propose to the highest-ranked woman he hasn't proposed to yet
        for woman in man_pref:
            if women_partner[woman] == -1:  # If woman is free
                # Engage man and woman
                women_partner[woman] = man
                current_partner[man] = woman
                break
            else:
                # If woman is already engaged, check if she prefers the new man
                current_man = women_partner[woman]
                woman_pref = women_preferences[woman]

                if woman_pref.index(man) < woman_pref.index(current_man):
                    # Woman prefers the new man
                    women_partner[woman] = man
                    current_partner[man] = woman
                    # The dumped man becomes free
                    free_men.append(current_man)
                    current_partner[current_man] = -1
                    break

    return current_partner, women_partner


def manAssignsScore(man, woman, score):
    return (man, woman, score)


def womanAssignsScore(woman, man, score):
    return (woman, man, score)


def translate_scores_to_preferences(men_scores, women_scores):
    # Determine the number of men and women
    men_count = max(score[0] for score in men_scores) + 1
    women_count = men_count

    # Initialize preference lists
    men_preferences = [[] for _ in range(men_count)]
    women_preferences = [[] for _ in range(women_count)]

    # Fill preference lists based on scores
    for score in men_scores:
        men_preferences[score[0]].append(
            (score[1], score[2]))  # (woman, score)
    for score in women_scores:
        women_preferences[score[0]].append(
            (score[1], score[2]))  # (man, score)

    # Sort preferences by score (higher score first)
    for man in range(men_count):
        men_preferences[man].sort(
            key=lambda x: -x[1])  # Sort by score descending
        men_preferences[man] = [
            woman for woman, score in men_preferences[man]
        ]  # Keep only women

    for woman in range(women_count):
        women_preferences[woman].sort(
            key=lambda x: -x[1])  # Sort by score descending
        women_preferences[woman] = [
            man for man, score in women_preferences[woman]
        ]  # Keep only men

    return men_preferences, women_preferences


def generate_random_preferences(num):
    rand_men_scores = []
    rand_women_scores = []

    # Generate scores for men
    for man in range(num):
        # Unique scores for women from 1 to num
        women_scores = random.sample(range(1, num + 1), num)
        for woman in range(num):
            rand_men_scores.append(
                manAssignsScore(man, woman, women_scores[woman]))

    # Generate scores for women
    for woman in range(num):
        # Unique scores for men from 1 to num
        men_scores = random.sample(range(1, num + 1), num)
        for man in range(num):
            rand_women_scores.append(
                womanAssignsScore(woman, man, men_scores[man]))

    return rand_men_scores, rand_women_scores


def create_renaming_mapping(men_partners):
    # Create a mapping for renaming women
    women_renaming_mapping = {}

    for man_index, woman_index in enumerate(men_partners):
        women_renaming_mapping[woman_index] = man_index

    return women_renaming_mapping


def renaming_original_scores(original_men_scores, original_women_scores,
                             women_renaming_mapping):
    men_count = max(score[0] for score in original_men_scores) + 1
    women_count = men_count

    renamed_men_scores = []
    for score in original_men_scores:
        renamed_men_scores.append(
            manAssignsScore(score[0], women_renaming_mapping[score[1]],
                            score[2]))
    renamed_men_scores.sort(key=lambda s: s[0] * men_count + s[1])

    renamed_women_scores = []
    for score in original_women_scores:
        renamed_women_scores.append(
            womanAssignsScore(women_renaming_mapping[score[0]], score[1],
                              score[2]))
    renamed_women_scores.sort(key=lambda s: s[0] * women_count + s[1])

    return renamed_men_scores, renamed_women_scores


def generate_instances(scores, mode):
    """
    write instance files wit the scores after renaming,
    choose mode between 'm' (for men) and 'w' (for women)
    """
    if mode == 'm':
        prefix = 'manAssignsScore'
    elif mode == 'w':
        prefix = 'womanAssignsScore'
    else:
        raise RuntimeError('Please choose mode = m or w')

    str_score_list = []
    for score in scores:
        str_score_list.append(f'{prefix}({score[0]}, {score[1]}, {score[2]})')

    return str_score_list


# ---------- 通用包装工具 ---------- #
def next_index(inst_root: Path) -> int:
    """取 Instances 目录下的下一个数字索引（若为空则返回 1）。"""
    idxs = [
        int(p.name) for p in inst_root.iterdir()
        if p.is_dir() and p.name.isdigit()
    ]
    return max(idxs) + 1 if idxs else 1


def write_instance_to_domain(domain: Path, idx: int,
                             men_scores: List[Tuple[int, int, int]],
                             women_scores: List[Tuple[int, int, int]],
                             meta: dict) -> None:
    """把 instance.lp 与 params.json 写到 <domain>/Instances/<idx>/"""
    inst_dir = domain / "Instances" / str(idx)
    inst_dir.mkdir(parents=True, exist_ok=True)

    # ---------- 写 instance.lp ---------- #
    header = f'% number of men/women = {meta["num"]}\n'
    men_facts = '.\n'.join(
        generate_instances(men_scores, mode='m') + ['% end of men'])
    women_facts = '.\n'.join(
        generate_instances(women_scores, mode='w') + ['% end of women'])
    (inst_dir / "instance.lp").write_text(header + men_facts + women_facts,
                                          encoding="utf-8")

    # ---------- 写 params.json ---------- #
    (inst_dir / "params.json").write_text(json.dumps(meta,
                                                     indent=2,
                                                     ensure_ascii=False),
                                          encoding="utf-8")


# ---------- 脚本入口 ---------- #
if __name__ == '__main__':
    import argparse

    # --------- 解析参数 --------- #
    def parse_args():
        p = argparse.ArgumentParser(
            description="Generate Stable‑Marriage instances (batch‑friendly)")
        p.add_argument("-d",
                       "--domain",
                       default="sm",
                       help="root directory (default: sm)")
        p.add_argument(
            "-i",
            "--index",
            type=int,
            default=-1,
            help="-1: auto‑assign next index under <domain>/Instances/")
        p.add_argument("-b",
                       "--batch",
                       type=int,
                       default=1,
                       help="number of instances to generate")
        p.add_argument("-n",
                       "--num",
                       type=int,
                       required=True,
                       help="number of men/women (≥1)")
        p.add_argument("--seed",
                       type=int,
                       default=0,
                       help="master random seed")
        return p.parse_args()

    args = parse_args()

    # --------- 环境准备 --------- #
    domain_path = Path(args.domain)
    (domain_path / "Instances").mkdir(parents=True, exist_ok=True)

    start_idx = next_index(domain_path /
                           "Instances") if args.index == -1 else args.index
    master_rng = random.Random(args.seed)

    for k in range(args.batch):
        idx = start_idx + k
        sub_seed = master_rng.randint(0, 2**31 - 1)
        random.seed(sub_seed)  # 驱动所有旧函数里的 `random.*`

        # --------- 1. 生成原始分数 --------- #
        men_scores, women_scores = generate_random_preferences(args.num)

        # --------- 2. Gale‑Shapley 匹配 --------- #
        mprefs, wprefs = translate_scores_to_preferences(
            men_scores, women_scores)
        men_p, women_p = gale_shapley(mprefs, wprefs)  # 配偶索引
        rename_map = create_renaming_mapping(men_p)

        # --------- 3. 重命名并写文件 --------- #
        r_men_scores, r_women_scores = renaming_original_scores(
            men_scores, women_scores, rename_map)

        meta = {
            "index": idx,
            "domain": args.domain,
            "num": args.num,
            "seed": sub_seed,
            "men_partners": men_p,
            "women_partners": women_p,
            "rename_map": rename_map
        }
        write_instance_to_domain(domain_path, idx, r_men_scores,
                                 r_women_scores, meta)

        print(
            f"[ok] wrote {domain_path}/Instances/{idx}/instance.lp & params.json"
        )
