#program step(t).

goal(wash_clothes(C), T0, t, 1) :- subtask(wash_clothes(C)), subtask(wash_clothes(C), walk(O1_1), 1), goal(subtask(wash_clothes(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(wash_clothes(C), grab(O2_1), 2), goal(subtask(wash_clothes(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(wash_clothes(C), putback(O3_1, O3_2), 3), goal(subtask(wash_clothes(C), putback(O3_1, O3_2), 3), T2), T2 <= t, time(T2).
goal(wash_clothes(C), T3, t, 2) :- subtask(wash_clothes(C), walk(O4_1), 4), goal(subtask(wash_clothes(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(wash_clothes(C), grab(O5_1), 5), goal(subtask(wash_clothes(C), grab(O5_1), 5), T4), T4 <= T5, time(T4), subtask(wash_clothes(C), walk(O6_1), 6), goal(subtask(wash_clothes(C), walk(O6_1), 6), T5), T5 <= t, time(T5).
goal(wash_clothes(C), T0, t, 3) :- goal(wash_clothes(C), T0, T2, 1), goal(wash_clothes(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(wash_clothes(C), T6, t, 4) :- subtask(wash_clothes(C), open(O7_1), 7), goal(subtask(wash_clothes(C), open(O7_1), 7), T6), T6 <= T7, time(T6), subtask(wash_clothes(C), pour(O8_1, O8_2), 8), goal(subtask(wash_clothes(C), pour(O8_1, O8_2), 8), T7), T7 <= T8, time(T7), subtask(wash_clothes(C), wash(O9_1), 9), goal(subtask(wash_clothes(C), wash(O9_1), 9), T8), T8 <= t, time(T8).
goal(wash_clothes(C), T0, t, 5) :- goal(wash_clothes(C), T0, T5, 3), goal(wash_clothes(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(wash_clothes(C), T9, t, 6) :- subtask(wash_clothes(C), close(O10_1), 10), goal(subtask(wash_clothes(C), close(O10_1), 10), T9), T9 <= T10, time(T9), subtask(wash_clothes(C), putback(O11_1, O11_2), 11), goal(subtask(wash_clothes(C), putback(O11_1, O11_2), 11), T10), T10 <= t, time(T10).
goal(wash_clothes(C), t) :- goal(wash_clothes(C), T0, T8, 5), goal(wash_clothes(C), T9, t, 6), time(T0), time(T8), time(T9), T8 <= T9.

goal(subtask(wash_clothes(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(wash_clothes(C), walk(O), 1).
goal(subtask(wash_clothes(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(wash_clothes(C), grab(O), 2).
goal(subtask(wash_clothes(C), putback(O1, O2), 3), t) :- goal(C, putback(O1, O2), t), subtask(wash_clothes(C), putback(O1, O2), 3).
goal(subtask(wash_clothes(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(wash_clothes(C), walk(O), 4).
goal(subtask(wash_clothes(C), grab(O), 5), t) :- goal(C, grab(O), t), subtask(wash_clothes(C), grab(O), 5).
goal(subtask(wash_clothes(C), walk(O), 6), t) :- goal(C, walk(O), t), subtask(wash_clothes(C), walk(O), 6).
goal(subtask(wash_clothes(C), open(O), 7), t) :- goal(C, open(O), t), subtask(wash_clothes(C), open(O), 7).
goal(subtask(wash_clothes(C), pour(O1, O2), 8), t) :- goal(C, pour(O1, O2), t), subtask(wash_clothes(C), pour(O1, O2), 8).
goal(subtask(wash_clothes(C), wash(O), 9), t) :- goal(C, wash(O), t), subtask(wash_clothes(C), wash(O), 9).
goal(subtask(wash_clothes(C), close(O), 10), t) :- goal(C, close(O), t), subtask(wash_clothes(C), close(O), 10).
goal(subtask(wash_clothes(C), putback(O1, O2), 11), t) :- goal(C, putback(O1, O2), t), subtask(wash_clothes(C), putback(O1, O2), 11).
