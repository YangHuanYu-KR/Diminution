#program step(t).

goal(come_home(C), T0, t, 1) :- subtask(come_home(C)), subtask(come_home(C), walk(O1_1), 1), goal(subtask(come_home(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(come_home(C), grab(O2_1), 2), goal(subtask(come_home(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(come_home(C), find(O3_1), 3), goal(subtask(come_home(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(come_home(C), T3, t, 2) :- subtask(come_home(C), open(O4_1), 4), goal(subtask(come_home(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(come_home(C), putin(O5_1, O5_2), 5), goal(subtask(come_home(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(come_home(C), close(O6_1), 6), goal(subtask(come_home(C), close(O6_1), 6), T5), T5 <= t, time(T5).
goal(come_home(C), T0, t, 3) :- goal(come_home(C), T0, T2, 1), goal(come_home(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(come_home(C), T6, t, 4) :- subtask(come_home(C), walk(O7_1), 7), goal(subtask(come_home(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(come_home(C), grab(O8_1), 8), goal(subtask(come_home(C), grab(O8_1), 8), T7), T7 <= T8, time(T7), subtask(come_home(C), find(O9_1), 9), goal(subtask(come_home(C), find(O9_1), 9), T8), T8 <= t, time(T8).
goal(come_home(C), T0, t, 5) :- goal(come_home(C), T0, T5, 3), goal(come_home(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(come_home(C), T9, t, 6) :- subtask(come_home(C), open(O10_1), 10), goal(subtask(come_home(C), open(O10_1), 10), T9), T9 <= T10, time(T9), subtask(come_home(C), putin(O11_1, O11_2), 11), goal(subtask(come_home(C), putin(O11_1, O11_2), 11), T10), T10 <= T11, time(T10), subtask(come_home(C), close(O12_1), 12), goal(subtask(come_home(C), close(O12_1), 12), T11), T11 <= t, time(T11).
goal(come_home(C), T0, t, 7) :- goal(come_home(C), T0, T8, 5), goal(come_home(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(come_home(C), T12, t, 8) :- subtask(come_home(C), walk(O13_1), 13), goal(subtask(come_home(C), walk(O13_1), 13), T12), T12 <= t, time(T12).
goal(come_home(C), t) :- goal(come_home(C), T0, T11, 7), goal(come_home(C), T12, t, 8), time(T0), time(T11), time(T12), T11 <= T12.

goal(subtask(come_home(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(come_home(C), walk(O), 1).
goal(subtask(come_home(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(come_home(C), grab(O), 2).
goal(subtask(come_home(C), find(O), 3), t) :- goal(C, find(O), t), subtask(come_home(C), find(O), 3).
goal(subtask(come_home(C), open(O), 4), t) :- goal(C, open(O), t), subtask(come_home(C), open(O), 4).
goal(subtask(come_home(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(come_home(C), putin(O1, O2), 5).
goal(subtask(come_home(C), close(O), 6), t) :- goal(C, close(O), t), subtask(come_home(C), close(O), 6).
goal(subtask(come_home(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(come_home(C), walk(O), 7).
goal(subtask(come_home(C), grab(O), 8), t) :- goal(C, grab(O), t), subtask(come_home(C), grab(O), 8).
goal(subtask(come_home(C), find(O), 9), t) :- goal(C, find(O), t), subtask(come_home(C), find(O), 9).
goal(subtask(come_home(C), open(O), 10), t) :- goal(C, open(O), t), subtask(come_home(C), open(O), 10).
goal(subtask(come_home(C), putin(O1, O2), 11), t) :- goal(C, putin(O1, O2), t), subtask(come_home(C), putin(O1, O2), 11).
goal(subtask(come_home(C), close(O), 12), t) :- goal(C, close(O), t), subtask(come_home(C), close(O), 12).
goal(subtask(come_home(C), walk(O), 13), t) :- goal(C, walk(O), t), subtask(come_home(C), walk(O), 13).
