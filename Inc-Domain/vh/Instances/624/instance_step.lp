#program step(t).

goal(pull_up_carpet(C), t) :- subtask(pull_up_carpet(C)), subtask(pull_up_carpet(C), walk(O1_1), 1), goal(subtask(pull_up_carpet(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(pull_up_carpet(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(pull_up_carpet(C), walk(O), 1).
