#program step(t).

goal(compute(C), T0, t, 1) :- subtask(compute(C)), subtask(compute(C), walk(O1_1), 1), goal(subtask(compute(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(compute(C), walk(O2_1), 2), goal(subtask(compute(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(compute(C), touch(O3_1), 3), goal(subtask(compute(C), touch(O3_1), 3), T2), T2 <= t, time(T2).
goal(compute(C), T3, t, 2) :- subtask(compute(C), lookat(O4_1), 4), goal(subtask(compute(C), lookat(O4_1), 4), T3), T3 <= t, time(T3).
goal(compute(C), t) :- goal(compute(C), T0, T2, 1), goal(compute(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(compute(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(compute(C), walk(O), 1).
goal(subtask(compute(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(compute(C), walk(O), 2).
goal(subtask(compute(C), touch(O), 3), t) :- goal(C, touch(O), t), subtask(compute(C), touch(O), 3).
goal(subtask(compute(C), lookat(O), 4), t) :- goal(C, lookat(O), t), subtask(compute(C), lookat(O), 4).
