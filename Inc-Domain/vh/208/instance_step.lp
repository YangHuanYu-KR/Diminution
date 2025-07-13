#program step(t).

goal(take_shoes_off(C), t) :- subtask(take_shoes_off(C)), subtask(take_shoes_off(C), sit(O1_1), 1), goal(subtask(take_shoes_off(C), sit(O1_1), 1), T0), T0 <= T1, time(T0), subtask(take_shoes_off(C), grab(O2_1), 2), goal(subtask(take_shoes_off(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(take_shoes_off(C), drop(O3_1), 3), goal(subtask(take_shoes_off(C), drop(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(take_shoes_off(C), sit(O), 1), t) :- goal(C, sit(O), t), subtask(take_shoes_off(C), sit(O), 1).
goal(subtask(take_shoes_off(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(take_shoes_off(C), grab(O), 2).
goal(subtask(take_shoes_off(C), drop(O), 3), t) :- goal(C, drop(O), t), subtask(take_shoes_off(C), drop(O), 3).
