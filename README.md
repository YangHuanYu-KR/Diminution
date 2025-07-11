
# 项目结构说明

本项目基于 **DLV2** 和 **Clingo** 在不同领域（Domain）下的增量与非增量求解方式中比较 **diminution** 前后的 ASP 程序求解效率，包含实例生成、求解脚本与实验结果输出等模块。

该项目完整涵盖了：

- DLV2 与 Clingo 的对比测试
- 增量模式与非增量模式的建模与控制
- 脚本化实例生成与批处理求解
- 支持多平台（Linux/macOS/Windows）运行

如需执行增量实验，请查看 `Inc-Domain/py/solve_incmode_DLV2.py` 与 `solve_incmode_clingo.py`；
如需扩展新任务域，可仿照 `gc/` 或 `gw/` 目录结构添加。


---

## `deps/` - 外部依赖与工具

```
dlv-2.1.2-arm64         # DLV2 可执行文件（适用于 macOS ARM）  
dlv-2.1.2-linux-x86_64  # DLV2 可执行文件（适用于 Linux）  
dlv-2.1.2-win64.exe     # DLV2 可执行文件（适用于 Windows）  
utils.py                # 公共辅助函数（例如路径处理、命令调用等）
```

---

## `Inc-Domain/` - 增量式领域测试（Incremental Solving）

该目录用于增量模式下的求解实验，子目录以任务类别（如 `gw`）分类。

### `Inc-Domain/gw/` - “Grid World” 类任务（增量）

```
result_clingo.csv # Clingo 增量求解结果  
result_DLV2.csv   # DLV2 增量求解结果
```

#### `Inc-Domain/gw/1/` - 第一个测试实例

```
instance.lp  # 问题实例  
params.json  # 参数配置（步数、目标、seed 等）
```

#### `Inc-Domain/gw/solve/` - Clingo 增量求解程序（原始）

```
solve_base.lp     # 初始化状态  
solve_check.lp    # 状态检查器  
solve_step.lp     # 增量步进规则  
solve_step_dlv.lp # 为 DLV2 调整的版本（语法兼容）
```

#### `Inc-Domain/gw/solve_related/` - Diminution 后的 solver，结构同上


### `Inc-Domain/py/` - 增量领域脚本

```
gen_gw_instance.py       # 生成 grid world 测试实例  
reify_scc.py             # 提取强连通分量（SCC）用于增量模式分析  
solve_incmode_clingo.py  # Clingo 增量求解控制脚本  
solve_incmode_DLV2.py    # 非官方 DLV2 增量模式求解控制脚本
```

### `*/temp/` - 临时文件缓存目录

```
temp_gc_gringo.aspif # 中间生成的 ASPIF 文件（由 gringo grounding 得到）
temp_gc_idlv.aspif   # 中间生成的 ASPIF 文件（由 idlv grounding 得到）
```

---

## `Non-Inc-Domain/` - 非增量式领域测试（一次性求解）

### `Non-Inc-Domain/gc/` - Graph Coloring 问题域（TODO）

### `Non-Inc-Domain/hc/` - Hamiltonian Cycle 问题域

```
solve.lp          # 不同于 Incmode 求解, 只需要一个 lp 文件即可
solve_related.lp  # 同上
```

#### `Non-Inc-Domain/hc/1/`（结构同 incmode 下的 instance）


### `Non-Inc-Domain/py/` - 非增量模式控制脚本

```
gen_hc_instance.py   # 生成哈密顿环实例  
reify_scc.py         # SCC 分析脚本（弃用，scc 统计信息被包含在 solve_DLV2.py 输出中）  
solve_clingo.py      # Clingo 非增量求解控制脚本  
solve_DLV2.py        # DLV2 非增量求解脚本
```

---



## 📦 实例生成脚本

### `Non-Inc-Domain/py/gen_hc_instance.py`

用于生成 HC 域的实例。运行时可通过 `--help` 获取帮助。

