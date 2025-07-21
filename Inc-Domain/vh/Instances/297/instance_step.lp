#program step(t).

goal(organize_pantry(C), T0, t, 1) :- subtask(organize_pantry(C)), subtask(organize_pantry(C), walk(O1_1), 1), goal(subtask(organize_pantry(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(organize_pantry(C), grab(O2_1), 2), goal(subtask(organize_pantry(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(organize_pantry(C), walk(O3_1), 3), goal(subtask(organize_pantry(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(organize_pantry(C), T3, t, 2) :- subtask(organize_pantry(C), open(O4_1), 4), goal(subtask(organize_pantry(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(organize_pantry(C), putin(O5_1, O5_2), 5), goal(subtask(organize_pantry(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(organize_pantry(C), grab(O6_1), 6), goal(subtask(organize_pantry(C), grab(O6_1), 6), T5), T5 <= t, time(T5).
goal(organize_pantry(C), T0, t, 3) :- goal(organize_pantry(C), T0, T2, 1), goal(organize_pantry(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(organize_pantry(C), T6, t, 4) :- subtask(organize_pantry(C), putin(O7_1, O7_2), 7), goal(subtask(organize_pantry(C), putin(O7_1, O7_2), 7), T6), T6 <= T7, time(T6), subtask(organize_pantry(C), grab(O8_1), 8), goal(subtask(organize_pantry(C), grab(O8_1), 8), T7), T7 <= T8, time(T7), subtask(organize_pantry(C), putin(O9_1, O9_2), 9), goal(subtask(organize_pantry(C), putin(O9_1, O9_2), 9), T8), T8 <= t, time(T8).
goal(organize_pantry(C), T0, t, 5) :- goal(organize_pantry(C), T0, T5, 3), goal(organize_pantry(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(organize_pantry(C), T9, t, 6) :- subtask(organize_pantry(C), grab(O10_1), 10), goal(subtask(organize_pantry(C), grab(O10_1), 10), T9), T9 <= T10, time(T9), subtask(organize_pantry(C), putin(O11_1, O11_2), 11), goal(subtask(organize_pantry(C), putin(O11_1, O11_2), 11), T10), T10 <= T11, time(T10), subtask(organize_pantry(C), grab(O12_1), 12), goal(subtask(organize_pantry(C), grab(O12_1), 12), T11), T11 <= t, time(T11).
goal(organize_pantry(C), T0, t, 7) :- goal(organize_pantry(C), T0, T8, 5), goal(organize_pantry(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(organize_pantry(C), T12, t, 8) :- subtask(organize_pantry(C), putin(O13_1, O13_2), 13), goal(subtask(organize_pantry(C), putin(O13_1, O13_2), 13), T12), T12 <= T13, time(T12), subtask(organize_pantry(C), grab(O14_1), 14), goal(subtask(organize_pantry(C), grab(O14_1), 14), T13), T13 <= T14, time(T13), subtask(organize_pantry(C), putin(O15_1, O15_2), 15), goal(subtask(organize_pantry(C), putin(O15_1, O15_2), 15), T14), T14 <= t, time(T14).
goal(organize_pantry(C), T0, t, 9) :- goal(organize_pantry(C), T0, T11, 7), goal(organize_pantry(C), T12, T14, 8), time(T0), time(T11), time(T12), T11 <= T12, time(T14), T12 <= t.
goal(organize_pantry(C), T15, t, 10) :- subtask(organize_pantry(C), close(O16_1), 16), goal(subtask(organize_pantry(C), close(O16_1), 16), T15), T15 <= t, time(T15).
goal(organize_pantry(C), t) :- goal(organize_pantry(C), T0, T14, 9), goal(organize_pantry(C), T15, t, 10), time(T0), time(T14), time(T15), T14 <= T15.

goal(subtask(organize_pantry(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(organize_pantry(C), walk(O), 1).
goal(subtask(organize_pantry(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(organize_pantry(C), grab(O), 2).
goal(subtask(organize_pantry(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(organize_pantry(C), walk(O), 3).
goal(subtask(organize_pantry(C), open(O), 4), t) :- goal(C, open(O), t), subtask(organize_pantry(C), open(O), 4).
goal(subtask(organize_pantry(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(organize_pantry(C), putin(O1, O2), 5).
goal(subtask(organize_pantry(C), grab(O), 6), t) :- goal(C, grab(O), t), subtask(organize_pantry(C), grab(O), 6).
goal(subtask(organize_pantry(C), putin(O1, O2), 7), t) :- goal(C, putin(O1, O2), t), subtask(organize_pantry(C), putin(O1, O2), 7).
goal(subtask(organize_pantry(C), grab(O), 8), t) :- goal(C, grab(O), t), subtask(organize_pantry(C), grab(O), 8).
goal(subtask(organize_pantry(C), putin(O1, O2), 9), t) :- goal(C, putin(O1, O2), t), subtask(organize_pantry(C), putin(O1, O2), 9).
goal(subtask(organize_pantry(C), grab(O), 10), t) :- goal(C, grab(O), t), subtask(organize_pantry(C), grab(O), 10).
goal(subtask(organize_pantry(C), putin(O1, O2), 11), t) :- goal(C, putin(O1, O2), t), subtask(organize_pantry(C), putin(O1, O2), 11).
goal(subtask(organize_pantry(C), grab(O), 12), t) :- goal(C, grab(O), t), subtask(organize_pantry(C), grab(O), 12).
goal(subtask(organize_pantry(C), putin(O1, O2), 13), t) :- goal(C, putin(O1, O2), t), subtask(organize_pantry(C), putin(O1, O2), 13).
goal(subtask(organize_pantry(C), grab(O), 14), t) :- goal(C, grab(O), t), subtask(organize_pantry(C), grab(O), 14).
goal(subtask(organize_pantry(C), putin(O1, O2), 15), t) :- goal(C, putin(O1, O2), t), subtask(organize_pantry(C), putin(O1, O2), 15).
goal(subtask(organize_pantry(C), close(O), 16), t) :- goal(C, close(O), t), subtask(organize_pantry(C), close(O), 16).
