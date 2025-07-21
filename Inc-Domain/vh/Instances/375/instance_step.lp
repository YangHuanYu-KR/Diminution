#program step(t).

goal(wipe_down_sink(C), T0, t, 1) :- subtask(wipe_down_sink(C)), subtask(wipe_down_sink(C), walk(O1_1), 1), goal(subtask(wipe_down_sink(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(wipe_down_sink(C), grab(O2_1), 2), goal(subtask(wipe_down_sink(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(wipe_down_sink(C), turnto(O3_1), 3), goal(subtask(wipe_down_sink(C), turnto(O3_1), 3), T2), T2 <= t, time(T2).
goal(wipe_down_sink(C), T3, t, 2) :- subtask(wipe_down_sink(C), touch(O4_1), 4), goal(subtask(wipe_down_sink(C), touch(O4_1), 4), T3), T3 <= T4, time(T3), subtask(wipe_down_sink(C), drop(O5_1), 5), goal(subtask(wipe_down_sink(C), drop(O5_1), 5), T4), T4 <= t, time(T4).
goal(wipe_down_sink(C), t) :- goal(wipe_down_sink(C), T0, T2, 1), goal(wipe_down_sink(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(wipe_down_sink(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(wipe_down_sink(C), walk(O), 1).
goal(subtask(wipe_down_sink(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(wipe_down_sink(C), grab(O), 2).
goal(subtask(wipe_down_sink(C), turnto(O), 3), t) :- goal(C, turnto(O), t), subtask(wipe_down_sink(C), turnto(O), 3).
goal(subtask(wipe_down_sink(C), touch(O), 4), t) :- goal(C, touch(O), t), subtask(wipe_down_sink(C), touch(O), 4).
goal(subtask(wipe_down_sink(C), drop(O), 5), t) :- goal(C, drop(O), t), subtask(wipe_down_sink(C), drop(O), 5).
