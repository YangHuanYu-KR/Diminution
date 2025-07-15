from __future__ import annotations
from ast import Tuple
import csv
import re
from pathlib import Path
from typing import Dict, List, Optional, Any, Set
import clingo
from clingo import Control, MessageCode

import psutil
_PROC = psutil.Process()


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
_INCOHERENT_RE = re.compile(r'^\s*INCOHERENT\s*$', re.IGNORECASE)


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
    
    
def upsert_and_sort_csv(row: dict, csv_path: Path) -> None:
    """
    把 `row` 写入 csv_path：
      • 若 index 已存在 → 覆盖原行
      • 写完后按 abs(index) 从小到大排序
    """
    existing: list[dict] = []
    if csv_path.exists():
        with csv_path.open("r", newline="") as f:
            reader = csv.DictReader(f)
            existing = list(reader)

    table: dict[int, dict] = {int(r["index"]): r for r in existing}
    table[int(row["index"])] = row                  
    sorted_rows = sorted(
        table.values(),
        key=lambda r: (abs(int(r["index"])), int(r["index"]))
    )

    with csv_path.open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=row.keys())
        writer.writeheader()
        writer.writerows(sorted_rows)
    print(f"CSV updated → {csv_path}")


def parse_dlv2_stats(text: str) -> Tuple[Dict[str, str], bool]:
    incoherent: bool = False
    stats: Dict[str, str] = {}
    for line in text.splitlines():
        line = line.rstrip()
        if not line or line.startswith("---"):
            continue
        if _INCOHERENT_RE.match(line):
            incoherent = True
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
    return stats, incoherent


def all_constants_size(ctl: Control) -> int:
    consts: Set[clingo.Symbol] = set()

    def rec(sym: clingo.Symbol):
        if sym.type in (clingo.SymbolType.Number, clingo.SymbolType.String):
            consts.add(sym)
        elif sym.type is clingo.SymbolType.Function:
            if not sym.arguments:
                consts.add(sym)
            else:
                for a in sym.arguments:
                    rec(a)

    for a in ctl.symbolic_atoms:
        rec(a.symbol)
    return len(consts)


def logger(code: MessageCode, msg: str):
    if code is MessageCode.RuntimeError:
        print(f"[clingo:{code.name}] {msg}")
