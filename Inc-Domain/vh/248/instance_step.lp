#program step(t).

goal(research(C), t) :- subtask(research(C)), subtask(research(C), walk(O1_1), 1), goal(subtask(research(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(research(C), lookat(O2_1), 2), goal(subtask(research(C), lookat(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(research(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(research(C), walk(O), 1).
goal(subtask(research(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(research(C), lookat(O), 2).
