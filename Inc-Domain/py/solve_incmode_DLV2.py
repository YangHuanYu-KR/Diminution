from __future__ import annotations
import argparse
import csv
import re
import subprocess
import time
from pathlib import Path
from typing import Dict, List, Optional, Any

try:
    import psutil
    _PROC = psutil.Process()
except ImportError:
    _PROC = None

_STATS_KEY_RE = re.compile(r"^\s*([^:]+?)\s*:\s*(.+?)\s*$")

_RULE_KEYS = {
    "Constraints",
    "Normal rules",
    "Disjunctive rules",
    "Choice rules",
    "Counts",
    "Sums",
    "Weak constraints",
}

_KEEP_KEYS = {
    "Atoms",
    "Variables",
    "Cyclic components",
    "Non-ground program parsing time",
    "Grounding time",
    "Solving time",
    *_RULE_KEYS,
}

_RENAME = {
    "Solving time": "t_solve",
    "Grounding time": "t_ground",
    "Non-ground program parsing time": "t_parse",
    "Atoms": "atoms",
    "Variables": "variables",
    "Cyclic components": "sccs",
}

_STATS_KEY_RE = re.compile(r"^\s*([^:]+?)\s*:\s*(.+?)\s*$")


def parse_args() -> argparse.Namespace:
    p = argparse.ArgumentParser(
        description="Incremental DLV2 solver with stats")
    p.add_argument('--domain', default='gw', help='directory of problem')
    p.add_argument('--index',
                   type=int,
                   default=1,
                   help="instance sub-folder；-1⇢run all")
    p.add_argument("--models",
                   type=int,
                   default=1,
                   help="max models per run  (DLV2 -n=<m>)")
    p.add_argument("--related",
                   action="store_true",
                   help="load solve_related.lp instead of solve.lp")
    p.add_argument('--max-steps',
                   type=int,
                   default=100,
                   help='max incremental steps')
    p.add_argument('--dlv2-path', default='../deps/dlv-2.1.2-win64.exe')
    p.add_argument('--csv',
                   action='store_true',
                   help='path to output CSV file')
    p.add_argument('--verbose', action='store_true')

    return p.parse_args()


def _extract_int(value: str) -> int:
    part = value.strip().split()[0]
    try:
        return int(part)
    except ValueError:
        return 0


def _rss() -> Optional[int]:
    """
    Return current process RSS in bytes, or None if psutil unavailable.
    """
    return _PROC.memory_info().rss if _PROC else None


def _mb(b: int | None):
    return None if b is None else round(b / 2**20, 2)


def _write_csv(path: Path, new_rows: List[Dict[str, Any]]):
    header = list(new_rows[0].keys())
    old: List[Dict[str, Any]] = []
    if path.exists():
        with path.open("r", newline="", encoding="utf-8") as f:
            rdr = csv.DictReader(f)
            header = rdr.fieldnames or header
            old = list(rdr)
    keep = {int(r["index"]): r for r in old}
    for r in new_rows:
        keep[int(r["index"])] = r
    with path.open("w", newline="", encoding="utf-8") as f:
        wr = csv.DictWriter(f, fieldnames=header)
        wr.writeheader()
        wr.writerows(keep.values())
    print(f"CSV updated → {path}")


def parse_dlv2_stats(text: str) -> Dict[str, str]:
    stats: Dict[str, str] = {}
    for line in text.splitlines():
        line = line.rstrip()
        if not line or line.startswith("---"):
            continue
        m = _STATS_KEY_RE.match(line)
        if not m:
            continue
        key, val = m.groups()
        key = key.strip()
        if key not in _KEEP_KEYS:
            continue
        stats[key] = val.strip()

    rules_sum = sum(
        _extract_int(stats.pop(k, "0")) for k in _RULE_KEYS if k in stats)
    stats["rules"] = str(rules_sum)
    for old, new in _RENAME.items():
        if old in stats:
            stats[new] = stats.pop(old)
    return stats


