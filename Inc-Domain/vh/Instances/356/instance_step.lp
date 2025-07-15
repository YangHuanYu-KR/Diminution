#program step(t).

goal(clean__mirror(C), T0, t, 1) :- subtask(clean__mirror(C)), subtask(clean__mirror(C), walk(O1_1), 1), goal(subtask(clean__mirror(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(clean__mirror(C), grab(O2_1), 2), goal(subtask(clean__mirror(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(clean__mirror(C), walk(O3_1), 3), goal(subtask(clean__mirror(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(clean__mirror(C), T3, t, 2) :- subtask(clean__mirror(C), grab(O4_1), 4), goal(subtask(clean__mirror(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(clean__mirror(C), walk(O5_1), 5), goal(subtask(clean__mirror(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(clean__mirror(C), open(O6_1), 6), goal(subtask(clean__mirror(C), open(O6_1), 6), T5), T5 <= t, time(T5).
goal(clean__mirror(C), T0, t, 3) :- goal(clean__mirror(C), T0, T2, 1), goal(clean__mirror(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(clean__mirror(C), T6, t, 4) :- subtask(clean__mirror(C), touch(O7_1), 7), goal(subtask(clean__mirror(C), touch(O7_1), 7), T6), T6 <= T7, time(T6), subtask(clean__mirror(C), close(O8_1), 8), goal(subtask(clean__mirror(C), close(O8_1), 8), T7), T7 <= t, time(T7).
goal(clean__mirror(C), t) :- goal(clean__mirror(C), T0, T5, 3), goal(clean__mirror(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(clean__mirror(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(clean__mirror(C), walk(O), 1).
goal(subtask(clean__mirror(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(clean__mirror(C), grab(O), 2).
goal(subtask(clean__mirror(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(clean__mirror(C), walk(O), 3).
goal(subtask(clean__mirror(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(clean__mirror(C), grab(O), 4).
goal(subtask(clean__mirror(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(clean__mirror(C), walk(O), 5).
goal(subtask(clean__mirror(C), open(O), 6), t) :- goal(C, open(O), t), subtask(clean__mirror(C), open(O), 6).
goal(subtask(clean__mirror(C), touch(O), 7), t) :- goal(C, touch(O), t), subtask(clean__mirror(C), touch(O), 7).
goal(subtask(clean__mirror(C), close(O), 8), t) :- goal(C, close(O), t), subtask(clean__mirror(C), close(O), 8).
