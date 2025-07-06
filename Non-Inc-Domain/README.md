### 1\. 项目简介

`solve_main.py` 是一个基于 **clingo 5.8** 的脚本，用来批量或单次运行 ASP（Answer Set Programming）实例，并收集以下统计信息：

| 指标 | 说明 |
| --- | --- |
| Herbrand-universe 大小 | ground 后出现的常量个数 |
| Ground 后规则 / 原子数 | `--stats=2` 级别统计 |
| Ground / Solve 耗时 | 精确到毫秒 |
| Ground / Solve 内存 | 依赖 `psutil`，单位 MB |
| 模型数量 | 枚举出的 model 个数 |
| `related/2` 事实数 | 在 ground 程序中以事实出现的数量 |
| `related/2` 规则数 | 出现在规则头或体中的数量 |

统计结果可写入 `<domain>/result.csv`，并支持增量覆盖。

> **注意**  
> _当前版本仅支持一次性 ground+solve 的模式；不支持 clingo 的 incmode_。

* * *

### 2\. 环境依赖

| 组件 | 版本 | 说明 |
| --- | --- | --- |
| Python | ≥ 3.8 | 3.13 也可 |
| clingo | 5.8.0 | 官方 wheel 即可（不需要 `ast.Visitor`） |
| psutil | _可选_ | 用于内存统计；无则内存项返回 `None` |

安装示例：

```bash
pip install clingo==5.8.0 psutil
```

* * *

### 3\. 目录结构示例

```
.
└── py/ 
    ├── solve_main.py
├── solve.lp              # 主程序
├── solve_related.lp      # 可选替代程序
└── hc/                   # 一个 domain 目录
    ├── 1/
    │   └── instance.lp
    ├── 2/
    │   └── instance.lp
    └── result.csv        # 运行后自动生成
```

* * *

### 4\. 命令行参数

| 参数 | 默认 | 作用 |
| --- | --- | --- |
| `--domain` | `hc` | 实例所在根目录 |
| `--index` | `1` | 子目录编号；`-1` 表示批量运行 domain 下所有数字子目录 |
| `--models` | `1` | 最大枚举模型数；`0` 表示不设上限 |
| `--threads` | `0` | 求解线程；`0` = CPU 全核心 |
| `--verbose` | 关 | 打印控制台汇总 |
| `--related` | 关 | 把 `solve_related.lp` 作为主程序 |
| `--csv` | 关 | 把统计信息写入 `<domain>/result.csv` |

> 当 `--index -1`（批量模式）时，脚本会 **强制** `--csv` 打开、`--verbose` 关闭。

* * *

### 5\. 使用示例

#### 5.1 单实例

```bash
# 运行 hc/3/instance.lp，使用 solve.lp
python solve_main.py --domain hc --index 3 --models 100 --verbose --csv
```

#### 5.2 使用 solve\_related.lp

```bash
python solve_main.py --domain hc --index 3 --related --csv
# 结果行的 index 将写成 -3（符号区分）
```

#### 5.3 批量运行

```bash
# 遍历 hc 下所有数字子目录（1、2、3…）
python solve_main.py --domain hc --index -1
# 将批量结果追加/覆盖到 hc/result.csv
```

* * *

### 6\. 结果文件 `result.csv`

| 列名 | 含义 |
| --- | --- |
| `index` | 子目录编号；负号表示使用 `--related` |
| `herbrand` | Herbrand-universe 大小 |
| `rules` / `atoms` | ground 后规则数 / 原子数 |
| `t_ground` / `t_solve` | Ground / Solve 耗时（秒） |
| `mem_*_mb` | 各阶段内存（MB） |
| `models` | 枚举模型数 |
| `rel_facts` / `rel_nonfacts` / `rel_total` | `related/2` 的三类计数 |

脚本写入逻辑：

1.  若 `result.csv` 不存在则新建并写入表头。
2.  依据 _带符号的_ `index` 作为唯一键；存在则覆盖，否则追加。

* * *

### 7\. 常见问题

| 问题 | 可能原因 |
| --- | --- |
| `rules / atoms = 0` | 读取统计时机不当；请确认在 `solve()` 之后读取 |
| `ImportError: psutil` | 可忽略；仅影响内存统计 |
| 不支持增量 ground | 本脚本定位于“一次性 ground + solve”，如需 incmode 请自行扩展 |

* * *

### 8\. 许可证

MIT License – 与 clingo 一致，可自由使用与修改。



---
Powered by [ChatGPT](https://chatgpt.com/)