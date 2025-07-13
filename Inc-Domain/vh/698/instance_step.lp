#program step(t).

goal(cut_bread(C), t) :- subtask(cut_bread(C)), subtask(cut_bread(C), cut(O1_1), 1), goal(subtask(cut_bread(C), cut(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(cut_bread(C), cut(O), 1), t) :- goal(C, cut(O), t), subtask(cut_bread(C), cut(O), 1).
