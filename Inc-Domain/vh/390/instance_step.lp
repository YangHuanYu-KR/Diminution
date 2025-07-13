#program step(t).

goal(read_newspaper(C), t) :- subtask(read_newspaper(C)), subtask(read_newspaper(C), walk(O1_1), 1), goal(subtask(read_newspaper(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(read_newspaper(C), grab(O2_1), 2), goal(subtask(read_newspaper(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(read_newspaper(C), read(O3_1), 3), goal(subtask(read_newspaper(C), read(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(read_newspaper(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(read_newspaper(C), walk(O), 1).
goal(subtask(read_newspaper(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(read_newspaper(C), grab(O), 2).
goal(subtask(read_newspaper(C), read(O), 3), t) :- goal(C, read(O), t), subtask(read_newspaper(C), read(O), 3).
