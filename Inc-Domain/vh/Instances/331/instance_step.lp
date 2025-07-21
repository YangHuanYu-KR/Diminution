#program step(t).

goal(decorate_it(C), T0, t, 1) :- subtask(decorate_it(C)), subtask(decorate_it(C), walk(O1_1), 1), goal(subtask(decorate_it(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(decorate_it(C), grab(O2_1), 2), goal(subtask(decorate_it(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(decorate_it(C), lookat(O3_1), 3), goal(subtask(decorate_it(C), lookat(O3_1), 3), T2), T2 <= t, time(T2).
goal(decorate_it(C), T3, t, 2) :- subtask(decorate_it(C), walk(O4_1), 4), goal(subtask(decorate_it(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(decorate_it(C), putin(O5_1, O5_2), 5), goal(subtask(decorate_it(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(decorate_it(C), touch(O6_1), 6), goal(subtask(decorate_it(C), touch(O6_1), 6), T5), T5 <= t, time(T5).
goal(decorate_it(C), t) :- goal(decorate_it(C), T0, T2, 1), goal(decorate_it(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(decorate_it(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(decorate_it(C), walk(O), 1).
goal(subtask(decorate_it(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(decorate_it(C), grab(O), 2).
goal(subtask(decorate_it(C), lookat(O), 3), t) :- goal(C, lookat(O), t), subtask(decorate_it(C), lookat(O), 3).
goal(subtask(decorate_it(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(decorate_it(C), walk(O), 4).
goal(subtask(decorate_it(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(decorate_it(C), putin(O1, O2), 5).
goal(subtask(decorate_it(C), touch(O), 6), t) :- goal(C, touch(O), t), subtask(decorate_it(C), touch(O), 6).
