#program step(t).

goal(read_magazine(C), T0, t, 1) :- subtask(read_magazine(C)), subtask(read_magazine(C), walk(O1_1), 1), goal(subtask(read_magazine(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(read_magazine(C), lie(O2_1), 2), goal(subtask(read_magazine(C), lie(O2_1), 2), T1), T1 <= T2, time(T1), subtask(read_magazine(C), grab(O3_1), 3), goal(subtask(read_magazine(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(read_magazine(C), T3, t, 2) :- subtask(read_magazine(C), read(O4_1), 4), goal(subtask(read_magazine(C), read(O4_1), 4), T3), T3 <= t, time(T3).
goal(read_magazine(C), t) :- goal(read_magazine(C), T0, T2, 1), goal(read_magazine(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(read_magazine(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(read_magazine(C), walk(O), 1).
goal(subtask(read_magazine(C), lie(O), 2), t) :- goal(C, lie(O), t), subtask(read_magazine(C), lie(O), 2).
goal(subtask(read_magazine(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(read_magazine(C), grab(O), 3).
goal(subtask(read_magazine(C), read(O), 4), t) :- goal(C, read(O), t), subtask(read_magazine(C), read(O), 4).
