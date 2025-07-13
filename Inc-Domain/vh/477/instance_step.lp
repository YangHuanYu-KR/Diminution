#program step(t).

goal(take_shoes_off(C), t) :- subtask(take_shoes_off(C)), subtask(take_shoes_off(C), walk(O1_1), 1), goal(subtask(take_shoes_off(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(take_shoes_off(C), grab(O2_1), 2), goal(subtask(take_shoes_off(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(take_shoes_off(C), putback(O3_1, O3_2), 3), goal(subtask(take_shoes_off(C), putback(O3_1, O3_2), 3), T2), T2 <= t, time(T2).

goal(subtask(take_shoes_off(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(take_shoes_off(C), walk(O), 1).
goal(subtask(take_shoes_off(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(take_shoes_off(C), grab(O), 2).
goal(subtask(take_shoes_off(C), putback(O1, O2), 3), t) :- goal(C, putback(O1, O2), t), subtask(take_shoes_off(C), putback(O1, O2), 3).
