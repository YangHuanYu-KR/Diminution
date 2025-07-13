#program step(t).

goal(open_front_door(C), T0, t, 1) :- subtask(open_front_door(C)), subtask(open_front_door(C), walk(O1_1), 1), goal(subtask(open_front_door(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(open_front_door(C), walk(O2_1), 2), goal(subtask(open_front_door(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(open_front_door(C), walk(O3_1), 3), goal(subtask(open_front_door(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(open_front_door(C), T3, t, 2) :- subtask(open_front_door(C), walk(O4_1), 4), goal(subtask(open_front_door(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(open_front_door(C), walk(O5_1), 5), goal(subtask(open_front_door(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(open_front_door(C), walk(O6_1), 6), goal(subtask(open_front_door(C), walk(O6_1), 6), T5), T5 <= t, time(T5).
goal(open_front_door(C), T0, t, 3) :- goal(open_front_door(C), T0, T2, 1), goal(open_front_door(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(open_front_door(C), T6, t, 4) :- subtask(open_front_door(C), walk(O7_1), 7), goal(subtask(open_front_door(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(open_front_door(C), walk(O8_1), 8), goal(subtask(open_front_door(C), walk(O8_1), 8), T7), T7 <= T8, time(T7), subtask(open_front_door(C), walk(O9_1), 9), goal(subtask(open_front_door(C), walk(O9_1), 9), T8), T8 <= t, time(T8).
goal(open_front_door(C), T0, t, 5) :- goal(open_front_door(C), T0, T5, 3), goal(open_front_door(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(open_front_door(C), T9, t, 6) :- subtask(open_front_door(C), walk(O10_1), 10), goal(subtask(open_front_door(C), walk(O10_1), 10), T9), T9 <= T10, time(T9), subtask(open_front_door(C), walk(O11_1), 11), goal(subtask(open_front_door(C), walk(O11_1), 11), T10), T10 <= T11, time(T10), subtask(open_front_door(C), walk(O12_1), 12), goal(subtask(open_front_door(C), walk(O12_1), 12), T11), T11 <= t, time(T11).
goal(open_front_door(C), T0, t, 7) :- goal(open_front_door(C), T0, T8, 5), goal(open_front_door(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(open_front_door(C), T12, t, 8) :- subtask(open_front_door(C), walk(O13_1), 13), goal(subtask(open_front_door(C), walk(O13_1), 13), T12), T12 <= T13, time(T12), subtask(open_front_door(C), walk(O14_1), 14), goal(subtask(open_front_door(C), walk(O14_1), 14), T13), T13 <= T14, time(T13), subtask(open_front_door(C), walk(O15_1), 15), goal(subtask(open_front_door(C), walk(O15_1), 15), T14), T14 <= t, time(T14).
goal(open_front_door(C), T0, t, 9) :- goal(open_front_door(C), T0, T11, 7), goal(open_front_door(C), T12, T14, 8), time(T0), time(T11), time(T12), T11 <= T12, time(T14), T12 <= t.
goal(open_front_door(C), T15, t, 10) :- subtask(open_front_door(C), walk(O16_1), 16), goal(subtask(open_front_door(C), walk(O16_1), 16), T15), T15 <= T16, time(T15), subtask(open_front_door(C), walk(O17_1), 17), goal(subtask(open_front_door(C), walk(O17_1), 17), T16), T16 <= t, time(T16).
goal(open_front_door(C), t) :- goal(open_front_door(C), T0, T14, 9), goal(open_front_door(C), T15, t, 10), time(T0), time(T14), time(T15), T14 <= T15.

goal(subtask(open_front_door(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(open_front_door(C), walk(O), 1).
goal(subtask(open_front_door(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(open_front_door(C), walk(O), 2).
goal(subtask(open_front_door(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(open_front_door(C), walk(O), 3).
goal(subtask(open_front_door(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(open_front_door(C), walk(O), 4).
goal(subtask(open_front_door(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(open_front_door(C), walk(O), 5).
goal(subtask(open_front_door(C), walk(O), 6), t) :- goal(C, walk(O), t), subtask(open_front_door(C), walk(O), 6).
goal(subtask(open_front_door(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(open_front_door(C), walk(O), 7).
goal(subtask(open_front_door(C), walk(O), 8), t) :- goal(C, walk(O), t), subtask(open_front_door(C), walk(O), 8).
goal(subtask(open_front_door(C), walk(O), 9), t) :- goal(C, walk(O), t), subtask(open_front_door(C), walk(O), 9).
goal(subtask(open_front_door(C), walk(O), 10), t) :- goal(C, walk(O), t), subtask(open_front_door(C), walk(O), 10).
goal(subtask(open_front_door(C), walk(O), 11), t) :- goal(C, walk(O), t), subtask(open_front_door(C), walk(O), 11).
goal(subtask(open_front_door(C), walk(O), 12), t) :- goal(C, walk(O), t), subtask(open_front_door(C), walk(O), 12).
goal(subtask(open_front_door(C), walk(O), 13), t) :- goal(C, walk(O), t), subtask(open_front_door(C), walk(O), 13).
goal(subtask(open_front_door(C), walk(O), 14), t) :- goal(C, walk(O), t), subtask(open_front_door(C), walk(O), 14).
goal(subtask(open_front_door(C), walk(O), 15), t) :- goal(C, walk(O), t), subtask(open_front_door(C), walk(O), 15).
goal(subtask(open_front_door(C), walk(O), 16), t) :- goal(C, walk(O), t), subtask(open_front_door(C), walk(O), 16).
goal(subtask(open_front_door(C), walk(O), 17), t) :- goal(C, walk(O), t), subtask(open_front_door(C), walk(O), 17).
