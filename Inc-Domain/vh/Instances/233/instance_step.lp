#program step(t).

goal(movie(C), T0, t, 1) :- subtask(movie(C)), subtask(movie(C), walk(O1_1), 1), goal(subtask(movie(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(movie(C), turnto(O2_1), 2), goal(subtask(movie(C), turnto(O2_1), 2), T1), T1 <= T2, time(T1), subtask(movie(C), switchon(O3_1), 3), goal(subtask(movie(C), switchon(O3_1), 3), T2), T2 <= t, time(T2).
goal(movie(C), T3, t, 2) :- subtask(movie(C), watch(O4_1), 4), goal(subtask(movie(C), watch(O4_1), 4), T3), T3 <= t, time(T3).
goal(movie(C), t) :- goal(movie(C), T0, T2, 1), goal(movie(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(movie(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(movie(C), walk(O), 1).
goal(subtask(movie(C), turnto(O), 2), t) :- goal(C, turnto(O), t), subtask(movie(C), turnto(O), 2).
goal(subtask(movie(C), switchon(O), 3), t) :- goal(C, switchon(O), t), subtask(movie(C), switchon(O), 3).
goal(subtask(movie(C), watch(O), 4), t) :- goal(C, watch(O), t), subtask(movie(C), watch(O), 4).
