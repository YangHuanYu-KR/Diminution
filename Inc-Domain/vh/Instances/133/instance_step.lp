#program step(t).

goal(watch_movie(C), T0, t, 1) :- subtask(watch_movie(C)), subtask(watch_movie(C), walk(O1_1), 1), goal(subtask(watch_movie(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(watch_movie(C), find(O2_1), 2), goal(subtask(watch_movie(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(watch_movie(C), turnto(O3_1), 3), goal(subtask(watch_movie(C), turnto(O3_1), 3), T2), T2 <= t, time(T2).
goal(watch_movie(C), T3, t, 2) :- subtask(watch_movie(C), watch(O4_1), 4), goal(subtask(watch_movie(C), watch(O4_1), 4), T3), T3 <= t, time(T3).
goal(watch_movie(C), t) :- goal(watch_movie(C), T0, T2, 1), goal(watch_movie(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(watch_movie(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 1).
goal(subtask(watch_movie(C), find(O), 2), t) :- goal(C, find(O), t), subtask(watch_movie(C), find(O), 2).
goal(subtask(watch_movie(C), turnto(O), 3), t) :- goal(C, turnto(O), t), subtask(watch_movie(C), turnto(O), 3).
goal(subtask(watch_movie(C), watch(O), 4), t) :- goal(C, watch(O), t), subtask(watch_movie(C), watch(O), 4).
