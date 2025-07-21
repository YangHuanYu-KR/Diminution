#program step(t).

goal(read_newspaper(C), t) :- subtask(read_newspaper(C)), subtask(read_newspaper(C), find(O1_1), 1), goal(subtask(read_newspaper(C), find(O1_1), 1), T0), T0 <= T1, time(T0), subtask(read_newspaper(C), read(O2_1), 2), goal(subtask(read_newspaper(C), read(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(read_newspaper(C), find(O), 1), t) :- goal(C, find(O), t), subtask(read_newspaper(C), find(O), 1).
goal(subtask(read_newspaper(C), read(O), 2), t) :- goal(C, read(O), t), subtask(read_newspaper(C), read(O), 2).
