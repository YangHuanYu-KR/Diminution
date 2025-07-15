#program step(t).

goal(arrange_furniture(C), T0, t, 1) :- subtask(arrange_furniture(C)), subtask(arrange_furniture(C), walk(O1_1), 1), goal(subtask(arrange_furniture(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(arrange_furniture(C), lookat(O2_1), 2), goal(subtask(arrange_furniture(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(arrange_furniture(C), walk(O3_1), 3), goal(subtask(arrange_furniture(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(arrange_furniture(C), T3, t, 2) :- subtask(arrange_furniture(C), walk(O4_1), 4), goal(subtask(arrange_furniture(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(arrange_furniture(C), lookat(O5_1), 5), goal(subtask(arrange_furniture(C), lookat(O5_1), 5), T4), T4 <= T5, time(T4), subtask(arrange_furniture(C), walk(O6_1), 6), goal(subtask(arrange_furniture(C), walk(O6_1), 6), T5), T5 <= t, time(T5).
goal(arrange_furniture(C), T0, t, 3) :- goal(arrange_furniture(C), T0, T2, 1), goal(arrange_furniture(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(arrange_furniture(C), T6, t, 4) :- subtask(arrange_furniture(C), walk(O7_1), 7), goal(subtask(arrange_furniture(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(arrange_furniture(C), lookat(O8_1), 8), goal(subtask(arrange_furniture(C), lookat(O8_1), 8), T7), T7 <= T8, time(T7), subtask(arrange_furniture(C), walk(O9_1), 9), goal(subtask(arrange_furniture(C), walk(O9_1), 9), T8), T8 <= t, time(T8).
goal(arrange_furniture(C), t) :- goal(arrange_furniture(C), T0, T5, 3), goal(arrange_furniture(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(arrange_furniture(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(arrange_furniture(C), walk(O), 1).
goal(subtask(arrange_furniture(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(arrange_furniture(C), lookat(O), 2).
goal(subtask(arrange_furniture(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(arrange_furniture(C), walk(O), 3).
goal(subtask(arrange_furniture(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(arrange_furniture(C), walk(O), 4).
goal(subtask(arrange_furniture(C), lookat(O), 5), t) :- goal(C, lookat(O), t), subtask(arrange_furniture(C), lookat(O), 5).
goal(subtask(arrange_furniture(C), walk(O), 6), t) :- goal(C, walk(O), t), subtask(arrange_furniture(C), walk(O), 6).
goal(subtask(arrange_furniture(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(arrange_furniture(C), walk(O), 7).
goal(subtask(arrange_furniture(C), lookat(O), 8), t) :- goal(C, lookat(O), t), subtask(arrange_furniture(C), lookat(O), 8).
goal(subtask(arrange_furniture(C), walk(O), 9), t) :- goal(C, walk(O), t), subtask(arrange_furniture(C), walk(O), 9).
