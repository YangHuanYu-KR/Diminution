import pandas as pd
from pathlib import Path
import sys

def find_csv_groups(root: Path):
    """
    扫描 root 目录下所有 .csv，按 (solver, relation) 分类。
    返回 dict 形如 {('clingo','related'): Path(...), ...}
    """
    groups = {}
    for csv in root.glob("*.csv"):
        name = csv.name.lower()
        solver = None
        if "clingo" in name:
            solver = "clingo"
        elif "dlv" in name:
            solver = "dlv2"
        else:
            continue 

        if "_related" in name:
            rel = "related"
        elif "_unrelated" in name:
            rel = "unrelated"
        else:
            continue  
        groups[(solver, rel)] = csv
    return groups

def preprocess_csvs(root_dir="vh"):
    root = Path(root_dir)
    groups = find_csv_groups(root)

    required_keys = [
        ("clingo", "related"), ("clingo", "unrelated"),
        ("dlv2", "related"),   ("dlv2", "unrelated")
    ]
    missing = [k for k in required_keys if k not in groups]
    if missing:
        raise FileNotFoundError(f"缺少以下文件: {missing}")

    df_clingo_rel = pd.read_csv(groups[("clingo", "related")])
    df_clingo_unrel = pd.read_csv(groups[("clingo", "unrelated")])
    df_dlv_rel = pd.read_csv(groups[("dlv2", "related")])
    df_dlv_unrel = pd.read_csv(groups[("dlv2", "unrelated")])

    c_rel_ids = set(df_clingo_rel["index"].abs())
    c_unrel_ids = set(df_clingo_unrel["index"].abs())
    d_rel_ids = set(df_dlv_rel["index"].abs())
    d_unrel_ids = set(df_dlv_unrel["index"].abs())

    common_ids = c_rel_ids & c_unrel_ids & d_rel_ids & d_unrel_ids
    print(f"共有实例数: {len(common_ids)}")
    
    # === 输出缺失的实例编号 ====================================
    all_ids_any = c_rel_ids | c_unrel_ids | d_rel_ids | d_unrel_ids
    missing_ids = sorted(i for i in all_ids_any if i not in common_ids)
    if missing_ids:
        print(f"以下 {len(missing_ids)} 个实例编号未同时出现在四个 CSV 中：")
        print(missing_ids)
    else:
        print("所有实例在四个 CSV 中都齐全。")
    # =======================================================

    # 仅保留公共实例
    df_clingo_rel = df_clingo_rel[df_clingo_rel["index"].abs().isin(common_ids)]
    df_clingo_unrel = df_clingo_unrel[df_clingo_unrel["index"].abs().isin(common_ids)]
    df_dlv_rel = df_dlv_rel[df_dlv_rel["index"].abs().isin(common_ids)]
    df_dlv_unrel = df_dlv_unrel[df_dlv_unrel["index"].abs().isin(common_ids)]

    # 指定要保留的列
    clingo_cols = [
        "index", 
        "wall_ground_list",  # will rename
        "wall_solve_list",   # will rename
        "consts_size_list", 
        "rules_list", 
        "atoms_list",
        "rel_facts_list", 
        "rel_nonfacts_list", 
        "rel_total_list",
        "aspif_bytes_list"   # will rename
    ]
    dlv_cols = [
        "index", 
        "t_solve_list", 
        "t_ground_list", 
        "ground_file_bytes_list"
    ]

    # 提取子集
    df_cr = df_clingo_rel[clingo_cols].copy()
    df_cu = df_clingo_unrel[clingo_cols].copy()
    df_dr = df_dlv_rel[dlv_cols].copy()
    df_du = df_dlv_unrel[dlv_cols].copy()

    # 重命名 Clingo 列匹配 DLV2 术语
    rename_map = {
        "wall_ground_list": "t_ground_list",
        "wall_solve_list":  "t_solve_list",
        "aspif_bytes_list": "ground_file_bytes_list"
    }
    df_cr.rename(columns=rename_map, inplace=True)
    df_cu.rename(columns=rename_map, inplace=True)

    # 保存到新文件
    df_cr.to_csv(root / "processed_clingo_related.csv", index=False)
    df_cu.to_csv(root / "processed_clingo_unrelated.csv", index=False)
    df_dr.to_csv(root / "processed_DLV2_related.csv", index=False)
    df_du.to_csv(root / "processed_DLV2_unrelated.csv", index=False)

    print("处理完成，新的文件已保存到:", root.resolve())

if __name__ == "__main__":
    dir_arg = sys.argv[1] if len(sys.argv) > 1 else "vh"
    preprocess_csvs(dir_arg)