#program step(t).

goal(pick_up_toys(C), t) :- subtask(pick_up_toys(C)), subtask(pick_up_toys(C), walk(O1_1), 1), goal(subtask(pick_up_toys(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(pick_up_toys(C), grab(O2_1), 2), goal(subtask(pick_up_toys(C), grab(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(pick_up_toys(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(pick_up_toys(C), walk(O), 1).
goal(subtask(pick_up_toys(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(pick_up_toys(C), grab(O), 2).
