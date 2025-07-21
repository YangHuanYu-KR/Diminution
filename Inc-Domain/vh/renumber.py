import os
from pathlib import Path
import re

def renumber_instances(parent_dir: Path, start_idx: int = 1, dry_run: bool = False):
    """
    将 parent_dir 下所有以纯数字命名的子文件夹重命名为连续编号。
    
    参数:
        parent_dir: 存放若干数字命名子文件夹的父路径
        start_idx: 重命名起始索引（默认从 1 开始）
        dry_run: 若为 True，则仅打印将要执行的重命名操作，不实际修改文件系统
    """
    # 匹配纯数字文件夹
    pattern = re.compile(r'^\d+$')
    # 收集所有数字命名的目录
    dirs = [d for d in parent_dir.iterdir() if d.is_dir() and pattern.match(d.name)]
    # 根据原数字名称排序
    dirs_sorted = sorted(dirs, key=lambda d: int(d.name))
    
    # 生成新的名称映射
    mapping = {}
    idx = start_idx
    for d in dirs_sorted:
        mapping[d] = str(idx)
        idx += 1

    # 检查有无命名冲突（新名和旧名可能冲突）
    new_names = set(mapping.values())
    old_names = set(d.name for d in dirs_sorted)
    if new_names & old_names and not dry_run:
        # 如果有交叉冲突，推荐先使用临时命名
        print("检测到新旧命名存在交叉，建议先启用 dry_run 或 修改脚本为两步重命名。")
    
    # 执行重命名
    for old_path, new_name in mapping.items():
        new_path = old_path.with_name(new_name)
        print(f"{old_path.name} -> {new_name}")
        if not dry_run:
            os.rename(old_path, new_path)

if __name__ == "__main__":
    # 请根据实际路径修改下面这一行：
    parent = Path("Instances")
    # 设置 dry_run=True 先查看效果，不修改文件
    # renumber_instances(parent, start_idx=1, dry_run=True)
    # 若确认无误，修改为 dry_run=False 并再次运行
    renumber_instances(parent, start_idx=1, dry_run=False)