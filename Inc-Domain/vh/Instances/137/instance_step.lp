#program step(t).

goal(watch_youtube(C), T0, t, 1) :- subtask(watch_youtube(C)), subtask(watch_youtube(C), walk(O1_1), 1), goal(subtask(watch_youtube(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(watch_youtube(C), walk(O2_1), 2), goal(subtask(watch_youtube(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(watch_youtube(C), switchon(O3_1), 3), goal(subtask(watch_youtube(C), switchon(O3_1), 3), T2), T2 <= t, time(T2).
goal(watch_youtube(C), T3, t, 2) :- subtask(watch_youtube(C), watch(O4_1), 4), goal(subtask(watch_youtube(C), watch(O4_1), 4), T3), T3 <= t, time(T3).
goal(watch_youtube(C), t) :- goal(watch_youtube(C), T0, T2, 1), goal(watch_youtube(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(watch_youtube(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(watch_youtube(C), walk(O), 1).
goal(subtask(watch_youtube(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(watch_youtube(C), walk(O), 2).
goal(subtask(watch_youtube(C), switchon(O), 3), t) :- goal(C, switchon(O), t), subtask(watch_youtube(C), switchon(O), 3).
goal(subtask(watch_youtube(C), watch(O), 4), t) :- goal(C, watch(O), t), subtask(watch_youtube(C), watch(O), 4).
