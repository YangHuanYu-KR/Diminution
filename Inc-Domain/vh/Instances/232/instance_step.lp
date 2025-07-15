#program step(t).

goal(style_hair(C), T0, t, 1) :- subtask(style_hair(C)), subtask(style_hair(C), walk(O1_1), 1), goal(subtask(style_hair(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(style_hair(C), find(O2_1), 2), goal(subtask(style_hair(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(style_hair(C), grab(O3_1), 3), goal(subtask(style_hair(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(style_hair(C), T3, t, 2) :- subtask(style_hair(C), find(O4_1), 4), goal(subtask(style_hair(C), find(O4_1), 4), T3), T3 <= T4, time(T3), subtask(style_hair(C), standup, 5), goal(subtask(style_hair(C), standup, 5), T4), T4 <= T5, time(T4), subtask(style_hair(C), watch(O6_1), 6), goal(subtask(style_hair(C), watch(O6_1), 6), T5), T5 <= t, time(T5).
goal(style_hair(C), T0, t, 3) :- goal(style_hair(C), T0, T2, 1), goal(style_hair(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(style_hair(C), T6, t, 4) :- subtask(style_hair(C), touch(O7_1), 7), goal(subtask(style_hair(C), touch(O7_1), 7), T6), T6 <= T7, time(T6), subtask(style_hair(C), cut(O8_1), 8), goal(subtask(style_hair(C), cut(O8_1), 8), T7), T7 <= T8, time(T7), subtask(style_hair(C), lookat(O9_1), 9), goal(subtask(style_hair(C), lookat(O9_1), 9), T8), T8 <= t, time(T8).
goal(style_hair(C), t) :- goal(style_hair(C), T0, T5, 3), goal(style_hair(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(style_hair(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(style_hair(C), walk(O), 1).
goal(subtask(style_hair(C), find(O), 2), t) :- goal(C, find(O), t), subtask(style_hair(C), find(O), 2).
goal(subtask(style_hair(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(style_hair(C), grab(O), 3).
goal(subtask(style_hair(C), find(O), 4), t) :- goal(C, find(O), t), subtask(style_hair(C), find(O), 4).
goal(subtask(style_hair(C), standup, 5), t) :- goal(C, standup, t), subtask(style_hair(C), standup, 5).
goal(subtask(style_hair(C), watch(O), 6), t) :- goal(C, watch(O), t), subtask(style_hair(C), watch(O), 6).
goal(subtask(style_hair(C), touch(O), 7), t) :- goal(C, touch(O), t), subtask(style_hair(C), touch(O), 7).
goal(subtask(style_hair(C), cut(O), 8), t) :- goal(C, cut(O), t), subtask(style_hair(C), cut(O), 8).
goal(subtask(style_hair(C), lookat(O), 9), t) :- goal(C, lookat(O), t), subtask(style_hair(C), lookat(O), 9).
