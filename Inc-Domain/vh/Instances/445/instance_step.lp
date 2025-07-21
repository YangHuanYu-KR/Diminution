#program step(t).

goal(take_jacket_off(C), t) :- subtask(take_jacket_off(C)), subtask(take_jacket_off(C), grab(O1_1), 1), goal(subtask(take_jacket_off(C), grab(O1_1), 1), T0), T0 <= T1, time(T0), subtask(take_jacket_off(C), putback(O2_1, O2_2), 2), goal(subtask(take_jacket_off(C), putback(O2_1, O2_2), 2), T1), T1 <= t, time(T1).

goal(subtask(take_jacket_off(C), grab(O), 1), t) :- goal(C, grab(O), t), subtask(take_jacket_off(C), grab(O), 1).
goal(subtask(take_jacket_off(C), putback(O1, O2), 2), t) :- goal(C, putback(O1, O2), t), subtask(take_jacket_off(C), putback(O1, O2), 2).
