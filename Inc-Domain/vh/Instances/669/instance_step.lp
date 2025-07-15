#program step(t).

goal(decorate_it(C), T0, t, 1) :- subtask(decorate_it(C)), subtask(decorate_it(C), close(O1_1), 1), goal(subtask(decorate_it(C), close(O1_1), 1), T0), T0 <= T1, time(T0), subtask(decorate_it(C), walk(O2_1), 2), goal(subtask(decorate_it(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(decorate_it(C), walk(O3_1), 3), goal(subtask(decorate_it(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(decorate_it(C), T3, t, 2) :- subtask(decorate_it(C), cut(O4_1), 4), goal(subtask(decorate_it(C), cut(O4_1), 4), T3), T3 <= t, time(T3).
goal(decorate_it(C), t) :- goal(decorate_it(C), T0, T2, 1), goal(decorate_it(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(decorate_it(C), close(O), 1), t) :- goal(C, close(O), t), subtask(decorate_it(C), close(O), 1).
goal(subtask(decorate_it(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(decorate_it(C), walk(O), 2).
goal(subtask(decorate_it(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(decorate_it(C), walk(O), 3).
goal(subtask(decorate_it(C), cut(O), 4), t) :- goal(C, cut(O), t), subtask(decorate_it(C), cut(O), 4).
