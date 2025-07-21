#program step(t).

goal(tale_off_shoes(C), t) :- subtask(tale_off_shoes(C)), subtask(tale_off_shoes(C), sit(O1_1), 1), goal(subtask(tale_off_shoes(C), sit(O1_1), 1), T0), T0 <= T1, time(T0), subtask(tale_off_shoes(C), lie(O2_1), 2), goal(subtask(tale_off_shoes(C), lie(O2_1), 2), T1), T1 <= T2, time(T1), subtask(tale_off_shoes(C), drop(O3_1), 3), goal(subtask(tale_off_shoes(C), drop(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(tale_off_shoes(C), sit(O), 1), t) :- goal(C, sit(O), t), subtask(tale_off_shoes(C), sit(O), 1).
goal(subtask(tale_off_shoes(C), lie(O), 2), t) :- goal(C, lie(O), t), subtask(tale_off_shoes(C), lie(O), 2).
goal(subtask(tale_off_shoes(C), drop(O), 3), t) :- goal(C, drop(O), t), subtask(tale_off_shoes(C), drop(O), 3).
