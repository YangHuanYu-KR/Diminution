#program step(t).

goal(getting__dresses(C), T0, t, 1) :- subtask(getting__dresses(C)), subtask(getting__dresses(C), walk(O1_1), 1), goal(subtask(getting__dresses(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(getting__dresses(C), open(O2_1), 2), goal(subtask(getting__dresses(C), open(O2_1), 2), T1), T1 <= T2, time(T1), subtask(getting__dresses(C), grab(O3_1), 3), goal(subtask(getting__dresses(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(getting__dresses(C), T3, t, 2) :- subtask(getting__dresses(C), grab(O4_1), 4), goal(subtask(getting__dresses(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(getting__dresses(C), grab(O5_1), 5), goal(subtask(getting__dresses(C), grab(O5_1), 5), T4), T4 <= T5, time(T4), subtask(getting__dresses(C), grab(O6_1), 6), goal(subtask(getting__dresses(C), grab(O6_1), 6), T5), T5 <= t, time(T5).
goal(getting__dresses(C), T0, t, 3) :- goal(getting__dresses(C), T0, T2, 1), goal(getting__dresses(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(getting__dresses(C), T6, t, 4) :- subtask(getting__dresses(C), close(O7_1), 7), goal(subtask(getting__dresses(C), close(O7_1), 7), T6), T6 <= t, time(T6).
goal(getting__dresses(C), t) :- goal(getting__dresses(C), T0, T5, 3), goal(getting__dresses(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(getting__dresses(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(getting__dresses(C), walk(O), 1).
goal(subtask(getting__dresses(C), open(O), 2), t) :- goal(C, open(O), t), subtask(getting__dresses(C), open(O), 2).
goal(subtask(getting__dresses(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(getting__dresses(C), grab(O), 3).
goal(subtask(getting__dresses(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(getting__dresses(C), grab(O), 4).
goal(subtask(getting__dresses(C), grab(O), 5), t) :- goal(C, grab(O), t), subtask(getting__dresses(C), grab(O), 5).
goal(subtask(getting__dresses(C), grab(O), 6), t) :- goal(C, grab(O), t), subtask(getting__dresses(C), grab(O), 6).
goal(subtask(getting__dresses(C), close(O), 7), t) :- goal(C, close(O), t), subtask(getting__dresses(C), close(O), 7).
