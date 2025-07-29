#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# editbin /STACK:8388608,65536 dlv-2.1.2-win64.exe

from __future__ import annotations
import argparse
import re
import sys
import subprocess
from pathlib import Path
from typing import Dict, List, Any
import re


def find_base_dir(target_dirname: str = "Diminution") -> Path:
    current = Path(__file__).resolve()
    for parent in current.parents:
        if parent.name == target_dirname:
            return parent
    raise RuntimeError(f"未在路径中找到名为 {target_dirname} 的父目录。请确认你的文件是否在该项目结构下。")


BASE_DIR = find_base_dir()
sys.path.append(str(BASE_DIR))

from deps.utils import upsert_and_sort_csv, _mb, _rss, parse_dlv2_stats


def parse_args() -> argparse.Namespace:
    p = argparse.ArgumentParser(
        description="Incremental DLV2 solver with stats")
    p.add_argument('--domain', default='aws', help='directory of problem')
    p.add_argument('--index',
                   type=int,
                   default=1,
                   help="instance sub-folder   -1⇢run all")
    p.add_argument("--models",
                   type=int,
                   default=1,
                   help="max models per run  (DLV2 -n=<m>)")
    p.add_argument("--related",
                   action="store_true",
                   help="load solve_related.lp instead of solve.lp")
    p.add_argument('--max-steps',
                   type=int,
                   default=1000,
                   help='max incremental steps')
    p.add_argument('--dlv2-path', default='deps\dlv-2.1.2-win64.exe')
    p.add_argument('--csv',
                   action='store_true',
                   help='path to output CSV file')
    p.add_argument('--verbose', action='store_true')
    p.add_argument('--time_limit', type=int, default=30)

    return p.parse_args()


def remove_directives(txt: str, imax: int = 30) -> str:
    _DIRECTIVES = ("#include", "#program", "#const")
    _RE_IMAX = re.compile(r"\bimax\b")
    _RE_T = re.compile(r"\bt\b")
    out_lines: List[str] = []

    for line in txt.splitlines():
        if line.lstrip().startswith(_DIRECTIVES):
            continue

        line = _RE_IMAX.sub(str(imax), line)
        line = _RE_T.sub("T", line)
        out_lines.append(line)

    return "\n".join(out_lines)


def instantiate_query(text: str, x: int) -> str:
    """
    - 移除  query(t),               (允许空白)
    - 把   goal_met(t)        → goal_met(x)
    - 把   goal(Task, t)      → goal(Task, x)      其中 Task 为固定变量
    """
    TASK = "Task"
    text = re.sub(r'\bquery\s*\(\s*t\s*\),\s*', '', text)
    text = re.sub(r'\bgoal_met\s*\(\s*t\s*\)', fr'goal_met({x})', text)
    task_pat = re.escape(TASK)
    text = re.sub(rf'\bgoal\s*\(\s*{task_pat}\s*,\s*t\s*\)',
                  fr'goal({TASK}, {x})', text)

    return text


