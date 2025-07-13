#program step(t).

goal(getting__dresses(C), T0, t, 1) :- subtask(getting__dresses(C)), subtask(getting__dresses(C), walk(O1_1), 1), goal(subtask(getting__dresses(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(getting__dresses(C), find(O2_1), 2), goal(subtask(getting__dresses(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(getting__dresses(C), grab(O3_1), 3), goal(subtask(getting__dresses(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(getting__dresses(C), T3, t, 2) :- subtask(getting__dresses(C), find(O4_1), 4), goal(subtask(getting__dresses(C), find(O4_1), 4), T3), T3 <= T4, time(T3), subtask(getting__dresses(C), grab(O5_1), 5), goal(subtask(getting__dresses(C), grab(O5_1), 5), T4), T4 <= t, time(T4).
goal(getting__dresses(C), t) :- goal(getting__dresses(C), T0, T2, 1), goal(getting__dresses(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(getting__dresses(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(getting__dresses(C), walk(O), 1).
goal(subtask(getting__dresses(C), find(O), 2), t) :- goal(C, find(O), t), subtask(getting__dresses(C), find(O), 2).
goal(subtask(getting__dresses(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(getting__dresses(C), grab(O), 3).
goal(subtask(getting__dresses(C), find(O), 4), t) :- goal(C, find(O), t), subtask(getting__dresses(C), find(O), 4).
goal(subtask(getting__dresses(C), grab(O), 5), t) :- goal(C, grab(O), t), subtask(getting__dresses(C), grab(O), 5).
