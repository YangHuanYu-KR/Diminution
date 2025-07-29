import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path
import ast
import sys

def parse_list_cell(cell):
    """Convert a cell (could be str, list, int, float) to a Python list of floats."""
    if pd.isna(cell):
        return []
    if isinstance(cell, (list, tuple)):
        return list(cell)
    if isinstance(cell, (int, float)):
        return [float(cell)]
    s = str(cell).strip()
    try:
        val = ast.literal_eval(s)
        if isinstance(val, (list, tuple)):
            return list(val)
        if isinstance(val, (int, float)):
            return [float(val)]
    except Exception:
        pass
    sep = ';' if ';' in s and ',' not in s else ','
    parts = [p.strip() for p in s.strip('[]').split(sep)]
    lst = []
    for p in parts:
        try:
            lst.append(float(p))
        except ValueError:
            lst.append(None)
    return lst

def timeout_rate_per_step(lists, max_steps=30):
    """
    Compute per-step timeout rate with dynamic denominators:
    - If an instance's list contains a -1 at index t, it times out at t and for all subsequent steps.
    - If an instance has no -1, it succeeds; steps beyond its list length are not counted in the denominator.
    """
    n = len(lists)
    # Precompute for each instance: first_timeout_step (None if no timeout), length
    info = []
    for lst in lists:
        try:
            t = lst.index(-1)
        except ValueError:
            t = None
        info.append((t, len(lst)))
    
    rates = []
    for i in range(max_steps):
        num = 0
        denom = 0
        for t, L in info:
            if t is not None:
                # instance timed out at step t => contributes to denom for all i >= 0
                denom += 1
                if i >= t:
                    num += 1
            else:
                # instance succeeded => only contributes if it reached step i
                if L > i:
                    denom += 1
                    # no count toward num since succeeded
        rate = num / denom if denom > 0 else 0
        rates.append(rate)
    return rates

def plot_timeout_rates(root_dir: str):
    root = Path(root_dir)
    files = [
        ("processed_clingo_related.csv", "Clingo Related"),
        ("processed_clingo_unrelated.csv", "Clingo Unrelated"),
        ("processed_DLV2_related.csv", "DLV2 Related"),
        ("processed_DLV2_unrelated.csv", "DLV2 Unrelated")
    ]
    timeout_rates = {}
    plt.figure(figsize=(10, 6))
    steps = list(range(30))
    
    for fname, label in files:
        path = root / fname
        if not path.exists():
            print(f"⚠️ 未找到文件: {path}")
            continue
        df = pd.read_csv(path)
        lists = df["t_solve_list"].apply(parse_list_cell).tolist()
        rates = timeout_rate_per_step(lists, max_steps=30)
        timeout_rates[label] = rates
        plt.plot(steps, rates, marker='o', label=label)
    
    plt.xlabel("Step")
    plt.ylabel("30s-Timeout Rate")
    plt.title("Timeout Rate per Step for Each Processed CSV")
    plt.xlim(0, 30)
    plt.ylim(0, 1.02)
    plt.grid(alpha=0.3)
    plt.legend()
    
    output_pdf = root / "30s-timeout_rates_per_step.pdf"
    plt.savefig(output_pdf)
    plt.show()
    
    for label, rates_list in timeout_rates.items():
        print(f"{label} rates per steps 0–29:\n{rates_list}\n")
    print(f"PDF chart saved to: {output_pdf.resolve()}")

if __name__ == "__main__":
    args = [a for a in sys.argv[1:] if not a.startswith('-')]
    root = args[0] if args else "vh"
    plot_timeout_rates(root)
