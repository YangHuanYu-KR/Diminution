#program step(t).

goal(work(C), T0, t, 1) :- subtask(work(C)), subtask(work(C), walk(O1_1), 1), goal(subtask(work(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(work(C), walk(O2_1), 2), goal(subtask(work(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(work(C), walk(O3_1), 3), goal(subtask(work(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(work(C), T3, t, 2) :- subtask(work(C), walk(O4_1), 4), goal(subtask(work(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(work(C), walk(O5_1), 5), goal(subtask(work(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(work(C), find(O6_1), 6), goal(subtask(work(C), find(O6_1), 6), T5), T5 <= t, time(T5).
goal(work(C), T0, t, 3) :- goal(work(C), T0, T2, 1), goal(work(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(work(C), T6, t, 4) :- subtask(work(C), open(O7_1), 7), goal(subtask(work(C), open(O7_1), 7), T6), T6 <= T7, time(T6), subtask(work(C), find(O8_1), 8), goal(subtask(work(C), find(O8_1), 8), T7), T7 <= T8, time(T7), subtask(work(C), open(O9_1), 9), goal(subtask(work(C), open(O9_1), 9), T8), T8 <= t, time(T8).
goal(work(C), T0, t, 5) :- goal(work(C), T0, T5, 3), goal(work(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(work(C), T9, t, 6) :- subtask(work(C), close(O10_1), 10), goal(subtask(work(C), close(O10_1), 10), T9), T9 <= t, time(T9).
goal(work(C), t) :- goal(work(C), T0, T8, 5), goal(work(C), T9, t, 6), time(T0), time(T8), time(T9), T8 <= T9.

goal(subtask(work(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(work(C), walk(O), 1).
goal(subtask(work(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(work(C), walk(O), 2).
goal(subtask(work(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(work(C), walk(O), 3).
goal(subtask(work(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(work(C), walk(O), 4).
goal(subtask(work(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(work(C), walk(O), 5).
goal(subtask(work(C), find(O), 6), t) :- goal(C, find(O), t), subtask(work(C), find(O), 6).
goal(subtask(work(C), open(O), 7), t) :- goal(C, open(O), t), subtask(work(C), open(O), 7).
goal(subtask(work(C), find(O), 8), t) :- goal(C, find(O), t), subtask(work(C), find(O), 8).
goal(subtask(work(C), open(O), 9), t) :- goal(C, open(O), t), subtask(work(C), open(O), 9).
goal(subtask(work(C), close(O), 10), t) :- goal(C, close(O), t), subtask(work(C), close(O), 10).
