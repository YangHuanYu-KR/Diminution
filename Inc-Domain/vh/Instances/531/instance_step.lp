#program step(t).

goal(open_door(C), T0, t, 1) :- subtask(open_door(C)), subtask(open_door(C), walk(O1_1), 1), goal(subtask(open_door(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(open_door(C), grab(O2_1), 2), goal(subtask(open_door(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(open_door(C), find(O3_1), 3), goal(subtask(open_door(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(open_door(C), T3, t, 2) :- subtask(open_door(C), open(O4_1), 4), goal(subtask(open_door(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(open_door(C), putin(O5_1, O5_2), 5), goal(subtask(open_door(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(open_door(C), close(O6_1), 6), goal(subtask(open_door(C), close(O6_1), 6), T5), T5 <= t, time(T5).
goal(open_door(C), T0, t, 3) :- goal(open_door(C), T0, T2, 1), goal(open_door(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(open_door(C), T6, t, 4) :- subtask(open_door(C), walk(O7_1), 7), goal(subtask(open_door(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(open_door(C), walk(O8_1), 8), goal(subtask(open_door(C), walk(O8_1), 8), T7), T7 <= T8, time(T7), subtask(open_door(C), switchon(O9_1), 9), goal(subtask(open_door(C), switchon(O9_1), 9), T8), T8 <= t, time(T8).
goal(open_door(C), T0, t, 5) :- goal(open_door(C), T0, T5, 3), goal(open_door(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(open_door(C), T9, t, 6) :- subtask(open_door(C), walk(O10_1), 10), goal(subtask(open_door(C), walk(O10_1), 10), T9), T9 <= t, time(T9).
goal(open_door(C), t) :- goal(open_door(C), T0, T8, 5), goal(open_door(C), T9, t, 6), time(T0), time(T8), time(T9), T8 <= T9.

goal(subtask(open_door(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(open_door(C), walk(O), 1).
goal(subtask(open_door(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(open_door(C), grab(O), 2).
goal(subtask(open_door(C), find(O), 3), t) :- goal(C, find(O), t), subtask(open_door(C), find(O), 3).
goal(subtask(open_door(C), open(O), 4), t) :- goal(C, open(O), t), subtask(open_door(C), open(O), 4).
goal(subtask(open_door(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(open_door(C), putin(O1, O2), 5).
goal(subtask(open_door(C), close(O), 6), t) :- goal(C, close(O), t), subtask(open_door(C), close(O), 6).
goal(subtask(open_door(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(open_door(C), walk(O), 7).
goal(subtask(open_door(C), walk(O), 8), t) :- goal(C, walk(O), t), subtask(open_door(C), walk(O), 8).
goal(subtask(open_door(C), switchon(O), 9), t) :- goal(C, switchon(O), t), subtask(open_door(C), switchon(O), 9).
goal(subtask(open_door(C), walk(O), 10), t) :- goal(C, walk(O), t), subtask(open_door(C), walk(O), 10).
