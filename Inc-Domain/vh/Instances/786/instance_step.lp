#program step(t).

goal(research(C), t) :- subtask(research(C)), subtask(research(C), find(O1_1), 1), goal(subtask(research(C), find(O1_1), 1), T0), T0 <= T1, time(T0), subtask(research(C), open(O2_1), 2), goal(subtask(research(C), open(O2_1), 2), T1), T1 <= T2, time(T1), subtask(research(C), close(O3_1), 3), goal(subtask(research(C), close(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(research(C), find(O), 1), t) :- goal(C, find(O), t), subtask(research(C), find(O), 1).
goal(subtask(research(C), open(O), 2), t) :- goal(C, open(O), t), subtask(research(C), open(O), 2).
goal(subtask(research(C), close(O), 3), t) :- goal(C, close(O), t), subtask(research(C), close(O), 3).
