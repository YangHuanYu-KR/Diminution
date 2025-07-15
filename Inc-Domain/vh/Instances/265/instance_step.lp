#program step(t).

goal(take_jacket_off(C), t) :- subtask(take_jacket_off(C)), subtask(take_jacket_off(C), walk(O1_1), 1), goal(subtask(take_jacket_off(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(take_jacket_off(C), grab(O2_1), 2), goal(subtask(take_jacket_off(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(take_jacket_off(C), drop(O3_1), 3), goal(subtask(take_jacket_off(C), drop(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(take_jacket_off(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(take_jacket_off(C), walk(O), 1).
goal(subtask(take_jacket_off(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(take_jacket_off(C), grab(O), 2).
goal(subtask(take_jacket_off(C), drop(O), 3), t) :- goal(C, drop(O), t), subtask(take_jacket_off(C), drop(O), 3).
