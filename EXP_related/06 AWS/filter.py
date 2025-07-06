from pathlib import Path


def get_t(src_file: Path, t: int) -> None:
    """把 src_file 中第三参数 = t 的 h/3 事实写入 filtered-t.lp"""
    pattern = f"),{t})."  # 行尾判定
    dst_dir = src_file.parent / "filtered"  # 输出目录：同级 filtered/
    dst_dir.mkdir(parents=True, exist_ok=True)  # 目录不存在就递归创建
    dst_file = dst_dir / f"filtered-{t}.lp"  # 输出文件

    with src_file.open("r", encoding="utf-8")  as f_in, \
         dst_file.open("w", encoding="utf-8") as f_out:
        for line in f_in:
            if line.rstrip().endswith(pattern):
                f_out.write(line)


if __name__ == "__main__":
    base_dir = Path("./logs/AWS_demo/")  # 源文件所在目录
    for i in range(0, 16):  # 处理 1.lp … 7.lp
        get_t(base_dir / f"1.lp", i)
