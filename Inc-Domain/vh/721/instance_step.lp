#program step(t).

goal(clean_sink(C), T0, t, 1) :- subtask(clean_sink(C)), subtask(clean_sink(C), walk(O1_1), 1), goal(subtask(clean_sink(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(clean_sink(C), find(O2_1), 2), goal(subtask(clean_sink(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(clean_sink(C), open(O3_1), 3), goal(subtask(clean_sink(C), open(O3_1), 3), T2), T2 <= t, time(T2).
goal(clean_sink(C), T3, t, 2) :- subtask(clean_sink(C), close(O4_1), 4), goal(subtask(clean_sink(C), close(O4_1), 4), T3), T3 <= t, time(T3).
goal(clean_sink(C), t) :- goal(clean_sink(C), T0, T2, 1), goal(clean_sink(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(clean_sink(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(clean_sink(C), walk(O), 1).
goal(subtask(clean_sink(C), find(O), 2), t) :- goal(C, find(O), t), subtask(clean_sink(C), find(O), 2).
goal(subtask(clean_sink(C), open(O), 3), t) :- goal(C, open(O), t), subtask(clean_sink(C), open(O), 3).
goal(subtask(clean_sink(C), close(O), 4), t) :- goal(C, close(O), t), subtask(clean_sink(C), close(O), 4).
