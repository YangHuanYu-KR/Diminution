#program step(t).

goal(rain_welcome(C), T0, t, 1) :- subtask(rain_welcome(C)), subtask(rain_welcome(C), walk(O1_1), 1), goal(subtask(rain_welcome(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(rain_welcome(C), open(O2_1), 2), goal(subtask(rain_welcome(C), open(O2_1), 2), T1), T1 <= T2, time(T1), subtask(rain_welcome(C), walk(O3_1), 3), goal(subtask(rain_welcome(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(rain_welcome(C), T3, t, 2) :- subtask(rain_welcome(C), lookat(O4_1), 4), goal(subtask(rain_welcome(C), lookat(O4_1), 4), T3), T3 <= T4, time(T3), subtask(rain_welcome(C), touch(O5_1), 5), goal(subtask(rain_welcome(C), touch(O5_1), 5), T4), T4 <= t, time(T4).
goal(rain_welcome(C), t) :- goal(rain_welcome(C), T0, T2, 1), goal(rain_welcome(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(rain_welcome(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(rain_welcome(C), walk(O), 1).
goal(subtask(rain_welcome(C), open(O), 2), t) :- goal(C, open(O), t), subtask(rain_welcome(C), open(O), 2).
goal(subtask(rain_welcome(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(rain_welcome(C), walk(O), 3).
goal(subtask(rain_welcome(C), lookat(O), 4), t) :- goal(C, lookat(O), t), subtask(rain_welcome(C), lookat(O), 4).
goal(subtask(rain_welcome(C), touch(O), 5), t) :- goal(C, touch(O), t), subtask(rain_welcome(C), touch(O), 5).
