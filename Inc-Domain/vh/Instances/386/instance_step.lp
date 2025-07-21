#program step(t).

goal(unload_dishwasher(C), T0, t, 1) :- subtask(unload_dishwasher(C)), subtask(unload_dishwasher(C), walk(O1_1), 1), goal(subtask(unload_dishwasher(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(unload_dishwasher(C), open(O2_1), 2), goal(subtask(unload_dishwasher(C), open(O2_1), 2), T1), T1 <= T2, time(T1), subtask(unload_dishwasher(C), grab(O3_1), 3), goal(subtask(unload_dishwasher(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(unload_dishwasher(C), T3, t, 2) :- subtask(unload_dishwasher(C), putback(O4_1, O4_2), 4), goal(subtask(unload_dishwasher(C), putback(O4_1, O4_2), 4), T3), T3 <= T4, time(T3), subtask(unload_dishwasher(C), grab(O5_1), 5), goal(subtask(unload_dishwasher(C), grab(O5_1), 5), T4), T4 <= T5, time(T4), subtask(unload_dishwasher(C), putback(O6_1, O6_2), 6), goal(subtask(unload_dishwasher(C), putback(O6_1, O6_2), 6), T5), T5 <= t, time(T5).
goal(unload_dishwasher(C), T0, t, 3) :- goal(unload_dishwasher(C), T0, T2, 1), goal(unload_dishwasher(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(unload_dishwasher(C), T6, t, 4) :- subtask(unload_dishwasher(C), grab(O7_1), 7), goal(subtask(unload_dishwasher(C), grab(O7_1), 7), T6), T6 <= T7, time(T6), subtask(unload_dishwasher(C), putback(O8_1, O8_2), 8), goal(subtask(unload_dishwasher(C), putback(O8_1, O8_2), 8), T7), T7 <= T8, time(T7), subtask(unload_dishwasher(C), grab(O9_1), 9), goal(subtask(unload_dishwasher(C), grab(O9_1), 9), T8), T8 <= t, time(T8).
goal(unload_dishwasher(C), T0, t, 5) :- goal(unload_dishwasher(C), T0, T5, 3), goal(unload_dishwasher(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(unload_dishwasher(C), T9, t, 6) :- subtask(unload_dishwasher(C), putback(O10_1, O10_2), 10), goal(subtask(unload_dishwasher(C), putback(O10_1, O10_2), 10), T9), T9 <= T10, time(T9), subtask(unload_dishwasher(C), grab(O11_1), 11), goal(subtask(unload_dishwasher(C), grab(O11_1), 11), T10), T10 <= T11, time(T10), subtask(unload_dishwasher(C), putback(O12_1, O12_2), 12), goal(subtask(unload_dishwasher(C), putback(O12_1, O12_2), 12), T11), T11 <= t, time(T11).
goal(unload_dishwasher(C), T0, t, 7) :- goal(unload_dishwasher(C), T0, T8, 5), goal(unload_dishwasher(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(unload_dishwasher(C), T12, t, 8) :- subtask(unload_dishwasher(C), close(O13_1), 13), goal(subtask(unload_dishwasher(C), close(O13_1), 13), T12), T12 <= t, time(T12).
goal(unload_dishwasher(C), t) :- goal(unload_dishwasher(C), T0, T11, 7), goal(unload_dishwasher(C), T12, t, 8), time(T0), time(T11), time(T12), T11 <= T12.

goal(subtask(unload_dishwasher(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(unload_dishwasher(C), walk(O), 1).
goal(subtask(unload_dishwasher(C), open(O), 2), t) :- goal(C, open(O), t), subtask(unload_dishwasher(C), open(O), 2).
goal(subtask(unload_dishwasher(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(unload_dishwasher(C), grab(O), 3).
goal(subtask(unload_dishwasher(C), putback(O1, O2), 4), t) :- goal(C, putback(O1, O2), t), subtask(unload_dishwasher(C), putback(O1, O2), 4).
goal(subtask(unload_dishwasher(C), grab(O), 5), t) :- goal(C, grab(O), t), subtask(unload_dishwasher(C), grab(O), 5).
goal(subtask(unload_dishwasher(C), putback(O1, O2), 6), t) :- goal(C, putback(O1, O2), t), subtask(unload_dishwasher(C), putback(O1, O2), 6).
goal(subtask(unload_dishwasher(C), grab(O), 7), t) :- goal(C, grab(O), t), subtask(unload_dishwasher(C), grab(O), 7).
goal(subtask(unload_dishwasher(C), putback(O1, O2), 8), t) :- goal(C, putback(O1, O2), t), subtask(unload_dishwasher(C), putback(O1, O2), 8).
goal(subtask(unload_dishwasher(C), grab(O), 9), t) :- goal(C, grab(O), t), subtask(unload_dishwasher(C), grab(O), 9).
goal(subtask(unload_dishwasher(C), putback(O1, O2), 10), t) :- goal(C, putback(O1, O2), t), subtask(unload_dishwasher(C), putback(O1, O2), 10).
goal(subtask(unload_dishwasher(C), grab(O), 11), t) :- goal(C, grab(O), t), subtask(unload_dishwasher(C), grab(O), 11).
goal(subtask(unload_dishwasher(C), putback(O1, O2), 12), t) :- goal(C, putback(O1, O2), t), subtask(unload_dishwasher(C), putback(O1, O2), 12).
goal(subtask(unload_dishwasher(C), close(O), 13), t) :- goal(C, close(O), t), subtask(unload_dishwasher(C), close(O), 13).
