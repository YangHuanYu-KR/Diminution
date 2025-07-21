#program step(t).

goal(open_curtains(C), t) :- subtask(open_curtains(C)), subtask(open_curtains(C), walk(O1_1), 1), goal(subtask(open_curtains(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(open_curtains(C), find(O2_1), 2), goal(subtask(open_curtains(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(open_curtains(C), open(O3_1), 3), goal(subtask(open_curtains(C), open(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(open_curtains(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(open_curtains(C), walk(O), 1).
goal(subtask(open_curtains(C), find(O), 2), t) :- goal(C, find(O), t), subtask(open_curtains(C), find(O), 2).
goal(subtask(open_curtains(C), open(O), 3), t) :- goal(C, open(O), t), subtask(open_curtains(C), open(O), 3).