def incremental_dlv2(domain: Path, idx: int,
                     args: argparse.Namespace) -> Dict[str, Any]:
    sign_idx = -idx if args.related else idx
    solver_dir = 'solve_related' if args.related else 'solve'
    base_lp = domain / solver_dir / 'solve_base.lp'
    step_lp = domain / solver_dir / 'solve_step_dlv.lp'
    check_lp = domain / solver_dir / 'solve_check.lp'

    if args.domain != 'vh':
        inst_lp = domain / "Instances" / str(idx) / 'instance.lp'
    else:
        inst_base_lp = domain / "Instances" / str(idx) / 'instance_base.lp'
        inst_step_lp = domain / "Instances" / str(idx) / 'instance_step.lp'

    step_stats: List[Dict[str, Any]] = []
    stats_lists = {
        't_solve': [],
        't_ground': [],
        't_parse': [],
        'mem_start_bytes': [],
        'mem_solve_bytes': [],
        'ground_file_bytes': []
    }

    for t in range(args.max_steps + 1):
        base_part = remove_directives(
            (base_lp.read_text()) + "\n" + inst_lp.read_text(),
            imax=args.max_steps) if args.domain != 'vh' else remove_directives(
                (base_lp.read_text()) + "\n" + inst_base_lp.read_text(),
                imax=args.max_steps)

        step_part = remove_directives(
            step_lp.read_text()) if args.domain != 'vh' else remove_directives(
                inst_step_lp.read_text().replace('.', ', time(T).')
            ) + "\n" + remove_directives(step_lp.read_text())

        check_part = remove_directives(
            instantiate_query(check_lp.read_text(), t))

        prog = check_part + "\n" + base_part if t == 0 else step_part + f"\ntime(1..{t})." + "\n" + base_part + "\n" + check_part

        dlv2_exec = BASE_DIR / args.dlv2_path

        m0 = _rss()
        try:
            proc = subprocess.run(
                [str(dlv2_exec), "--stats=2", f"-n={args.models}"],
                input=prog,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                text=True,
                timeout=args.time_limit)

            m1 = _rss()
            if proc.returncode != 0:
                raise RuntimeError(
                    f"DLV2 exited with {proc.returncode}:\n{proc.stdout}")
            stats, incoherent = parse_dlv2_stats(proc.stdout)

        except subprocess.TimeoutExpired:
            m1 = -1
            stats = {
                "index": sign_idx,
                "mem_start_bytes": -1,
                "mem_solve_bytes": -1,
                "ground_file_bytes": -1,
                "t_solve": -1,
                "t_ground": -1,
                "t_parse": -1,
                "rules": 1,
                "atoms": -1,
                "variables": -1,
                "sccs": -1,
            }
            step_stats.append(stats)
            for k in stats_lists:
                stats_lists[k].append(stats[k])
            print(f"[step {t:3d}]  超时 (> {args.time_limit}s)，跳过后续步骤")
            break

        idlv_proc = subprocess.run([str(dlv2_exec), "--mode=idlv"],
                                   input=prog,
                                   stdout=subprocess.PIPE,
                                   stderr=subprocess.STDOUT,
                                   text=True)
        idlv_output = idlv_proc.stdout
        out_file = BASE_DIR / "Inc-Domain" / "temp" / f"temp_gc_idlv_unrelated.aspif"
        out_file.write_text(idlv_output, encoding="utf-8")
        file_size_bytes = out_file.stat().st_size

        stats.update({
            "index": sign_idx,
            "mem_start_bytes": m0,
            "mem_solve_bytes": m1,
            "ground_file_bytes": file_size_bytes
        })
        step_stats.append(stats)
        for key in stats_lists:
            stats_lists[key].append(step_stats[-1][key])

        if args.verbose:
            print(f"[step {t}] "
                  f"G {stats.get('t_ground')} |"
                  f"S {stats.get('t_solve')} |"
                  f"C {int(stats.get('variables', 0)):2d} | "
                  f"H {int(stats.get('atoms', 0)):4d} | "
                  f"G size {file_size_bytes}B |"
                  f"mem {(_mb(m0) or 0):.2f}/{(_mb(m1) or 0):.2f} MB")
        if not incoherent:
            break

    summary = {
        "index": (-idx if args.related else idx),
        "steps": t,
        "rules": stats.get('rules', '0'),
        'atoms': stats.get('atoms', '0'),
        'variables': stats.get('variables', '0'),
        'sccs': stats.get('sccs', '0'),
    }
    for k, v in stats_lists.items():
        summary[f"{k}_list"] = ";".join(map(str, v))
    return summary


def run(args: argparse.Namespace):
    domain = BASE_DIR / "Inc-Domain" / args.domain
    instances = domain / "Instances"
    if not instances.exists():
        raise FileNotFoundError(instances)

    if args.index == -1:
        args.csv = True
        indices = sorted(
            int(p.name) for p in instances.iterdir()
            if p.is_dir() and p.name.isdigit())
    else:
        indices = [args.index]

    csv_path = domain / f"../result/{args.domain}/result_dlv2_unrelated.csv"
    for idx in indices:
        idx = idx + 30
        print(f"Now solving the {idx} instance in {domain}")
        row = incremental_dlv2(domain, idx, args)
        if args.csv:
            upsert_and_sort_csv(row, csv_path)


if __name__ == "__main__":
    run(parse_args())
