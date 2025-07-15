#program step(t).

goal(settle_in(C), T0, t, 1) :- subtask(settle_in(C)), subtask(settle_in(C), walk(O1_1), 1), goal(subtask(settle_in(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(settle_in(C), sit(O2_1), 2), goal(subtask(settle_in(C), sit(O2_1), 2), T1), T1 <= T2, time(T1), subtask(settle_in(C), lookat(O3_1), 3), goal(subtask(settle_in(C), lookat(O3_1), 3), T2), T2 <= t, time(T2).
goal(settle_in(C), T3, t, 2) :- subtask(settle_in(C), switchon(O4_1), 4), goal(subtask(settle_in(C), switchon(O4_1), 4), T3), T3 <= T4, time(T3), subtask(settle_in(C), grab(O5_1), 5), goal(subtask(settle_in(C), grab(O5_1), 5), T4), T4 <= T5, time(T4), subtask(settle_in(C), touch(O6_1), 6), goal(subtask(settle_in(C), touch(O6_1), 6), T5), T5 <= t, time(T5).
goal(settle_in(C), T0, t, 3) :- goal(settle_in(C), T0, T2, 1), goal(settle_in(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(settle_in(C), T6, t, 4) :- subtask(settle_in(C), lookat(O7_1), 7), goal(subtask(settle_in(C), lookat(O7_1), 7), T6), T6 <= T7, time(T6), subtask(settle_in(C), grab(O8_1), 8), goal(subtask(settle_in(C), grab(O8_1), 8), T7), T7 <= T8, time(T7), subtask(settle_in(C), touch(O9_1), 9), goal(subtask(settle_in(C), touch(O9_1), 9), T8), T8 <= t, time(T8).
goal(settle_in(C), t) :- goal(settle_in(C), T0, T5, 3), goal(settle_in(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(settle_in(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(settle_in(C), walk(O), 1).
goal(subtask(settle_in(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(settle_in(C), sit(O), 2).
goal(subtask(settle_in(C), lookat(O), 3), t) :- goal(C, lookat(O), t), subtask(settle_in(C), lookat(O), 3).
goal(subtask(settle_in(C), switchon(O), 4), t) :- goal(C, switchon(O), t), subtask(settle_in(C), switchon(O), 4).
goal(subtask(settle_in(C), grab(O), 5), t) :- goal(C, grab(O), t), subtask(settle_in(C), grab(O), 5).
goal(subtask(settle_in(C), touch(O), 6), t) :- goal(C, touch(O), t), subtask(settle_in(C), touch(O), 6).
goal(subtask(settle_in(C), lookat(O), 7), t) :- goal(C, lookat(O), t), subtask(settle_in(C), lookat(O), 7).
goal(subtask(settle_in(C), grab(O), 8), t) :- goal(C, grab(O), t), subtask(settle_in(C), grab(O), 8).
goal(subtask(settle_in(C), touch(O), 9), t) :- goal(C, touch(O), t), subtask(settle_in(C), touch(O), 9).
