#program step(t).

goal(push_all_chairs_in(C), T0, t, 1) :- subtask(push_all_chairs_in(C)), subtask(push_all_chairs_in(C), walk(O1_1), 1), goal(subtask(push_all_chairs_in(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(push_all_chairs_in(C), walk(O2_1), 2), goal(subtask(push_all_chairs_in(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(push_all_chairs_in(C), grab(O3_1), 3), goal(subtask(push_all_chairs_in(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(push_all_chairs_in(C), T3, t, 2) :- subtask(push_all_chairs_in(C), putback(O4_1, O4_2), 4), goal(subtask(push_all_chairs_in(C), putback(O4_1, O4_2), 4), T3), T3 <= T4, time(T3), subtask(push_all_chairs_in(C), drop(O5_1), 5), goal(subtask(push_all_chairs_in(C), drop(O5_1), 5), T4), T4 <= T5, time(T4), subtask(push_all_chairs_in(C), walk(O6_1), 6), goal(subtask(push_all_chairs_in(C), walk(O6_1), 6), T5), T5 <= t, time(T5).
goal(push_all_chairs_in(C), T0, t, 3) :- goal(push_all_chairs_in(C), T0, T2, 1), goal(push_all_chairs_in(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(push_all_chairs_in(C), T6, t, 4) :- subtask(push_all_chairs_in(C), walk(O7_1), 7), goal(subtask(push_all_chairs_in(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(push_all_chairs_in(C), grab(O8_1), 8), goal(subtask(push_all_chairs_in(C), grab(O8_1), 8), T7), T7 <= T8, time(T7), subtask(push_all_chairs_in(C), putback(O9_1, O9_2), 9), goal(subtask(push_all_chairs_in(C), putback(O9_1, O9_2), 9), T8), T8 <= t, time(T8).
goal(push_all_chairs_in(C), T0, t, 5) :- goal(push_all_chairs_in(C), T0, T5, 3), goal(push_all_chairs_in(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(push_all_chairs_in(C), T9, t, 6) :- subtask(push_all_chairs_in(C), drop(O10_1), 10), goal(subtask(push_all_chairs_in(C), drop(O10_1), 10), T9), T9 <= T10, time(T9), subtask(push_all_chairs_in(C), walk(O11_1), 11), goal(subtask(push_all_chairs_in(C), walk(O11_1), 11), T10), T10 <= T11, time(T10), subtask(push_all_chairs_in(C), walk(O12_1), 12), goal(subtask(push_all_chairs_in(C), walk(O12_1), 12), T11), T11 <= t, time(T11).
goal(push_all_chairs_in(C), T0, t, 7) :- goal(push_all_chairs_in(C), T0, T8, 5), goal(push_all_chairs_in(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(push_all_chairs_in(C), T12, t, 8) :- subtask(push_all_chairs_in(C), grab(O13_1), 13), goal(subtask(push_all_chairs_in(C), grab(O13_1), 13), T12), T12 <= T13, time(T12), subtask(push_all_chairs_in(C), putback(O14_1, O14_2), 14), goal(subtask(push_all_chairs_in(C), putback(O14_1, O14_2), 14), T13), T13 <= T14, time(T13), subtask(push_all_chairs_in(C), drop(O15_1), 15), goal(subtask(push_all_chairs_in(C), drop(O15_1), 15), T14), T14 <= t, time(T14).
goal(push_all_chairs_in(C), t) :- goal(push_all_chairs_in(C), T0, T11, 7), goal(push_all_chairs_in(C), T12, t, 8), time(T0), time(T11), time(T12), T11 <= T12.

goal(subtask(push_all_chairs_in(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(push_all_chairs_in(C), walk(O), 1).
goal(subtask(push_all_chairs_in(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(push_all_chairs_in(C), walk(O), 2).
goal(subtask(push_all_chairs_in(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(push_all_chairs_in(C), grab(O), 3).
goal(subtask(push_all_chairs_in(C), putback(O1, O2), 4), t) :- goal(C, putback(O1, O2), t), subtask(push_all_chairs_in(C), putback(O1, O2), 4).
goal(subtask(push_all_chairs_in(C), drop(O), 5), t) :- goal(C, drop(O), t), subtask(push_all_chairs_in(C), drop(O), 5).
goal(subtask(push_all_chairs_in(C), walk(O), 6), t) :- goal(C, walk(O), t), subtask(push_all_chairs_in(C), walk(O), 6).
goal(subtask(push_all_chairs_in(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(push_all_chairs_in(C), walk(O), 7).
goal(subtask(push_all_chairs_in(C), grab(O), 8), t) :- goal(C, grab(O), t), subtask(push_all_chairs_in(C), grab(O), 8).
goal(subtask(push_all_chairs_in(C), putback(O1, O2), 9), t) :- goal(C, putback(O1, O2), t), subtask(push_all_chairs_in(C), putback(O1, O2), 9).
goal(subtask(push_all_chairs_in(C), drop(O), 10), t) :- goal(C, drop(O), t), subtask(push_all_chairs_in(C), drop(O), 10).
goal(subtask(push_all_chairs_in(C), walk(O), 11), t) :- goal(C, walk(O), t), subtask(push_all_chairs_in(C), walk(O), 11).
goal(subtask(push_all_chairs_in(C), walk(O), 12), t) :- goal(C, walk(O), t), subtask(push_all_chairs_in(C), walk(O), 12).
goal(subtask(push_all_chairs_in(C), grab(O), 13), t) :- goal(C, grab(O), t), subtask(push_all_chairs_in(C), grab(O), 13).
goal(subtask(push_all_chairs_in(C), putback(O1, O2), 14), t) :- goal(C, putback(O1, O2), t), subtask(push_all_chairs_in(C), putback(O1, O2), 14).
goal(subtask(push_all_chairs_in(C), drop(O), 15), t) :- goal(C, drop(O), t), subtask(push_all_chairs_in(C), drop(O), 15).
