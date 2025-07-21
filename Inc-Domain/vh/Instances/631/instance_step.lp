#program step(t).

goal(turn_on_radio(C), T0, t, 1) :- subtask(turn_on_radio(C)), subtask(turn_on_radio(C), walk(O1_1), 1), goal(subtask(turn_on_radio(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(turn_on_radio(C), walk(O2_1), 2), goal(subtask(turn_on_radio(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(turn_on_radio(C), find(O3_1), 3), goal(subtask(turn_on_radio(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(turn_on_radio(C), T3, t, 2) :- subtask(turn_on_radio(C), open(O4_1), 4), goal(subtask(turn_on_radio(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(turn_on_radio(C), putin(O5_1, O5_2), 5), goal(subtask(turn_on_radio(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(turn_on_radio(C), close(O6_1), 6), goal(subtask(turn_on_radio(C), close(O6_1), 6), T5), T5 <= t, time(T5).
goal(turn_on_radio(C), T0, t, 3) :- goal(turn_on_radio(C), T0, T2, 1), goal(turn_on_radio(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(turn_on_radio(C), T6, t, 4) :- subtask(turn_on_radio(C), find(O7_1), 7), goal(subtask(turn_on_radio(C), find(O7_1), 7), T6), T6 <= T7, time(T6), subtask(turn_on_radio(C), open(O8_1), 8), goal(subtask(turn_on_radio(C), open(O8_1), 8), T7), T7 <= T8, time(T7), subtask(turn_on_radio(C), putin(O9_1, O9_2), 9), goal(subtask(turn_on_radio(C), putin(O9_1, O9_2), 9), T8), T8 <= t, time(T8).
goal(turn_on_radio(C), T0, t, 5) :- goal(turn_on_radio(C), T0, T5, 3), goal(turn_on_radio(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(turn_on_radio(C), T9, t, 6) :- subtask(turn_on_radio(C), close(O10_1), 10), goal(subtask(turn_on_radio(C), close(O10_1), 10), T9), T9 <= t, time(T9).
goal(turn_on_radio(C), t) :- goal(turn_on_radio(C), T0, T8, 5), goal(turn_on_radio(C), T9, t, 6), time(T0), time(T8), time(T9), T8 <= T9.

goal(subtask(turn_on_radio(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(turn_on_radio(C), walk(O), 1).
goal(subtask(turn_on_radio(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(turn_on_radio(C), walk(O), 2).
goal(subtask(turn_on_radio(C), find(O), 3), t) :- goal(C, find(O), t), subtask(turn_on_radio(C), find(O), 3).
goal(subtask(turn_on_radio(C), open(O), 4), t) :- goal(C, open(O), t), subtask(turn_on_radio(C), open(O), 4).
goal(subtask(turn_on_radio(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(turn_on_radio(C), putin(O1, O2), 5).
goal(subtask(turn_on_radio(C), close(O), 6), t) :- goal(C, close(O), t), subtask(turn_on_radio(C), close(O), 6).
goal(subtask(turn_on_radio(C), find(O), 7), t) :- goal(C, find(O), t), subtask(turn_on_radio(C), find(O), 7).
goal(subtask(turn_on_radio(C), open(O), 8), t) :- goal(C, open(O), t), subtask(turn_on_radio(C), open(O), 8).
goal(subtask(turn_on_radio(C), putin(O1, O2), 9), t) :- goal(C, putin(O1, O2), t), subtask(turn_on_radio(C), putin(O1, O2), 9).
goal(subtask(turn_on_radio(C), close(O), 10), t) :- goal(C, close(O), t), subtask(turn_on_radio(C), close(O), 10).
