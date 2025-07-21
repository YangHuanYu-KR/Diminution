#program step(t).

goal(clean_sink(C), T0, t, 1) :- subtask(clean_sink(C)), subtask(clean_sink(C), walk(O1_1), 1), goal(subtask(clean_sink(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(clean_sink(C), grab(O2_1), 2), goal(subtask(clean_sink(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(clean_sink(C), walk(O3_1), 3), goal(subtask(clean_sink(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(clean_sink(C), T3, t, 2) :- subtask(clean_sink(C), grab(O4_1), 4), goal(subtask(clean_sink(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(clean_sink(C), putin(O5_1, O5_2), 5), goal(subtask(clean_sink(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(clean_sink(C), wash(O6_1), 6), goal(subtask(clean_sink(C), wash(O6_1), 6), T5), T5 <= t, time(T5).
goal(clean_sink(C), T0, t, 3) :- goal(clean_sink(C), T0, T2, 1), goal(clean_sink(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(clean_sink(C), T6, t, 4) :- subtask(clean_sink(C), putback(O7_1, O7_2), 7), goal(subtask(clean_sink(C), putback(O7_1, O7_2), 7), T6), T6 <= T7, time(T6), subtask(clean_sink(C), putback(O8_1, O8_2), 8), goal(subtask(clean_sink(C), putback(O8_1, O8_2), 8), T7), T7 <= t, time(T7).
goal(clean_sink(C), t) :- goal(clean_sink(C), T0, T5, 3), goal(clean_sink(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(clean_sink(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(clean_sink(C), walk(O), 1).
goal(subtask(clean_sink(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(clean_sink(C), grab(O), 2).
goal(subtask(clean_sink(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(clean_sink(C), walk(O), 3).
goal(subtask(clean_sink(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(clean_sink(C), grab(O), 4).
goal(subtask(clean_sink(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(clean_sink(C), putin(O1, O2), 5).
goal(subtask(clean_sink(C), wash(O), 6), t) :- goal(C, wash(O), t), subtask(clean_sink(C), wash(O), 6).
goal(subtask(clean_sink(C), putback(O1, O2), 7), t) :- goal(C, putback(O1, O2), t), subtask(clean_sink(C), putback(O1, O2), 7).
goal(subtask(clean_sink(C), putback(O1, O2), 8), t) :- goal(C, putback(O1, O2), t), subtask(clean_sink(C), putback(O1, O2), 8).
