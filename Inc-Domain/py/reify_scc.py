import clingo
from clingox.reify import reify_program
from pprint import pprint


def reify_and_get_full_map(program_string):
    ctl = clingo.Control()
    ctl.add("base", [], program_string)

    reified_symbols = reify_program(program_string, calculate_sccs=True)
    ctl.ground([("base", [])])

    full_atom_id_to_name_map = {}

    try:
        for atom in ctl.symbolic_atoms:
            atom_id = abs(atom.literal)
            full_atom_id_to_name_map[atom_id] = atom.symbol
    except RuntimeError:
        print("警告：无法访问 ctl.symbolic_atoms。程序可能为空。")
        return {}, []

    print("\n--- 使用完整的映射解析 scc/2 事实 ---")
    found_scc = False
    scc_components = {}

    for sym in reified_symbols:
        if sym.name == "scc" and len(sym.arguments) == 2:
            found_scc = True
            scc_id = sym.arguments[0].number
            atom_id = sym.arguments[1].number
            atom_name = full_atom_id_to_name_map.get(atom_id,
                                                     f"内部或非符号原子ID({atom_id})")

            if scc_id not in scc_components:
                scc_components[scc_id] = []

            scc_components[scc_id].append(f"{atom_name} (ID: {atom_id})")

    if not found_scc:
        print("在具体化输出中未找到 scc/2 事实。")
    else:
        # 打印整理后的SCC信息
        for scc_id, members in sorted(scc_components.items()):
            print(f"\n强连通分量 (SCC) ID: {scc_id}")
            for member in members:
                print(f"  - {member}")

    print(f"\n--- 完成 ---")

    return full_atom_id_to_name_map, reified_symbols


def merge_multiple_lp_files(file_list):
    contents = []
    for filename in file_list:
        try:
            with open(filename, 'r', encoding='utf-8') as f:
                contents.append(f.read())
        except FileNotFoundError:
            print(f"错误：文件未找到 '{filename}'")
            return None
    return '\n\n'.join(contents)


if __name__ == "__main__":
    files = ['gw/1/instance.lp', 'gw/solve.lp']
    merged_lp = merge_multiple_lp_files(files)

    if merged_lp:
        full_map, all_symbols = reify_and_get_full_map(merged_lp)
        pprint(full_map)
        print(f"\n\n")
        pprint(all_symbols)
