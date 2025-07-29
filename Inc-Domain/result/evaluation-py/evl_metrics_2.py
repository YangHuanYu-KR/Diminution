import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.ticker import FixedLocator, ScalarFormatter
from matplotlib.patches import Patch
from pathlib import Path
import ast, re, sys

# ---------- 工具函数 ----------
def parse_list_cell(cell):
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
        cleaned = re.sub(r'[^\d\.\-]+$', '', p)
        try:
            lst.append(float(cleaned))
        except ValueError:
            lst.append(None)
    return lst

def collect_step_values(lists, max_steps=31):
    """Collect non‑timeout, existing values per step up to max_steps (0…30)."""
    data = []
    for i in range(max_steps):
        vals = [lst[i] for lst in lists
                if i < len(lst) and lst[i] is not None and lst[i] != -1]
        data.append(vals)
    return data

# ---------- 主绘图 ----------
def plot_metric_boxplots(root_dir: str):
    root = Path(root_dir)

    # 同一个求解器的 related / unrelated 放一起
    solvers = {
        "Clingo": ("processed_clingo_related.csv",
                   "processed_clingo_unrelated.csv"),
        "DLV2"  : ("processed_DLV2_related.csv",
                   "processed_DLV2_unrelated.csv")
    }

    # 每个子图里 related 与 unrelated 的配色
    palette = {
        "Clingo": ("#1f77b4", "#ff7f0e"),
    "DLV2":   ("#1f77b4", "#ff7f0e")
    }

    metrics = [
        ("t_solve_list",        "Solving time (s)"),
        ("t_ground_list",       "Grounding time (s)"),
        ("ground_file_bytes_list", "Ground file size (B)"),
        ("rules_list",          "Number of rules")
    ]

    max_steps = 31      # 0…30 共 31 个刻度
    tick_locs = list(range(0, max_steps, 5))

    for metric, ylabel in metrics:
        fig, axes = plt.subplots(1, 2, figsize=(14, 6), sharex=True, sharey=True)
        axes = axes.flatten()

        for ax, (solver, (file_rel, file_unrel)) in zip(axes, solvers.items()):
            path_rel = root / file_rel
            path_unrel = root / file_unrel

            if not (path_rel.exists() and path_unrel.exists()):
                ax.set_visible(False)
                continue

            df_rel = pd.read_csv(path_rel)
            df_unrel = pd.read_csv(path_unrel)
            if metric not in df_rel.columns or metric not in df_unrel.columns:
                ax.set_visible(False)
                continue

            lists_rel = df_rel[metric].apply(parse_list_cell).tolist()
            lists_unrel = df_unrel[metric].apply(parse_list_cell).tolist()

            data_rel = collect_step_values(lists_rel, max_steps)
            data_unrel = collect_step_values(lists_unrel, max_steps)

            # 为了不重叠，related 向左移 0.15，unrelated 向右移 0.15
            pos = list(range(max_steps))
            pos_rel = [p for p in pos]
            pos_unrel = [p for p in pos]

            color_rel, color_unrel = palette[solver]

            
            medianprops = dict(color='black', linewidth=0.5)
            bp1 = ax.boxplot(
                data_rel, positions=pos_rel, widths=0.5,
                patch_artist=True, showfliers=False, medianprops=medianprops)
            bp2 = ax.boxplot(
                data_unrel, positions=pos_unrel, widths=0.5,
                patch_artist=True, showfliers=False, medianprops=medianprops)

            for patch in bp1['boxes']:
                patch.set_facecolor(color_rel)
                patch.set_edgecolor('none')
            for patch in bp2['boxes']:
                patch.set_facecolor(color_unrel)
                patch.set_edgecolor('none')
                
            for line in bp1['whiskers'] + bp1['caps']:
                line.set_color(color_rel)
            for line in bp2['whiskers'] + bp2['caps']:
                line.set_color(color_unrel)

            ax.set_title(solver)
            ax.set_xlabel("Step")
            ax.set_ylabel(ylabel)
            ax.set_xlim(-0.5, max_steps - 0.5)
            ax.xaxis.set_major_locator(FixedLocator(tick_locs))
            ax.xaxis.set_major_formatter(ScalarFormatter(useOffset=False))
            ax.tick_params(axis='x', labelrotation=0)

            ax.legend(handles=[
                Patch(facecolor=color_rel, label="Related"),
                Patch(facecolor=color_unrel, label="Unrelated")
            ], loc='upper right')

        fig.suptitle(f"Boxplot of {ylabel} by Step (Related vs Unrelated)", fontsize=14)
        fig.tight_layout(rect=[0, 0.03, 1, 0.92])

        out_pdf = root / f"figure_{metric}_boxplot.pdf"
        plt.savefig(out_pdf)
        print(f"Saved: {out_pdf.resolve()}")

if __name__ == "__main__":
    dir_arg = sys.argv[1] if len(sys.argv) > 1 else "vh"
    plot_metric_boxplots(dir_arg)
