#program step(t).

goal(dust(C), T0, t, 1) :- subtask(dust(C)), subtask(dust(C), walk(O1_1), 1), goal(subtask(dust(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(dust(C), grab(O2_1), 2), goal(subtask(dust(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(dust(C), find(O3_1), 3), goal(subtask(dust(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(dust(C), T3, t, 2) :- subtask(dust(C), open(O4_1), 4), goal(subtask(dust(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(dust(C), putin(O5_1, O5_2), 5), goal(subtask(dust(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(dust(C), close(O6_1), 6), goal(subtask(dust(C), close(O6_1), 6), T5), T5 <= t, time(T5).
goal(dust(C), T0, t, 3) :- goal(dust(C), T0, T2, 1), goal(dust(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(dust(C), T6, t, 4) :- subtask(dust(C), walk(O7_1), 7), goal(subtask(dust(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(dust(C), walk(O8_1), 8), goal(subtask(dust(C), walk(O8_1), 8), T7), T7 <= T8, time(T7), subtask(dust(C), switchon(O9_1), 9), goal(subtask(dust(C), switchon(O9_1), 9), T8), T8 <= t, time(T8).
goal(dust(C), T0, t, 5) :- goal(dust(C), T0, T5, 3), goal(dust(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(dust(C), T9, t, 6) :- subtask(dust(C), walk(O10_1), 10), goal(subtask(dust(C), walk(O10_1), 10), T9), T9 <= T10, time(T9), subtask(dust(C), grab(O11_1), 11), goal(subtask(dust(C), grab(O11_1), 11), T10), T10 <= T11, time(T10), subtask(dust(C), touch(O12_1), 12), goal(subtask(dust(C), touch(O12_1), 12), T11), T11 <= t, time(T11).
goal(dust(C), t) :- goal(dust(C), T0, T8, 5), goal(dust(C), T9, t, 6), time(T0), time(T8), time(T9), T8 <= T9.

goal(subtask(dust(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(dust(C), walk(O), 1).
goal(subtask(dust(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(dust(C), grab(O), 2).
goal(subtask(dust(C), find(O), 3), t) :- goal(C, find(O), t), subtask(dust(C), find(O), 3).
goal(subtask(dust(C), open(O), 4), t) :- goal(C, open(O), t), subtask(dust(C), open(O), 4).
goal(subtask(dust(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(dust(C), putin(O1, O2), 5).
goal(subtask(dust(C), close(O), 6), t) :- goal(C, close(O), t), subtask(dust(C), close(O), 6).
goal(subtask(dust(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(dust(C), walk(O), 7).
goal(subtask(dust(C), walk(O), 8), t) :- goal(C, walk(O), t), subtask(dust(C), walk(O), 8).
goal(subtask(dust(C), switchon(O), 9), t) :- goal(C, switchon(O), t), subtask(dust(C), switchon(O), 9).
goal(subtask(dust(C), walk(O), 10), t) :- goal(C, walk(O), t), subtask(dust(C), walk(O), 10).
goal(subtask(dust(C), grab(O), 11), t) :- goal(C, grab(O), t), subtask(dust(C), grab(O), 11).
goal(subtask(dust(C), touch(O), 12), t) :- goal(C, touch(O), t), subtask(dust(C), touch(O), 12).
