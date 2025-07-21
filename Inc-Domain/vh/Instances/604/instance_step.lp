#program step(t).

goal(sweep_hallway_please(C), T0, t, 1) :- subtask(sweep_hallway_please(C)), subtask(sweep_hallway_please(C), walk(O1_1), 1), goal(subtask(sweep_hallway_please(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(sweep_hallway_please(C), grab(O2_1), 2), goal(subtask(sweep_hallway_please(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(sweep_hallway_please(C), find(O3_1), 3), goal(subtask(sweep_hallway_please(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(sweep_hallway_please(C), T3, t, 2) :- subtask(sweep_hallway_please(C), open(O4_1), 4), goal(subtask(sweep_hallway_please(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(sweep_hallway_please(C), putin(O5_1, O5_2), 5), goal(subtask(sweep_hallway_please(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(sweep_hallway_please(C), close(O6_1), 6), goal(subtask(sweep_hallway_please(C), close(O6_1), 6), T5), T5 <= t, time(T5).
goal(sweep_hallway_please(C), T0, t, 3) :- goal(sweep_hallway_please(C), T0, T2, 1), goal(sweep_hallway_please(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(sweep_hallway_please(C), T6, t, 4) :- subtask(sweep_hallway_please(C), walk(O7_1), 7), goal(subtask(sweep_hallway_please(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(sweep_hallway_please(C), walk(O8_1), 8), goal(subtask(sweep_hallway_please(C), walk(O8_1), 8), T7), T7 <= T8, time(T7), subtask(sweep_hallway_please(C), switchon(O9_1), 9), goal(subtask(sweep_hallway_please(C), switchon(O9_1), 9), T8), T8 <= t, time(T8).
goal(sweep_hallway_please(C), T0, t, 5) :- goal(sweep_hallway_please(C), T0, T5, 3), goal(sweep_hallway_please(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(sweep_hallway_please(C), T9, t, 6) :- subtask(sweep_hallway_please(C), walk(O10_1), 10), goal(subtask(sweep_hallway_please(C), walk(O10_1), 10), T9), T9 <= T10, time(T9), subtask(sweep_hallway_please(C), grab(O11_1), 11), goal(subtask(sweep_hallway_please(C), grab(O11_1), 11), T10), T10 <= T11, time(T10), subtask(sweep_hallway_please(C), walk(O12_1), 12), goal(subtask(sweep_hallway_please(C), walk(O12_1), 12), T11), T11 <= t, time(T11).
goal(sweep_hallway_please(C), T0, t, 7) :- goal(sweep_hallway_please(C), T0, T8, 5), goal(sweep_hallway_please(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(sweep_hallway_please(C), T12, t, 8) :- subtask(sweep_hallway_please(C), grab(O13_1), 13), goal(subtask(sweep_hallway_please(C), grab(O13_1), 13), T12), T12 <= t, time(T12).
goal(sweep_hallway_please(C), t) :- goal(sweep_hallway_please(C), T0, T11, 7), goal(sweep_hallway_please(C), T12, t, 8), time(T0), time(T11), time(T12), T11 <= T12.

goal(subtask(sweep_hallway_please(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(sweep_hallway_please(C), walk(O), 1).
goal(subtask(sweep_hallway_please(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(sweep_hallway_please(C), grab(O), 2).
goal(subtask(sweep_hallway_please(C), find(O), 3), t) :- goal(C, find(O), t), subtask(sweep_hallway_please(C), find(O), 3).
goal(subtask(sweep_hallway_please(C), open(O), 4), t) :- goal(C, open(O), t), subtask(sweep_hallway_please(C), open(O), 4).
goal(subtask(sweep_hallway_please(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(sweep_hallway_please(C), putin(O1, O2), 5).
goal(subtask(sweep_hallway_please(C), close(O), 6), t) :- goal(C, close(O), t), subtask(sweep_hallway_please(C), close(O), 6).
goal(subtask(sweep_hallway_please(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(sweep_hallway_please(C), walk(O), 7).
goal(subtask(sweep_hallway_please(C), walk(O), 8), t) :- goal(C, walk(O), t), subtask(sweep_hallway_please(C), walk(O), 8).
goal(subtask(sweep_hallway_please(C), switchon(O), 9), t) :- goal(C, switchon(O), t), subtask(sweep_hallway_please(C), switchon(O), 9).
goal(subtask(sweep_hallway_please(C), walk(O), 10), t) :- goal(C, walk(O), t), subtask(sweep_hallway_please(C), walk(O), 10).
goal(subtask(sweep_hallway_please(C), grab(O), 11), t) :- goal(C, grab(O), t), subtask(sweep_hallway_please(C), grab(O), 11).
goal(subtask(sweep_hallway_please(C), walk(O), 12), t) :- goal(C, walk(O), t), subtask(sweep_hallway_please(C), walk(O), 12).
goal(subtask(sweep_hallway_please(C), grab(O), 13), t) :- goal(C, grab(O), t), subtask(sweep_hallway_please(C), grab(O), 13).
