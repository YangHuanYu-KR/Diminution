#program step(t).

goal(organize_closet(C), T0, t, 1) :- subtask(organize_closet(C)), subtask(organize_closet(C), walk(O1_1), 1), goal(subtask(organize_closet(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(organize_closet(C), walk(O2_1), 2), goal(subtask(organize_closet(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(organize_closet(C), grab(O3_1), 3), goal(subtask(organize_closet(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(organize_closet(C), T3, t, 2) :- subtask(organize_closet(C), putin(O4_1, O4_2), 4), goal(subtask(organize_closet(C), putin(O4_1, O4_2), 4), T3), T3 <= T4, time(T3), subtask(organize_closet(C), grab(O5_1), 5), goal(subtask(organize_closet(C), grab(O5_1), 5), T4), T4 <= T5, time(T4), subtask(organize_closet(C), putin(O6_1, O6_2), 6), goal(subtask(organize_closet(C), putin(O6_1, O6_2), 6), T5), T5 <= t, time(T5).
goal(organize_closet(C), T0, t, 3) :- goal(organize_closet(C), T0, T2, 1), goal(organize_closet(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(organize_closet(C), T6, t, 4) :- subtask(organize_closet(C), grab(O7_1), 7), goal(subtask(organize_closet(C), grab(O7_1), 7), T6), T6 <= T7, time(T6), subtask(organize_closet(C), putin(O8_1, O8_2), 8), goal(subtask(organize_closet(C), putin(O8_1, O8_2), 8), T7), T7 <= T8, time(T7), subtask(organize_closet(C), lookat(O9_1), 9), goal(subtask(organize_closet(C), lookat(O9_1), 9), T8), T8 <= t, time(T8).
goal(organize_closet(C), T0, t, 5) :- goal(organize_closet(C), T0, T5, 3), goal(organize_closet(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(organize_closet(C), T9, t, 6) :- subtask(organize_closet(C), close(O10_1), 10), goal(subtask(organize_closet(C), close(O10_1), 10), T9), T9 <= t, time(T9).
goal(organize_closet(C), t) :- goal(organize_closet(C), T0, T8, 5), goal(organize_closet(C), T9, t, 6), time(T0), time(T8), time(T9), T8 <= T9.

goal(subtask(organize_closet(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(organize_closet(C), walk(O), 1).
goal(subtask(organize_closet(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(organize_closet(C), walk(O), 2).
goal(subtask(organize_closet(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(organize_closet(C), grab(O), 3).
goal(subtask(organize_closet(C), putin(O1, O2), 4), t) :- goal(C, putin(O1, O2), t), subtask(organize_closet(C), putin(O1, O2), 4).
goal(subtask(organize_closet(C), grab(O), 5), t) :- goal(C, grab(O), t), subtask(organize_closet(C), grab(O), 5).
goal(subtask(organize_closet(C), putin(O1, O2), 6), t) :- goal(C, putin(O1, O2), t), subtask(organize_closet(C), putin(O1, O2), 6).
goal(subtask(organize_closet(C), grab(O), 7), t) :- goal(C, grab(O), t), subtask(organize_closet(C), grab(O), 7).
goal(subtask(organize_closet(C), putin(O1, O2), 8), t) :- goal(C, putin(O1, O2), t), subtask(organize_closet(C), putin(O1, O2), 8).
goal(subtask(organize_closet(C), lookat(O), 9), t) :- goal(C, lookat(O), t), subtask(organize_closet(C), lookat(O), 9).
goal(subtask(organize_closet(C), close(O), 10), t) :- goal(C, close(O), t), subtask(organize_closet(C), close(O), 10).
