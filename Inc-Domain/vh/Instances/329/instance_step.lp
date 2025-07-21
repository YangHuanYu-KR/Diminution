#program step(t).

goal(turking(C), T0, t, 1) :- subtask(turking(C)), subtask(turking(C), walk(O1_1), 1), goal(subtask(turking(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(turking(C), walk(O2_1), 2), goal(subtask(turking(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(turking(C), sit(O3_1), 3), goal(subtask(turking(C), sit(O3_1), 3), T2), T2 <= t, time(T2).
goal(turking(C), T3, t, 2) :- subtask(turking(C), grab(O4_1), 4), goal(subtask(turking(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(turking(C), grab(O5_1), 5), goal(subtask(turking(C), grab(O5_1), 5), T4), T4 <= T5, time(T4), subtask(turking(C), lookat(O6_1), 6), goal(subtask(turking(C), lookat(O6_1), 6), T5), T5 <= t, time(T5).
goal(turking(C), T0, t, 3) :- goal(turking(C), T0, T2, 1), goal(turking(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(turking(C), T6, t, 4) :- subtask(turking(C), watch(O7_1), 7), goal(subtask(turking(C), watch(O7_1), 7), T6), T6 <= t, time(T6).
goal(turking(C), t) :- goal(turking(C), T0, T5, 3), goal(turking(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(turking(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(turking(C), walk(O), 1).
goal(subtask(turking(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(turking(C), walk(O), 2).
goal(subtask(turking(C), sit(O), 3), t) :- goal(C, sit(O), t), subtask(turking(C), sit(O), 3).
goal(subtask(turking(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(turking(C), grab(O), 4).
goal(subtask(turking(C), grab(O), 5), t) :- goal(C, grab(O), t), subtask(turking(C), grab(O), 5).
goal(subtask(turking(C), lookat(O), 6), t) :- goal(C, lookat(O), t), subtask(turking(C), lookat(O), 6).
goal(subtask(turking(C), watch(O), 7), t) :- goal(C, watch(O), t), subtask(turking(C), watch(O), 7).
