#program step(t).

goal(rain_welcome(C), T0, t, 1) :- subtask(rain_welcome(C)), subtask(rain_welcome(C), lookat(O1_1), 1), goal(subtask(rain_welcome(C), lookat(O1_1), 1), T0), T0 <= T1, time(T0), subtask(rain_welcome(C), turnto(O2_1), 2), goal(subtask(rain_welcome(C), turnto(O2_1), 2), T1), T1 <= T2, time(T1), subtask(rain_welcome(C), open(O3_1), 3), goal(subtask(rain_welcome(C), open(O3_1), 3), T2), T2 <= t, time(T2).
goal(rain_welcome(C), T3, t, 2) :- subtask(rain_welcome(C), touch(O4_1), 4), goal(subtask(rain_welcome(C), touch(O4_1), 4), T3), T3 <= t, time(T3).
goal(rain_welcome(C), t) :- goal(rain_welcome(C), T0, T2, 1), goal(rain_welcome(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(rain_welcome(C), lookat(O), 1), t) :- goal(C, lookat(O), t), subtask(rain_welcome(C), lookat(O), 1).
goal(subtask(rain_welcome(C), turnto(O), 2), t) :- goal(C, turnto(O), t), subtask(rain_welcome(C), turnto(O), 2).
goal(subtask(rain_welcome(C), open(O), 3), t) :- goal(C, open(O), t), subtask(rain_welcome(C), open(O), 3).
goal(subtask(rain_welcome(C), touch(O), 4), t) :- goal(C, touch(O), t), subtask(rain_welcome(C), touch(O), 4).
