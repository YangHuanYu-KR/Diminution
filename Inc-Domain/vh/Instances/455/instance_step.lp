#program step(t).

goal(rain_welcome(C), t) :- subtask(rain_welcome(C)), subtask(rain_welcome(C), walk(O1_1), 1), goal(subtask(rain_welcome(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(rain_welcome(C), grab(O2_1), 2), goal(subtask(rain_welcome(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(rain_welcome(C), find(O3_1), 3), goal(subtask(rain_welcome(C), find(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(rain_welcome(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(rain_welcome(C), walk(O), 1).
goal(subtask(rain_welcome(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(rain_welcome(C), grab(O), 2).
goal(subtask(rain_welcome(C), find(O), 3), t) :- goal(C, find(O), t), subtask(rain_welcome(C), find(O), 3).
