#program step(t).

goal(research(C), T0, t, 1) :- subtask(research(C)), subtask(research(C), walk(O1_1), 1), goal(subtask(research(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(research(C), lookat(O2_1), 2), goal(subtask(research(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(research(C), grab(O3_1), 3), goal(subtask(research(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(research(C), T3, t, 2) :- subtask(research(C), sit(O4_1), 4), goal(subtask(research(C), sit(O4_1), 4), T3), T3 <= T4, time(T3), subtask(research(C), read(O5_1), 5), goal(subtask(research(C), read(O5_1), 5), T4), T4 <= T5, time(T4), subtask(research(C), lookat(O6_1), 6), goal(subtask(research(C), lookat(O6_1), 6), T5), T5 <= t, time(T5).
goal(research(C), T0, t, 3) :- goal(research(C), T0, T2, 1), goal(research(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(research(C), T6, t, 4) :- subtask(research(C), walk(O7_1), 7), goal(subtask(research(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(research(C), grab(O8_1), 8), goal(subtask(research(C), grab(O8_1), 8), T7), T7 <= T8, time(T7), subtask(research(C), grab(O9_1), 9), goal(subtask(research(C), grab(O9_1), 9), T8), T8 <= t, time(T8).
goal(research(C), T0, t, 5) :- goal(research(C), T0, T5, 3), goal(research(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(research(C), T9, t, 6) :- subtask(research(C), plugin(O10_1), 10), goal(subtask(research(C), plugin(O10_1), 10), T9), T9 <= T10, time(T9), subtask(research(C), plugin(O11_1), 11), goal(subtask(research(C), plugin(O11_1), 11), T10), T10 <= T11, time(T10), subtask(research(C), switchon(O12_1), 12), goal(subtask(research(C), switchon(O12_1), 12), T11), T11 <= t, time(T11).
goal(research(C), T0, t, 7) :- goal(research(C), T0, T8, 5), goal(research(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(research(C), T12, t, 8) :- subtask(research(C), lookat(O13_1), 13), goal(subtask(research(C), lookat(O13_1), 13), T12), T12 <= T13, time(T12), subtask(research(C), read(O14_1), 14), goal(subtask(research(C), read(O14_1), 14), T13), T13 <= t, time(T13).
goal(research(C), t) :- goal(research(C), T0, T11, 7), goal(research(C), T12, t, 8), time(T0), time(T11), time(T12), T11 <= T12.

goal(subtask(research(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(research(C), walk(O), 1).
goal(subtask(research(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(research(C), lookat(O), 2).
goal(subtask(research(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(research(C), grab(O), 3).
goal(subtask(research(C), sit(O), 4), t) :- goal(C, sit(O), t), subtask(research(C), sit(O), 4).
goal(subtask(research(C), read(O), 5), t) :- goal(C, read(O), t), subtask(research(C), read(O), 5).
goal(subtask(research(C), lookat(O), 6), t) :- goal(C, lookat(O), t), subtask(research(C), lookat(O), 6).
goal(subtask(research(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(research(C), walk(O), 7).
goal(subtask(research(C), grab(O), 8), t) :- goal(C, grab(O), t), subtask(research(C), grab(O), 8).
goal(subtask(research(C), grab(O), 9), t) :- goal(C, grab(O), t), subtask(research(C), grab(O), 9).
goal(subtask(research(C), plugin(O), 10), t) :- goal(C, plugin(O), t), subtask(research(C), plugin(O), 10).
goal(subtask(research(C), plugin(O), 11), t) :- goal(C, plugin(O), t), subtask(research(C), plugin(O), 11).
goal(subtask(research(C), switchon(O), 12), t) :- goal(C, switchon(O), t), subtask(research(C), switchon(O), 12).
goal(subtask(research(C), lookat(O), 13), t) :- goal(C, lookat(O), t), subtask(research(C), lookat(O), 13).
goal(subtask(research(C), read(O), 14), t) :- goal(C, read(O), t), subtask(research(C), read(O), 14).
