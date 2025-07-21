#program step(t).

goal(compute(C), t) :- subtask(compute(C)), subtask(compute(C), sit(O1_1), 1), goal(subtask(compute(C), sit(O1_1), 1), T0), T0 <= T1, time(T0), subtask(compute(C), lookat(O2_1), 2), goal(subtask(compute(C), lookat(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(compute(C), sit(O), 1), t) :- goal(C, sit(O), t), subtask(compute(C), sit(O), 1).
goal(subtask(compute(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(compute(C), lookat(O), 2).
