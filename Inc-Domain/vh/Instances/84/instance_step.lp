#program step(t).

goal(organize(C), t) :- subtask(organize(C)), subtask(organize(C), walk(O1_1), 1), goal(subtask(organize(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(organize(C), lookat(O2_1), 2), goal(subtask(organize(C), lookat(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(organize(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(organize(C), walk(O), 1).
goal(subtask(organize(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(organize(C), lookat(O), 2).
