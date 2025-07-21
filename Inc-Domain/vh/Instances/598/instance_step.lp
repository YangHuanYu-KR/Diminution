#program step(t).

goal(open_curtains(C), T0, t, 1) :- subtask(open_curtains(C)), subtask(open_curtains(C), walk(O1_1), 1), goal(subtask(open_curtains(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(open_curtains(C), walk(O2_1), 2), goal(subtask(open_curtains(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(open_curtains(C), lookat(O3_1), 3), goal(subtask(open_curtains(C), lookat(O3_1), 3), T2), T2 <= t, time(T2).
goal(open_curtains(C), T3, t, 2) :- subtask(open_curtains(C), grab(O4_1), 4), goal(subtask(open_curtains(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(open_curtains(C), find(O5_1), 5), goal(subtask(open_curtains(C), find(O5_1), 5), T4), T4 <= T5, time(T4), subtask(open_curtains(C), open(O6_1), 6), goal(subtask(open_curtains(C), open(O6_1), 6), T5), T5 <= t, time(T5).
goal(open_curtains(C), T0, t, 3) :- goal(open_curtains(C), T0, T2, 1), goal(open_curtains(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(open_curtains(C), T6, t, 4) :- subtask(open_curtains(C), putin(O7_1, O7_2), 7), goal(subtask(open_curtains(C), putin(O7_1, O7_2), 7), T6), T6 <= T7, time(T6), subtask(open_curtains(C), close(O8_1), 8), goal(subtask(open_curtains(C), close(O8_1), 8), T7), T7 <= t, time(T7).
goal(open_curtains(C), t) :- goal(open_curtains(C), T0, T5, 3), goal(open_curtains(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(open_curtains(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(open_curtains(C), walk(O), 1).
goal(subtask(open_curtains(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(open_curtains(C), walk(O), 2).
goal(subtask(open_curtains(C), lookat(O), 3), t) :- goal(C, lookat(O), t), subtask(open_curtains(C), lookat(O), 3).
goal(subtask(open_curtains(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(open_curtains(C), grab(O), 4).
goal(subtask(open_curtains(C), find(O), 5), t) :- goal(C, find(O), t), subtask(open_curtains(C), find(O), 5).
goal(subtask(open_curtains(C), open(O), 6), t) :- goal(C, open(O), t), subtask(open_curtains(C), open(O), 6).
goal(subtask(open_curtains(C), putin(O1, O2), 7), t) :- goal(C, putin(O1, O2), t), subtask(open_curtains(C), putin(O1, O2), 7).
goal(subtask(open_curtains(C), close(O), 8), t) :- goal(C, close(O), t), subtask(open_curtains(C), close(O), 8).
