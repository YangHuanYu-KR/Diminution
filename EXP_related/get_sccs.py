from clingox.reify import reify_program
from clingo.symbol import Symbol

# 重化程序并启用 SCC 计算
symbols = reify_program("""
  b :- a.
  b :- c.
  c :- b.
""",
                        calculate_sccs=True)

print(symbols)