**注意事项：**
1. `-i` 默认为 `-1`，表示自动分配 index。自动编码逻辑为当前目录下最大 index +1，并**不保证 index 连续**。
2. 若指定的 `-i` 已存在，会**覆盖**对应的实例文件。
3. `-b` 表示从 index 开始，批量生成 `batch_size` 个实例，**同样可能覆盖已有文件**。
4. `-r`（冗余边比）最大值为 `n/2`，超过此值会**自动启用 `-c` 生成完全图**。
5. `-n` 控制图结构：先生成基本环结构（`0->1->2...->n-1->0` 和 `1<->n-1`），再添加 `r * n` 条冗余边。

---

### `Inc-Domain/py/gen_gw_instance.py`

用于生成 GW 域的实例，参数和注意事项基本与 `gen_hc_instance.py` 相同。

---

## 🧮 非增量求解脚本

### `Non-Inc-Domain/py/solve_clingo.py`

使用 Clingo 对指定 domain 执行标准（非增量）求解。

**参数说明与注意事项：**
1. 支持在任意子目录中运行，需通过 `--domain` 指定域名（如 `"hc"` 或 `"gw"`）。
2. `--threads` 控制并行线程数，默认为 `0`（自动检测物理核心数）。
3. `--index=-1` 时，会自动遍历并求解当前 domain 下所有实例。此时：
   - 自动关闭 verbose；
   - 自动开启 CSV 统计输出。
4. 输出 CSV 字段说明：
   - `index`: 当前实例索引（在 related 模式下为负值 `-index`）；
   - `consts_size`: 常量数量；
   - `rules`, `atoms`: Ground 后的规则与原子数；
   - `t_ground`, `t_solve`: Ground 与求解时间（外部计时）；
   - `ground_file_size_bytes`: Gringo 生成的 aspif 文件大小；
   - `mem_start_bytes`, `mem_ground_bytes`, `mem_solve_bytes`: RSS 内存（仅供参考）；
   - `models`: 模型数；
   - `rel_facts`, `rel_nonfacts`, `rel_total`: 含 `"related"` 的辅助谓词统计信息。

---

### `Non-Inc-Domain/py/solve_DLV2.py`

使用 DLV2 对实例进行求解。

**注意事项：**
1. 参数与 `solve_clingo.py` 相似，需额外指定 `--dlv2-path`，例如：`--dlv2-path eps/dlv-2.1.2-linux-x86_64`
2. 2. CSV 输出字段说明：
- `t_solve`, `t_ground`, `t_parse`: DLV2 内部准确计时；
- `variables`, `sccs`: Ground 后变量数与环（SCC）数；
- `mem_*`: 内存信息不具参考意义（由于 DLV 内部内存管理机制）。

---

## ♻️ 增量模式求解脚本

### `Inc-Domain/py/solve_incmode_clingo.py`

Clingo 增量求解脚本，适用于需要逐步推进（step-by-step）的规划任务。

**注意事项：**
1. 参数与 `solve_clingo.py` 类似。
2. 输出字段说明（部分为 list 格式）：
- `steps`: 总步数；
- `total_wall`, `total_cpu`: 总耗时（wall/cpu）；
- `mem_start_bytes`, `mem_end_bytes`, `mem_delta_bytes`: 内存使用情况；
- `wall_ground_list`, `cpu_ground_list`, `wall_solve_list`, `cpu_solve_list`: 每步耗时；
- `consts_size_list`, `rules_list`, `atoms_list`: 每步 Ground 后的大小；
- `rel_facts_list`, `rel_nonfacts_list`, `rel_total_list`: 每步相关谓词统计；
- `aspif_bytes_list`, `mem_grounding_mb_list`, `mem_solve_mb_list`: 每步文件与内存情况。

---

### `Inc-Domain/py/solve_incmode_DLV2.py`

DLV2 的增量求解脚本。

**注意事项：**
1. 需显式通过 `--max-steps` 指定最大步数；
2. 输出字段含义直观（字段名即为其含义）；
3. 当某一步返回 `UNSAT` 时，**不包含该步的 rules 和 atoms 统计信息**（DLV2 限制）。

---

## 🧠 附注建议

- 建议在运行过程中始终使用 `--help` 参数了解支持选项；
- 文件路径建议使用绝对路径或项目根路径为基准的相对路径；
- 请在测试阶段注意已有实例是否被覆盖，以防数据丢失；
- 输出的 CSV 统计结果可用于绘图分析性能瓶颈。

---

如有问题，请联系项目维护者或提交 Issue。