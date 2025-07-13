#program step(t).

goal(read(C), T0, t, 1) :- subtask(read(C)), subtask(read(C), walk(O1_1), 1), goal(subtask(read(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(read(C), lookat(O2_1), 2), goal(subtask(read(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(read(C), grab(O3_1), 3), goal(subtask(read(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(read(C), T3, t, 2) :- subtask(read(C), sit(O4_1), 4), goal(subtask(read(C), sit(O4_1), 4), T3), T3 <= T4, time(T3), subtask(read(C), read(O5_1), 5), goal(subtask(read(C), read(O5_1), 5), T4), T4 <= t, time(T4).
goal(read(C), t) :- goal(read(C), T0, T2, 1), goal(read(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(read(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(read(C), walk(O), 1).
goal(subtask(read(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(read(C), lookat(O), 2).
goal(subtask(read(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(read(C), grab(O), 3).
goal(subtask(read(C), sit(O), 4), t) :- goal(C, sit(O), t), subtask(read(C), sit(O), 4).
goal(subtask(read(C), read(O), 5), t) :- goal(C, read(O), t), subtask(read(C), read(O), 5).
