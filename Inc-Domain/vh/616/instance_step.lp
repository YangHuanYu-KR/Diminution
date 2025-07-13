#program step(t).

goal(turn_on_tv(C), T0, t, 1) :- subtask(turn_on_tv(C)), subtask(turn_on_tv(C), walk(O1_1), 1), goal(subtask(turn_on_tv(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(turn_on_tv(C), walk(O2_1), 2), goal(subtask(turn_on_tv(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(turn_on_tv(C), switchon(O3_1), 3), goal(subtask(turn_on_tv(C), switchon(O3_1), 3), T2), T2 <= t, time(T2).
goal(turn_on_tv(C), T3, t, 2) :- subtask(turn_on_tv(C), walk(O4_1), 4), goal(subtask(turn_on_tv(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(turn_on_tv(C), switchoff(O5_1), 5), goal(subtask(turn_on_tv(C), switchoff(O5_1), 5), T4), T4 <= T5, time(T4), subtask(turn_on_tv(C), find(O6_1), 6), goal(subtask(turn_on_tv(C), find(O6_1), 6), T5), T5 <= t, time(T5).
goal(turn_on_tv(C), T0, t, 3) :- goal(turn_on_tv(C), T0, T2, 1), goal(turn_on_tv(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(turn_on_tv(C), T6, t, 4) :- subtask(turn_on_tv(C), open(O7_1), 7), goal(subtask(turn_on_tv(C), open(O7_1), 7), T6), T6 <= T7, time(T6), subtask(turn_on_tv(C), putin(O8_1, O8_2), 8), goal(subtask(turn_on_tv(C), putin(O8_1, O8_2), 8), T7), T7 <= T8, time(T7), subtask(turn_on_tv(C), close(O9_1), 9), goal(subtask(turn_on_tv(C), close(O9_1), 9), T8), T8 <= t, time(T8).
goal(turn_on_tv(C), t) :- goal(turn_on_tv(C), T0, T5, 3), goal(turn_on_tv(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(turn_on_tv(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(turn_on_tv(C), walk(O), 1).
goal(subtask(turn_on_tv(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(turn_on_tv(C), walk(O), 2).
goal(subtask(turn_on_tv(C), switchon(O), 3), t) :- goal(C, switchon(O), t), subtask(turn_on_tv(C), switchon(O), 3).
goal(subtask(turn_on_tv(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(turn_on_tv(C), walk(O), 4).
goal(subtask(turn_on_tv(C), switchoff(O), 5), t) :- goal(C, switchoff(O), t), subtask(turn_on_tv(C), switchoff(O), 5).
goal(subtask(turn_on_tv(C), find(O), 6), t) :- goal(C, find(O), t), subtask(turn_on_tv(C), find(O), 6).
goal(subtask(turn_on_tv(C), open(O), 7), t) :- goal(C, open(O), t), subtask(turn_on_tv(C), open(O), 7).
goal(subtask(turn_on_tv(C), putin(O1, O2), 8), t) :- goal(C, putin(O1, O2), t), subtask(turn_on_tv(C), putin(O1, O2), 8).
goal(subtask(turn_on_tv(C), close(O), 9), t) :- goal(C, close(O), t), subtask(turn_on_tv(C), close(O), 9).
