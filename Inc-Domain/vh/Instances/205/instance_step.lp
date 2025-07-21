#program step(t).

goal(toast_bread(C), T0, t, 1) :- subtask(toast_bread(C)), subtask(toast_bread(C), walk(O1_1), 1), goal(subtask(toast_bread(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(toast_bread(C), find(O2_1), 2), goal(subtask(toast_bread(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(toast_bread(C), putin(O3_1, O3_2), 3), goal(subtask(toast_bread(C), putin(O3_1, O3_2), 3), T2), T2 <= t, time(T2).
goal(toast_bread(C), T3, t, 2) :- subtask(toast_bread(C), switchon(O4_1), 4), goal(subtask(toast_bread(C), switchon(O4_1), 4), T3), T3 <= T4, time(T3), subtask(toast_bread(C), close(O5_1), 5), goal(subtask(toast_bread(C), close(O5_1), 5), T4), T4 <= T5, time(T4), subtask(toast_bread(C), grab(O6_1), 6), goal(subtask(toast_bread(C), grab(O6_1), 6), T5), T5 <= t, time(T5).
goal(toast_bread(C), T0, t, 3) :- goal(toast_bread(C), T0, T2, 1), goal(toast_bread(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(toast_bread(C), T6, t, 4) :- subtask(toast_bread(C), watch(O7_1), 7), goal(subtask(toast_bread(C), watch(O7_1), 7), T6), T6 <= t, time(T6).
goal(toast_bread(C), t) :- goal(toast_bread(C), T0, T5, 3), goal(toast_bread(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(toast_bread(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(toast_bread(C), walk(O), 1).
goal(subtask(toast_bread(C), find(O), 2), t) :- goal(C, find(O), t), subtask(toast_bread(C), find(O), 2).
goal(subtask(toast_bread(C), putin(O1, O2), 3), t) :- goal(C, putin(O1, O2), t), subtask(toast_bread(C), putin(O1, O2), 3).
goal(subtask(toast_bread(C), switchon(O), 4), t) :- goal(C, switchon(O), t), subtask(toast_bread(C), switchon(O), 4).
goal(subtask(toast_bread(C), close(O), 5), t) :- goal(C, close(O), t), subtask(toast_bread(C), close(O), 5).
goal(subtask(toast_bread(C), grab(O), 6), t) :- goal(C, grab(O), t), subtask(toast_bread(C), grab(O), 6).
goal(subtask(toast_bread(C), watch(O), 7), t) :- goal(C, watch(O), t), subtask(toast_bread(C), watch(O), 7).
