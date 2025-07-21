#program step(t).

goal(place_centerpiece(C), T0, t, 1) :- subtask(place_centerpiece(C)), subtask(place_centerpiece(C), walk(O1_1), 1), goal(subtask(place_centerpiece(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(place_centerpiece(C), walk(O2_1), 2), goal(subtask(place_centerpiece(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(place_centerpiece(C), walk(O3_1), 3), goal(subtask(place_centerpiece(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(place_centerpiece(C), T3, t, 2) :- subtask(place_centerpiece(C), walk(O4_1), 4), goal(subtask(place_centerpiece(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(place_centerpiece(C), walk(O5_1), 5), goal(subtask(place_centerpiece(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(place_centerpiece(C), walk(O6_1), 6), goal(subtask(place_centerpiece(C), walk(O6_1), 6), T5), T5 <= t, time(T5).
goal(place_centerpiece(C), T0, t, 3) :- goal(place_centerpiece(C), T0, T2, 1), goal(place_centerpiece(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(place_centerpiece(C), T6, t, 4) :- subtask(place_centerpiece(C), walk(O7_1), 7), goal(subtask(place_centerpiece(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(place_centerpiece(C), walk(O8_1), 8), goal(subtask(place_centerpiece(C), walk(O8_1), 8), T7), T7 <= T8, time(T7), subtask(place_centerpiece(C), walk(O9_1), 9), goal(subtask(place_centerpiece(C), walk(O9_1), 9), T8), T8 <= t, time(T8).
goal(place_centerpiece(C), T0, t, 5) :- goal(place_centerpiece(C), T0, T5, 3), goal(place_centerpiece(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(place_centerpiece(C), T9, t, 6) :- subtask(place_centerpiece(C), walk(O10_1), 10), goal(subtask(place_centerpiece(C), walk(O10_1), 10), T9), T9 <= T10, time(T9), subtask(place_centerpiece(C), walk(O11_1), 11), goal(subtask(place_centerpiece(C), walk(O11_1), 11), T10), T10 <= T11, time(T10), subtask(place_centerpiece(C), walk(O12_1), 12), goal(subtask(place_centerpiece(C), walk(O12_1), 12), T11), T11 <= t, time(T11).
goal(place_centerpiece(C), T0, t, 7) :- goal(place_centerpiece(C), T0, T8, 5), goal(place_centerpiece(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(place_centerpiece(C), T12, t, 8) :- subtask(place_centerpiece(C), walk(O13_1), 13), goal(subtask(place_centerpiece(C), walk(O13_1), 13), T12), T12 <= T13, time(T12), subtask(place_centerpiece(C), walk(O14_1), 14), goal(subtask(place_centerpiece(C), walk(O14_1), 14), T13), T13 <= t, time(T13).
goal(place_centerpiece(C), t) :- goal(place_centerpiece(C), T0, T11, 7), goal(place_centerpiece(C), T12, t, 8), time(T0), time(T11), time(T12), T11 <= T12.

goal(subtask(place_centerpiece(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(place_centerpiece(C), walk(O), 1).
goal(subtask(place_centerpiece(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(place_centerpiece(C), walk(O), 2).
goal(subtask(place_centerpiece(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(place_centerpiece(C), walk(O), 3).
goal(subtask(place_centerpiece(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(place_centerpiece(C), walk(O), 4).
goal(subtask(place_centerpiece(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(place_centerpiece(C), walk(O), 5).
goal(subtask(place_centerpiece(C), walk(O), 6), t) :- goal(C, walk(O), t), subtask(place_centerpiece(C), walk(O), 6).
goal(subtask(place_centerpiece(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(place_centerpiece(C), walk(O), 7).
goal(subtask(place_centerpiece(C), walk(O), 8), t) :- goal(C, walk(O), t), subtask(place_centerpiece(C), walk(O), 8).
goal(subtask(place_centerpiece(C), walk(O), 9), t) :- goal(C, walk(O), t), subtask(place_centerpiece(C), walk(O), 9).
goal(subtask(place_centerpiece(C), walk(O), 10), t) :- goal(C, walk(O), t), subtask(place_centerpiece(C), walk(O), 10).
goal(subtask(place_centerpiece(C), walk(O), 11), t) :- goal(C, walk(O), t), subtask(place_centerpiece(C), walk(O), 11).
goal(subtask(place_centerpiece(C), walk(O), 12), t) :- goal(C, walk(O), t), subtask(place_centerpiece(C), walk(O), 12).
goal(subtask(place_centerpiece(C), walk(O), 13), t) :- goal(C, walk(O), t), subtask(place_centerpiece(C), walk(O), 13).
goal(subtask(place_centerpiece(C), walk(O), 14), t) :- goal(C, walk(O), t), subtask(place_centerpiece(C), walk(O), 14).
