#program step(t).

goal(wipe_down_counter(C), T0, t, 1) :- subtask(wipe_down_counter(C)), subtask(wipe_down_counter(C), walk(O1_1), 1), goal(subtask(wipe_down_counter(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(wipe_down_counter(C), grab(O2_1), 2), goal(subtask(wipe_down_counter(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(wipe_down_counter(C), find(O3_1), 3), goal(subtask(wipe_down_counter(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(wipe_down_counter(C), T3, t, 2) :- subtask(wipe_down_counter(C), open(O4_1), 4), goal(subtask(wipe_down_counter(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(wipe_down_counter(C), close(O5_1), 5), goal(subtask(wipe_down_counter(C), close(O5_1), 5), T4), T4 <= t, time(T4).
goal(wipe_down_counter(C), t) :- goal(wipe_down_counter(C), T0, T2, 1), goal(wipe_down_counter(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(wipe_down_counter(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(wipe_down_counter(C), walk(O), 1).
goal(subtask(wipe_down_counter(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(wipe_down_counter(C), grab(O), 2).
goal(subtask(wipe_down_counter(C), find(O), 3), t) :- goal(C, find(O), t), subtask(wipe_down_counter(C), find(O), 3).
goal(subtask(wipe_down_counter(C), open(O), 4), t) :- goal(C, open(O), t), subtask(wipe_down_counter(C), open(O), 4).
goal(subtask(wipe_down_counter(C), close(O), 5), t) :- goal(C, close(O), t), subtask(wipe_down_counter(C), close(O), 5).
