#program step(t).

goal(open_bathroom_window(C), T0, t, 1) :- subtask(open_bathroom_window(C)), subtask(open_bathroom_window(C), walk(O1_1), 1), goal(subtask(open_bathroom_window(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(open_bathroom_window(C), grab(O2_1), 2), goal(subtask(open_bathroom_window(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(open_bathroom_window(C), open(O3_1), 3), goal(subtask(open_bathroom_window(C), open(O3_1), 3), T2), T2 <= t, time(T2).
goal(open_bathroom_window(C), T3, t, 2) :- subtask(open_bathroom_window(C), close(O4_1), 4), goal(subtask(open_bathroom_window(C), close(O4_1), 4), T3), T3 <= T4, time(T3), subtask(open_bathroom_window(C), putin(O5_1, O5_2), 5), goal(subtask(open_bathroom_window(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(open_bathroom_window(C), putback(O6_1, O6_2), 6), goal(subtask(open_bathroom_window(C), putback(O6_1, O6_2), 6), T5), T5 <= t, time(T5).
goal(open_bathroom_window(C), T0, t, 3) :- goal(open_bathroom_window(C), T0, T2, 1), goal(open_bathroom_window(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(open_bathroom_window(C), T6, t, 4) :- subtask(open_bathroom_window(C), pour(O7_1, O7_2), 7), goal(subtask(open_bathroom_window(C), pour(O7_1, O7_2), 7), T6), T6 <= t, time(T6).
goal(open_bathroom_window(C), t) :- goal(open_bathroom_window(C), T0, T5, 3), goal(open_bathroom_window(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(open_bathroom_window(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(open_bathroom_window(C), walk(O), 1).
goal(subtask(open_bathroom_window(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(open_bathroom_window(C), grab(O), 2).
goal(subtask(open_bathroom_window(C), open(O), 3), t) :- goal(C, open(O), t), subtask(open_bathroom_window(C), open(O), 3).
goal(subtask(open_bathroom_window(C), close(O), 4), t) :- goal(C, close(O), t), subtask(open_bathroom_window(C), close(O), 4).
goal(subtask(open_bathroom_window(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(open_bathroom_window(C), putin(O1, O2), 5).
goal(subtask(open_bathroom_window(C), putback(O1, O2), 6), t) :- goal(C, putback(O1, O2), t), subtask(open_bathroom_window(C), putback(O1, O2), 6).
goal(subtask(open_bathroom_window(C), pour(O1, O2), 7), t) :- goal(C, pour(O1, O2), t), subtask(open_bathroom_window(C), pour(O1, O2), 7).
