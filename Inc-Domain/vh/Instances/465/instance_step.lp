#program step(t).

goal(compute(C), T0, t, 1) :- subtask(compute(C)), subtask(compute(C), walk(O1_1), 1), goal(subtask(compute(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(compute(C), grab(O2_1), 2), goal(subtask(compute(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(compute(C), find(O3_1), 3), goal(subtask(compute(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(compute(C), T3, t, 2) :- subtask(compute(C), walk(O4_1), 4), goal(subtask(compute(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(compute(C), walk(O5_1), 5), goal(subtask(compute(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(compute(C), walk(O6_1), 6), goal(subtask(compute(C), walk(O6_1), 6), T5), T5 <= t, time(T5).
goal(compute(C), t) :- goal(compute(C), T0, T2, 1), goal(compute(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(compute(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(compute(C), walk(O), 1).
goal(subtask(compute(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(compute(C), grab(O), 2).
goal(subtask(compute(C), find(O), 3), t) :- goal(C, find(O), t), subtask(compute(C), find(O), 3).
goal(subtask(compute(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(compute(C), walk(O), 4).
goal(subtask(compute(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(compute(C), walk(O), 5).
goal(subtask(compute(C), walk(O), 6), t) :- goal(C, walk(O), t), subtask(compute(C), walk(O), 6).
