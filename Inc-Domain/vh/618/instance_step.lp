#program step(t).

goal(read_magazine(C), t) :- subtask(read_magazine(C)), subtask(read_magazine(C), walk(O1_1), 1), goal(subtask(read_magazine(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(read_magazine(C), walk(O2_1), 2), goal(subtask(read_magazine(C), walk(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(read_magazine(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(read_magazine(C), walk(O), 1).
goal(subtask(read_magazine(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(read_magazine(C), walk(O), 2).
