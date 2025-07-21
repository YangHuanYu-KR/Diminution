#program step(t).

goal(clean_bathroom(C), T0, t, 1) :- subtask(clean_bathroom(C)), subtask(clean_bathroom(C), walk(O1_1), 1), goal(subtask(clean_bathroom(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(clean_bathroom(C), lookat(O2_1), 2), goal(subtask(clean_bathroom(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(clean_bathroom(C), wash(O3_1), 3), goal(subtask(clean_bathroom(C), wash(O3_1), 3), T2), T2 <= t, time(T2).
goal(clean_bathroom(C), T3, t, 2) :- subtask(clean_bathroom(C), wash(O4_1), 4), goal(subtask(clean_bathroom(C), wash(O4_1), 4), T3), T3 <= T4, time(T3), subtask(clean_bathroom(C), wash(O5_1), 5), goal(subtask(clean_bathroom(C), wash(O5_1), 5), T4), T4 <= T5, time(T4), subtask(clean_bathroom(C), walk(O6_1), 6), goal(subtask(clean_bathroom(C), walk(O6_1), 6), T5), T5 <= t, time(T5).
goal(clean_bathroom(C), T0, t, 3) :- goal(clean_bathroom(C), T0, T2, 1), goal(clean_bathroom(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(clean_bathroom(C), T6, t, 4) :- subtask(clean_bathroom(C), wash(O7_1), 7), goal(subtask(clean_bathroom(C), wash(O7_1), 7), T6), T6 <= T7, time(T6), subtask(clean_bathroom(C), lookat(O8_1), 8), goal(subtask(clean_bathroom(C), lookat(O8_1), 8), T7), T7 <= T8, time(T7), subtask(clean_bathroom(C), touch(O9_1), 9), goal(subtask(clean_bathroom(C), touch(O9_1), 9), T8), T8 <= t, time(T8).
goal(clean_bathroom(C), t) :- goal(clean_bathroom(C), T0, T5, 3), goal(clean_bathroom(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(clean_bathroom(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(clean_bathroom(C), walk(O), 1).
goal(subtask(clean_bathroom(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(clean_bathroom(C), lookat(O), 2).
goal(subtask(clean_bathroom(C), wash(O), 3), t) :- goal(C, wash(O), t), subtask(clean_bathroom(C), wash(O), 3).
goal(subtask(clean_bathroom(C), wash(O), 4), t) :- goal(C, wash(O), t), subtask(clean_bathroom(C), wash(O), 4).
goal(subtask(clean_bathroom(C), wash(O), 5), t) :- goal(C, wash(O), t), subtask(clean_bathroom(C), wash(O), 5).
goal(subtask(clean_bathroom(C), walk(O), 6), t) :- goal(C, walk(O), t), subtask(clean_bathroom(C), walk(O), 6).
goal(subtask(clean_bathroom(C), wash(O), 7), t) :- goal(C, wash(O), t), subtask(clean_bathroom(C), wash(O), 7).
goal(subtask(clean_bathroom(C), lookat(O), 8), t) :- goal(C, lookat(O), t), subtask(clean_bathroom(C), lookat(O), 8).
goal(subtask(clean_bathroom(C), touch(O), 9), t) :- goal(C, touch(O), t), subtask(clean_bathroom(C), touch(O), 9).
