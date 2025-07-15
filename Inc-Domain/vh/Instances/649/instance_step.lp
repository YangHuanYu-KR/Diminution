#program step(t).

goal(relax(C), t) :- subtask(relax(C)), subtask(relax(C), walk(O1_1), 1), goal(subtask(relax(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(relax(C), switchon(O2_1), 2), goal(subtask(relax(C), switchon(O2_1), 2), T1), T1 <= T2, time(T1), subtask(relax(C), putin(O3_1, O3_2), 3), goal(subtask(relax(C), putin(O3_1, O3_2), 3), T2), T2 <= t, time(T2).

goal(subtask(relax(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(relax(C), walk(O), 1).
goal(subtask(relax(C), switchon(O), 2), t) :- goal(C, switchon(O), t), subtask(relax(C), switchon(O), 2).
goal(subtask(relax(C), putin(O1, O2), 3), t) :- goal(C, putin(O1, O2), t), subtask(relax(C), putin(O1, O2), 3).
