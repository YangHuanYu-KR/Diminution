#program step(t).

goal(clean(C), t) :- subtask(clean(C)), subtask(clean(C), walk(O1_1), 1), goal(subtask(clean(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(clean(C), find(O2_1), 2), goal(subtask(clean(C), find(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(clean(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(clean(C), walk(O), 1).
goal(subtask(clean(C), find(O), 2), t) :- goal(C, find(O), t), subtask(clean(C), find(O), 2).
