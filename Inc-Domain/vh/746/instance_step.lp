#program step(t).

goal(take_shoes_off(C), t) :- subtask(take_shoes_off(C)), subtask(take_shoes_off(C), cut(O1_1), 1), goal(subtask(take_shoes_off(C), cut(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(take_shoes_off(C), cut(O), 1), t) :- goal(C, cut(O), t), subtask(take_shoes_off(C), cut(O), 1).
