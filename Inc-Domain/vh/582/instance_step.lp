#program step(t).

goal(make_coffee(C), t) :- subtask(make_coffee(C)), subtask(make_coffee(C), walk(O1_1), 1), goal(subtask(make_coffee(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(make_coffee(C), cut(O2_1), 2), goal(subtask(make_coffee(C), cut(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(make_coffee(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(make_coffee(C), walk(O), 1).
goal(subtask(make_coffee(C), cut(O), 2), t) :- goal(C, cut(O), t), subtask(make_coffee(C), cut(O), 2).
