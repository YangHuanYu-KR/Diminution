#program step(t).

goal(vacuum(C), t) :- subtask(vacuum(C)), subtask(vacuum(C), cut(O1_1), 1), goal(subtask(vacuum(C), cut(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(vacuum(C), cut(O), 1), t) :- goal(C, cut(O), t), subtask(vacuum(C), cut(O), 1).
