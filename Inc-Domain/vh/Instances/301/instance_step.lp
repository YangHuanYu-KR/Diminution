#program step(t).

goal(shop(C), T0, t, 1) :- subtask(shop(C)), subtask(shop(C), walk(O1_1), 1), goal(subtask(shop(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(shop(C), grab(O2_1), 2), goal(subtask(shop(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(shop(C), walk(O3_1), 3), goal(subtask(shop(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(shop(C), T3, t, 2) :- subtask(shop(C), open(O4_1), 4), goal(subtask(shop(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(shop(C), walk(O5_1), 5), goal(subtask(shop(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(shop(C), find(O6_1), 6), goal(subtask(shop(C), find(O6_1), 6), T5), T5 <= t, time(T5).
goal(shop(C), T0, t, 3) :- goal(shop(C), T0, T2, 1), goal(shop(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(shop(C), T6, t, 4) :- subtask(shop(C), walk(O7_1), 7), goal(subtask(shop(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(shop(C), grab(O8_1), 8), goal(subtask(shop(C), grab(O8_1), 8), T7), T7 <= T8, time(T7), subtask(shop(C), putin(O9_1, O9_2), 9), goal(subtask(shop(C), putin(O9_1, O9_2), 9), T8), T8 <= t, time(T8).
goal(shop(C), t) :- goal(shop(C), T0, T5, 3), goal(shop(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(shop(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(shop(C), walk(O), 1).
goal(subtask(shop(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(shop(C), grab(O), 2).
goal(subtask(shop(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(shop(C), walk(O), 3).
goal(subtask(shop(C), open(O), 4), t) :- goal(C, open(O), t), subtask(shop(C), open(O), 4).
goal(subtask(shop(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(shop(C), walk(O), 5).
goal(subtask(shop(C), find(O), 6), t) :- goal(C, find(O), t), subtask(shop(C), find(O), 6).
goal(subtask(shop(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(shop(C), walk(O), 7).
goal(subtask(shop(C), grab(O), 8), t) :- goal(C, grab(O), t), subtask(shop(C), grab(O), 8).
goal(subtask(shop(C), putin(O1, O2), 9), t) :- goal(C, putin(O1, O2), t), subtask(shop(C), putin(O1, O2), 9).
