#program step(t).

goal(sort_laundry(C), T0, t, 1) :- subtask(sort_laundry(C)), subtask(sort_laundry(C), walk(O1_1), 1), goal(subtask(sort_laundry(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(sort_laundry(C), grab(O2_1), 2), goal(subtask(sort_laundry(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(sort_laundry(C), walk(O3_1), 3), goal(subtask(sort_laundry(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(sort_laundry(C), T3, t, 2) :- subtask(sort_laundry(C), putin(O4_1, O4_2), 4), goal(subtask(sort_laundry(C), putin(O4_1, O4_2), 4), T3), T3 <= T4, time(T3), subtask(sort_laundry(C), walk(O5_1), 5), goal(subtask(sort_laundry(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(sort_laundry(C), grab(O6_1), 6), goal(subtask(sort_laundry(C), grab(O6_1), 6), T5), T5 <= t, time(T5).
goal(sort_laundry(C), T0, t, 3) :- goal(sort_laundry(C), T0, T2, 1), goal(sort_laundry(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(sort_laundry(C), T6, t, 4) :- subtask(sort_laundry(C), walk(O7_1), 7), goal(subtask(sort_laundry(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(sort_laundry(C), putin(O8_1, O8_2), 8), goal(subtask(sort_laundry(C), putin(O8_1, O8_2), 8), T7), T7 <= T8, time(T7), subtask(sort_laundry(C), walk(O9_1), 9), goal(subtask(sort_laundry(C), walk(O9_1), 9), T8), T8 <= t, time(T8).
goal(sort_laundry(C), T0, t, 5) :- goal(sort_laundry(C), T0, T5, 3), goal(sort_laundry(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(sort_laundry(C), T9, t, 6) :- subtask(sort_laundry(C), grab(O10_1), 10), goal(subtask(sort_laundry(C), grab(O10_1), 10), T9), T9 <= T10, time(T9), subtask(sort_laundry(C), walk(O11_1), 11), goal(subtask(sort_laundry(C), walk(O11_1), 11), T10), T10 <= T11, time(T10), subtask(sort_laundry(C), putin(O12_1, O12_2), 12), goal(subtask(sort_laundry(C), putin(O12_1, O12_2), 12), T11), T11 <= t, time(T11).
goal(sort_laundry(C), t) :- goal(sort_laundry(C), T0, T8, 5), goal(sort_laundry(C), T9, t, 6), time(T0), time(T8), time(T9), T8 <= T9.

goal(subtask(sort_laundry(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(sort_laundry(C), walk(O), 1).
goal(subtask(sort_laundry(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(sort_laundry(C), grab(O), 2).
goal(subtask(sort_laundry(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(sort_laundry(C), walk(O), 3).
goal(subtask(sort_laundry(C), putin(O1, O2), 4), t) :- goal(C, putin(O1, O2), t), subtask(sort_laundry(C), putin(O1, O2), 4).
goal(subtask(sort_laundry(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(sort_laundry(C), walk(O), 5).
goal(subtask(sort_laundry(C), grab(O), 6), t) :- goal(C, grab(O), t), subtask(sort_laundry(C), grab(O), 6).
goal(subtask(sort_laundry(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(sort_laundry(C), walk(O), 7).
goal(subtask(sort_laundry(C), putin(O1, O2), 8), t) :- goal(C, putin(O1, O2), t), subtask(sort_laundry(C), putin(O1, O2), 8).
goal(subtask(sort_laundry(C), walk(O), 9), t) :- goal(C, walk(O), t), subtask(sort_laundry(C), walk(O), 9).
goal(subtask(sort_laundry(C), grab(O), 10), t) :- goal(C, grab(O), t), subtask(sort_laundry(C), grab(O), 10).
goal(subtask(sort_laundry(C), walk(O), 11), t) :- goal(C, walk(O), t), subtask(sort_laundry(C), walk(O), 11).
goal(subtask(sort_laundry(C), putin(O1, O2), 12), t) :- goal(C, putin(O1, O2), t), subtask(sort_laundry(C), putin(O1, O2), 12).
