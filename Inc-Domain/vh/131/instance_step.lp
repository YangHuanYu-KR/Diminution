#program step(t).

goal(decorate_it(C), T0, t, 1) :- subtask(decorate_it(C)), subtask(decorate_it(C), grab(O1_1), 1), goal(subtask(decorate_it(C), grab(O1_1), 1), T0), T0 <= T1, time(T0), subtask(decorate_it(C), grab(O2_1), 2), goal(subtask(decorate_it(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(decorate_it(C), grab(O3_1), 3), goal(subtask(decorate_it(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(decorate_it(C), T3, t, 2) :- subtask(decorate_it(C), find(O4_1), 4), goal(subtask(decorate_it(C), find(O4_1), 4), T3), T3 <= T4, time(T3), subtask(decorate_it(C), cut(O5_1), 5), goal(subtask(decorate_it(C), cut(O5_1), 5), T4), T4 <= T5, time(T4), subtask(decorate_it(C), cut(O6_1), 6), goal(subtask(decorate_it(C), cut(O6_1), 6), T5), T5 <= t, time(T5).
goal(decorate_it(C), T0, t, 3) :- goal(decorate_it(C), T0, T2, 1), goal(decorate_it(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(decorate_it(C), T6, t, 4) :- subtask(decorate_it(C), cut(O7_1), 7), goal(subtask(decorate_it(C), cut(O7_1), 7), T6), T6 <= t, time(T6).
goal(decorate_it(C), t) :- goal(decorate_it(C), T0, T5, 3), goal(decorate_it(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(decorate_it(C), grab(O), 1), t) :- goal(C, grab(O), t), subtask(decorate_it(C), grab(O), 1).
goal(subtask(decorate_it(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(decorate_it(C), grab(O), 2).
goal(subtask(decorate_it(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(decorate_it(C), grab(O), 3).
goal(subtask(decorate_it(C), find(O), 4), t) :- goal(C, find(O), t), subtask(decorate_it(C), find(O), 4).
goal(subtask(decorate_it(C), cut(O), 5), t) :- goal(C, cut(O), t), subtask(decorate_it(C), cut(O), 5).
goal(subtask(decorate_it(C), cut(O), 6), t) :- goal(C, cut(O), t), subtask(decorate_it(C), cut(O), 6).
goal(subtask(decorate_it(C), cut(O), 7), t) :- goal(C, cut(O), t), subtask(decorate_it(C), cut(O), 7).
