#program step(t).

goal(vacuum_carpet(C), T0, t, 1) :- subtask(vacuum_carpet(C)), subtask(vacuum_carpet(C), walk(O1_1), 1), goal(subtask(vacuum_carpet(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(vacuum_carpet(C), find(O2_1), 2), goal(subtask(vacuum_carpet(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(vacuum_carpet(C), grab(O3_1), 3), goal(subtask(vacuum_carpet(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(vacuum_carpet(C), T3, t, 2) :- subtask(vacuum_carpet(C), find(O4_1), 4), goal(subtask(vacuum_carpet(C), find(O4_1), 4), T3), T3 <= t, time(T3).
goal(vacuum_carpet(C), t) :- goal(vacuum_carpet(C), T0, T2, 1), goal(vacuum_carpet(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(vacuum_carpet(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(vacuum_carpet(C), walk(O), 1).
goal(subtask(vacuum_carpet(C), find(O), 2), t) :- goal(C, find(O), t), subtask(vacuum_carpet(C), find(O), 2).
goal(subtask(vacuum_carpet(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(vacuum_carpet(C), grab(O), 3).
goal(subtask(vacuum_carpet(C), find(O), 4), t) :- goal(C, find(O), t), subtask(vacuum_carpet(C), find(O), 4).
