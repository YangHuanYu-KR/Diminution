#program step(t).

goal(study(C), t) :- subtask(study(C)), subtask(study(C), walk(O1_1), 1), goal(subtask(study(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(study(C), sit(O2_1), 2), goal(subtask(study(C), sit(O2_1), 2), T1), T1 <= T2, time(T1), subtask(study(C), read(O3_1), 3), goal(subtask(study(C), read(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(study(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(study(C), walk(O), 1).
goal(subtask(study(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(study(C), sit(O), 2).
goal(subtask(study(C), read(O), 3), t) :- goal(C, read(O), t), subtask(study(C), read(O), 3).
