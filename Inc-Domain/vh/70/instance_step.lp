#program step(t).

goal(dust(C), T0, t, 1) :- subtask(dust(C)), subtask(dust(C), walk(O1_1), 1), goal(subtask(dust(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(dust(C), touch(O2_1), 2), goal(subtask(dust(C), touch(O2_1), 2), T1), T1 <= T2, time(T1), subtask(dust(C), touch(O3_1), 3), goal(subtask(dust(C), touch(O3_1), 3), T2), T2 <= t, time(T2).
goal(dust(C), T3, t, 2) :- subtask(dust(C), touch(O4_1), 4), goal(subtask(dust(C), touch(O4_1), 4), T3), T3 <= T4, time(T3), subtask(dust(C), touch(O5_1), 5), goal(subtask(dust(C), touch(O5_1), 5), T4), T4 <= T5, time(T4), subtask(dust(C), touch(O6_1), 6), goal(subtask(dust(C), touch(O6_1), 6), T5), T5 <= t, time(T5).
goal(dust(C), T0, t, 3) :- goal(dust(C), T0, T2, 1), goal(dust(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(dust(C), T6, t, 4) :- subtask(dust(C), touch(O7_1), 7), goal(subtask(dust(C), touch(O7_1), 7), T6), T6 <= T7, time(T6), subtask(dust(C), touch(O8_1), 8), goal(subtask(dust(C), touch(O8_1), 8), T7), T7 <= T8, time(T7), subtask(dust(C), touch(O9_1), 9), goal(subtask(dust(C), touch(O9_1), 9), T8), T8 <= t, time(T8).
goal(dust(C), T0, t, 5) :- goal(dust(C), T0, T5, 3), goal(dust(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(dust(C), T9, t, 6) :- subtask(dust(C), touch(O10_1), 10), goal(subtask(dust(C), touch(O10_1), 10), T9), T9 <= t, time(T9).
goal(dust(C), t) :- goal(dust(C), T0, T8, 5), goal(dust(C), T9, t, 6), time(T0), time(T8), time(T9), T8 <= T9.

goal(subtask(dust(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(dust(C), walk(O), 1).
goal(subtask(dust(C), touch(O), 2), t) :- goal(C, touch(O), t), subtask(dust(C), touch(O), 2).
goal(subtask(dust(C), touch(O), 3), t) :- goal(C, touch(O), t), subtask(dust(C), touch(O), 3).
goal(subtask(dust(C), touch(O), 4), t) :- goal(C, touch(O), t), subtask(dust(C), touch(O), 4).
goal(subtask(dust(C), touch(O), 5), t) :- goal(C, touch(O), t), subtask(dust(C), touch(O), 5).
goal(subtask(dust(C), touch(O), 6), t) :- goal(C, touch(O), t), subtask(dust(C), touch(O), 6).
goal(subtask(dust(C), touch(O), 7), t) :- goal(C, touch(O), t), subtask(dust(C), touch(O), 7).
goal(subtask(dust(C), touch(O), 8), t) :- goal(C, touch(O), t), subtask(dust(C), touch(O), 8).
goal(subtask(dust(C), touch(O), 9), t) :- goal(C, touch(O), t), subtask(dust(C), touch(O), 9).
goal(subtask(dust(C), touch(O), 10), t) :- goal(C, touch(O), t), subtask(dust(C), touch(O), 10).
