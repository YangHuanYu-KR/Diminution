#program step(t).

goal(take_off_outerwear(C), T0, t, 1) :- subtask(take_off_outerwear(C)), subtask(take_off_outerwear(C), walk(O1_1), 1), goal(subtask(take_off_outerwear(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(take_off_outerwear(C), walk(O2_1), 2), goal(subtask(take_off_outerwear(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(take_off_outerwear(C), grab(O3_1), 3), goal(subtask(take_off_outerwear(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(take_off_outerwear(C), T3, t, 2) :- subtask(take_off_outerwear(C), drop(O4_1), 4), goal(subtask(take_off_outerwear(C), drop(O4_1), 4), T3), T3 <= t, time(T3).
goal(take_off_outerwear(C), t) :- goal(take_off_outerwear(C), T0, T2, 1), goal(take_off_outerwear(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(take_off_outerwear(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(take_off_outerwear(C), walk(O), 1).
goal(subtask(take_off_outerwear(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(take_off_outerwear(C), walk(O), 2).
goal(subtask(take_off_outerwear(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(take_off_outerwear(C), grab(O), 3).
goal(subtask(take_off_outerwear(C), drop(O), 4), t) :- goal(C, drop(O), t), subtask(take_off_outerwear(C), drop(O), 4).
