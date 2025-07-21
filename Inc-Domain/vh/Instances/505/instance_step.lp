#program step(t).

goal(organize_pantry(C), T0, t, 1) :- subtask(organize_pantry(C)), subtask(organize_pantry(C), walk(O1_1), 1), goal(subtask(organize_pantry(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(organize_pantry(C), grab(O2_1), 2), goal(subtask(organize_pantry(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(organize_pantry(C), find(O3_1), 3), goal(subtask(organize_pantry(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(organize_pantry(C), T3, t, 2) :- subtask(organize_pantry(C), open(O4_1), 4), goal(subtask(organize_pantry(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(organize_pantry(C), putin(O5_1, O5_2), 5), goal(subtask(organize_pantry(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(organize_pantry(C), close(O6_1), 6), goal(subtask(organize_pantry(C), close(O6_1), 6), T5), T5 <= t, time(T5).
goal(organize_pantry(C), T0, t, 3) :- goal(organize_pantry(C), T0, T2, 1), goal(organize_pantry(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(organize_pantry(C), T6, t, 4) :- subtask(organize_pantry(C), walk(O7_1), 7), goal(subtask(organize_pantry(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(organize_pantry(C), walk(O8_1), 8), goal(subtask(organize_pantry(C), walk(O8_1), 8), T7), T7 <= T8, time(T7), subtask(organize_pantry(C), switchon(O9_1), 9), goal(subtask(organize_pantry(C), switchon(O9_1), 9), T8), T8 <= t, time(T8).
goal(organize_pantry(C), T0, t, 5) :- goal(organize_pantry(C), T0, T5, 3), goal(organize_pantry(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(organize_pantry(C), T9, t, 6) :- subtask(organize_pantry(C), walk(O10_1), 10), goal(subtask(organize_pantry(C), walk(O10_1), 10), T9), T9 <= T10, time(T9), subtask(organize_pantry(C), open(O11_1), 11), goal(subtask(organize_pantry(C), open(O11_1), 11), T10), T10 <= T11, time(T10), subtask(organize_pantry(C), walk(O12_1), 12), goal(subtask(organize_pantry(C), walk(O12_1), 12), T11), T11 <= t, time(T11).
goal(organize_pantry(C), T0, t, 7) :- goal(organize_pantry(C), T0, T8, 5), goal(organize_pantry(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(organize_pantry(C), T12, t, 8) :- subtask(organize_pantry(C), open(O13_1), 13), goal(subtask(organize_pantry(C), open(O13_1), 13), T12), T12 <= T13, time(T12), subtask(organize_pantry(C), putback(O14_1, O14_2), 14), goal(subtask(organize_pantry(C), putback(O14_1, O14_2), 14), T13), T13 <= t, time(T13).
goal(organize_pantry(C), t) :- goal(organize_pantry(C), T0, T11, 7), goal(organize_pantry(C), T12, t, 8), time(T0), time(T11), time(T12), T11 <= T12.

goal(subtask(organize_pantry(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(organize_pantry(C), walk(O), 1).
goal(subtask(organize_pantry(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(organize_pantry(C), grab(O), 2).
goal(subtask(organize_pantry(C), find(O), 3), t) :- goal(C, find(O), t), subtask(organize_pantry(C), find(O), 3).
goal(subtask(organize_pantry(C), open(O), 4), t) :- goal(C, open(O), t), subtask(organize_pantry(C), open(O), 4).
goal(subtask(organize_pantry(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(organize_pantry(C), putin(O1, O2), 5).
goal(subtask(organize_pantry(C), close(O), 6), t) :- goal(C, close(O), t), subtask(organize_pantry(C), close(O), 6).
goal(subtask(organize_pantry(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(organize_pantry(C), walk(O), 7).
goal(subtask(organize_pantry(C), walk(O), 8), t) :- goal(C, walk(O), t), subtask(organize_pantry(C), walk(O), 8).
goal(subtask(organize_pantry(C), switchon(O), 9), t) :- goal(C, switchon(O), t), subtask(organize_pantry(C), switchon(O), 9).
goal(subtask(organize_pantry(C), walk(O), 10), t) :- goal(C, walk(O), t), subtask(organize_pantry(C), walk(O), 10).
goal(subtask(organize_pantry(C), open(O), 11), t) :- goal(C, open(O), t), subtask(organize_pantry(C), open(O), 11).
goal(subtask(organize_pantry(C), walk(O), 12), t) :- goal(C, walk(O), t), subtask(organize_pantry(C), walk(O), 12).
goal(subtask(organize_pantry(C), open(O), 13), t) :- goal(C, open(O), t), subtask(organize_pantry(C), open(O), 13).
goal(subtask(organize_pantry(C), putback(O1, O2), 14), t) :- goal(C, putback(O1, O2), t), subtask(organize_pantry(C), putback(O1, O2), 14).
