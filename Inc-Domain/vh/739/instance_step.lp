#program step(t).

goal(walk_through(C), t) :- subtask(walk_through(C)), subtask(walk_through(C), cut(O1_1), 1), goal(subtask(walk_through(C), cut(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(walk_through(C), cut(O), 1), t) :- goal(C, cut(O), t), subtask(walk_through(C), cut(O), 1).
