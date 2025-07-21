#program step(t).

goal(open_door(C), t) :- subtask(open_door(C)), subtask(open_door(C), walk(O1_1), 1), goal(subtask(open_door(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(open_door(C), open(O2_1), 2), goal(subtask(open_door(C), open(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(open_door(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(open_door(C), walk(O), 1).
goal(subtask(open_door(C), open(O), 2), t) :- goal(C, open(O), t), subtask(open_door(C), open(O), 2).
