#program step(t).

goal(tale_off_shoes(C), t) :- subtask(tale_off_shoes(C)), subtask(tale_off_shoes(C), walk(O1_1), 1), goal(subtask(tale_off_shoes(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(tale_off_shoes(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(tale_off_shoes(C), walk(O), 1).
