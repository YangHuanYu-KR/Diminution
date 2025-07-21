#program step(t).

goal(take_off_outerwear(C), t) :- subtask(take_off_outerwear(C)), subtask(take_off_outerwear(C), grab(O1_1), 1), goal(subtask(take_off_outerwear(C), grab(O1_1), 1), T0), T0 <= T1, time(T0), subtask(take_off_outerwear(C), drop(O2_1), 2), goal(subtask(take_off_outerwear(C), drop(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(take_off_outerwear(C), grab(O), 1), t) :- goal(C, grab(O), t), subtask(take_off_outerwear(C), grab(O), 1).
goal(subtask(take_off_outerwear(C), drop(O), 2), t) :- goal(C, drop(O), t), subtask(take_off_outerwear(C), drop(O), 2).
