#program step(t).

goal(pick_up(C), t) :- subtask(pick_up(C)), subtask(pick_up(C), grab(O1_1), 1), goal(subtask(pick_up(C), grab(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(pick_up(C), grab(O), 1), t) :- goal(C, grab(O), t), subtask(pick_up(C), grab(O), 1).
