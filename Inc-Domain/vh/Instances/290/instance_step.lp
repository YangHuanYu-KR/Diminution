#program step(t).

goal(clean_toilet(C), T0, t, 1) :- subtask(clean_toilet(C)), subtask(clean_toilet(C), walk(O1_1), 1), goal(subtask(clean_toilet(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(clean_toilet(C), grab(O2_1), 2), goal(subtask(clean_toilet(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(clean_toilet(C), grab(O3_1), 3), goal(subtask(clean_toilet(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(clean_toilet(C), T3, t, 2) :- subtask(clean_toilet(C), lookat(O4_1), 4), goal(subtask(clean_toilet(C), lookat(O4_1), 4), T3), T3 <= T4, time(T3), subtask(clean_toilet(C), wash(O5_1), 5), goal(subtask(clean_toilet(C), wash(O5_1), 5), T4), T4 <= T5, time(T4), subtask(clean_toilet(C), drop(O6_1), 6), goal(subtask(clean_toilet(C), drop(O6_1), 6), T5), T5 <= t, time(T5).
goal(clean_toilet(C), T0, t, 3) :- goal(clean_toilet(C), T0, T2, 1), goal(clean_toilet(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(clean_toilet(C), T6, t, 4) :- subtask(clean_toilet(C), drop(O7_1), 7), goal(subtask(clean_toilet(C), drop(O7_1), 7), T6), T6 <= t, time(T6).
goal(clean_toilet(C), t) :- goal(clean_toilet(C), T0, T5, 3), goal(clean_toilet(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(clean_toilet(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(clean_toilet(C), walk(O), 1).
goal(subtask(clean_toilet(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(clean_toilet(C), grab(O), 2).
goal(subtask(clean_toilet(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(clean_toilet(C), grab(O), 3).
goal(subtask(clean_toilet(C), lookat(O), 4), t) :- goal(C, lookat(O), t), subtask(clean_toilet(C), lookat(O), 4).
goal(subtask(clean_toilet(C), wash(O), 5), t) :- goal(C, wash(O), t), subtask(clean_toilet(C), wash(O), 5).
goal(subtask(clean_toilet(C), drop(O), 6), t) :- goal(C, drop(O), t), subtask(clean_toilet(C), drop(O), 6).
goal(subtask(clean_toilet(C), drop(O), 7), t) :- goal(C, drop(O), t), subtask(clean_toilet(C), drop(O), 7).
