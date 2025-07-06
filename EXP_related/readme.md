## 一些问题
Q1: 我们认为，“引入 related 谓词”这一做法与 diminution 理论之间存在一定脱节：前者侧重通过启发式算法来压缩问题规模，而 diminution 理论的关注点则并非如此。

Q2: heuristic 过于 Domain-spcific, 且不够通用，比如说我们现在在 N-Queens 问题上就很难找到合适的 heuristic。

## 介绍
我们在这里实现了 “三种related” 分别为：
* 图着色问题中, 我们舍弃掉给定 graph G 中的以度为 0 节点为端点的 "链" 得到 G'，从而使得 G' 的任一着色方案都是 G' 某一着色方案的子集。
* 在 Grids World 中，借鉴 Visibility Graph 的思路，先提取起点、终点以及所有矩形障碍物的四个顶点。以这些关键点为中心，分别绘制水平和垂直射线组成的“十字”可见区域；随后在十字交汇的离散网格线上搜索一条从起点到终点的连通路径。
* 在 inc_related 中，给定一个 G(V, E), 以及起点、终点、几个闭经点。按跳数 k 递增地扩张这些节点的邻域。当扩张至第 k 跳时，检查在当前“相关子图”内是否已存在一条连接起点与终点且经过所有必经点的路径；若有，即停止并返回该路径，否则继续增大 k。
* Manufacturing Plant Domain 则是通过 related 去除掉里面的非联通部分从而缩减搜索空间，和 Grids World 的实现方式类似。

## 代码结构
```
<PROJECT_ROOT>/
├── 01 GC                         # Graph Coloring
│   └── GC_demo
│       └── 1
├── 02 GW                         # Grids World
│   ├── GW_domain_generate.py     # 用于生成 Grids World 具体实例
│   └── W50_H50_B3                # 宽和高皆为 50，有 3 个障碍物块的实例（由代码生成）
│       ├── 1
│       ...
│       ├── 10
├── 03 MPD                        # Manufacturing Plant Domain（在 docs 中给出了该 domain 的出处）
│   ├── MPD_demo
│   │   └── 1
│   ├── MPD_domain_generate.py    # 用于生成 MPD 具体实例
│   ├── P10_M27_A4                # 10 个 product，27 个 machine，4 个 attribute 的实例（由代码生成）
│   │   ├── 1
│   │   ...
│   │   ├── 10
│   └── P3_M7_A4                  # 3 个 product，7 个 machine，4 个 attribute 的实例（由代码生成）
│       ├── 1
│       ...
│       ├── 10
├── 04 MPD_unrelated              # 包含了一些“非联通”内容 Manufacturing Plant Domain 的实例
│   ├── MPD_domain_generate.py    # 用于生成 MPD 具体实例
│   └── P3_M7_A4                  # 3 个 product，7 个 machine，4 个 attribute 的实例（由代码生成）
│       ├── 1
│       ...
│       ├── 10
├── 05 inc_related                # 一个用于动态生成 related 的例子（在 step(t) 的过程中逐步生成 realted)
├── docs                          # 一些文档
├── Incmode_solver.py             # 用 Clingo 的 python API 实现的 incmode solver，可以记录用时和内存消耗
├── logs                          # 日志文件
└── solve_zsh.sh                  # 运行脚本（提供自动补全）
```

## 示例
每个 python 脚本的开头注释处都有给出运行示例。

---
> 文档最后更新：2025-06-14