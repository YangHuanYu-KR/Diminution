#program step(t).

goal(turking(C), t) :- subtask(turking(C)), subtask(turking(C), walk(O1_1), 1), goal(subtask(turking(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(turking(C), grab(O2_1), 2), goal(subtask(turking(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(turking(C), switchon(O3_1), 3), goal(subtask(turking(C), switchon(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(turking(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(turking(C), walk(O), 1).
goal(subtask(turking(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(turking(C), grab(O), 2).
goal(subtask(turking(C), switchon(O), 3), t) :- goal(C, switchon(O), t), subtask(turking(C), switchon(O), 3).