def remove_directives(txt: str) -> str:
    patterns = {
        "#include <incmode>.",
        "#program step(t).",
        "#program check(t).",
    }
    filtered_lines = [
        line for line in txt.splitlines() if line.strip() not in patterns
    ]
    return "\n".join(filtered_lines)


def instantiate_query(text: str, x: int) -> str:
    replaced = re.sub(r'\bquery\s*\(\s*t\s*\),', '', text)
    return re.sub(r'\bgoal_met\s*\(\s*t\s*\)', f'goal_met({x})', replaced)


def incremental_dlv2(domain: Path, idx: int,
                     args: argparse.Namespace) -> Dict[str, Any]:

    solver_dir = 'solve_related' if args.related else 'solve'
    base_lp = domain / solver_dir / 'solve_base.lp'
    step_lp = domain / solver_dir / 'solve_step_dlv.lp'
    check_lp = domain / solver_dir / 'solve_check.lp'
    inst_lp = domain / str(idx) / 'instance.lp'

    step_stats: List[Dict[str, Any]] = []
    stats_lists = {
        't_solve': [],
        't_ground': [],
        't_parse': [],
        'mem_start_bytes': [],
        'mem_solve_bytes': [],
        'ground_file_bytes': []
    }

    print("由于 DLV 自身设计, 当前 step 的状态为 UNSAT 时无 rules 和 atoms 的统计信息 !!!")
    for t in range(args.max_steps + 1):
        base_text = remove_directives((base_lp.read_text()) + "\n" +
                                      inst_lp.read_text())
        check_part = instantiate_query(remove_directives(check_lp.read_text()),
                                       t)
        prog = check_part + "\n" + base_text if t == 0 else remove_directives(
            step_lp.read_text(
            )) + f"\ntime(1..{t})." + "\n" + base_text + "\n" + check_part

        m0 = _rss()
        proc = subprocess.run(
            [args.dlv2_path, "--stats=2", f"-n={args.models}"],
            input=prog,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True)
        if proc.returncode != 0:
            raise RuntimeError(
                f"DLV2 exited with {proc.returncode}:\n{proc.stdout}")
        m1 = _rss()

        stats = parse_dlv2_stats(proc.stdout)
        sign_idx = -idx if args.related else idx

        idlv_proc = subprocess.run([args.dlv2_path, "--mode=idlv"],
                                   input=prog,
                                   stdout=subprocess.PIPE,
                                   stderr=subprocess.STDOUT,
                                   text=True)
        idlv_output = idlv_proc.stdout
        out_file = Path("temp") / f"temp_gc_idlv.aspif"
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
            print(
                f"[step {t:4d}] "
                f"G {float(stats.get('t_ground'[:-1], 0)):>6.3f}s | "
                f"S {float(stats.get('t_solve'[:-1], 0)):>6.3f}s | "
                f"C {int(stats.get('variables', 0)):2d} | "
                f"H {int(stats.get('atoms', 0)):4d} | "
                f"rules {int(stats.get('rules', 0)):7d} atoms {int(stats.get('atoms', 0)):7d} | "
                f"rel {int(stats.get('rel_facts', 0)):d}/{int(stats.get('rel_nonfacts', 0)):d} | "
                f"G size {file_size_bytes}B |"
                f"mem {(_mb(m0) or 0):.2f}/{(_mb(m1) or 0):.2f} MB")
        if int(stats.get('rules', '0')) != 0:
            break

    summary = {
        "index": (-idx if args.related else idx),
        "steps": t,
        "rules": stats.get('rules', '0'),
    }
    for k, v in stats_lists.items():
        summary[f"{k}_list"] = ";".join(map(str, v))
    return summary


def run(args: argparse.Namespace):
    domain = Path(args.domain)
    if not domain.exists():
        raise FileNotFoundError(domain)

    indices = (sorted(
        int(p.name) for p in domain.iterdir()
        if p.is_dir() and p.name.isdigit())
               if args.index == -1 else [args.index])

    rows = []
    for idx in indices:
        rows.append(incremental_dlv2(domain, idx, args))

    if args.csv:
        _write_csv(domain / "result_DLV2.csv", rows)


if __name__ == "__main__":
    run(parse_args())
