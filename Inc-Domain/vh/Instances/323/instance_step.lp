#program step(t).

goal(sit(C), t) :- subtask(sit(C)), subtask(sit(C), walk(O1_1), 1), goal(subtask(sit(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(sit(C), sit(O2_1), 2), goal(subtask(sit(C), sit(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(sit(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(sit(C), walk(O), 1).
goal(subtask(sit(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(sit(C), sit(O), 2).
