#program step(t).

goal(read_to_child(C), T0, t, 1) :- subtask(read_to_child(C)), subtask(read_to_child(C), walk(O1_1), 1), goal(subtask(read_to_child(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(read_to_child(C), find(O2_1), 2), goal(subtask(read_to_child(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(read_to_child(C), sit(O3_1), 3), goal(subtask(read_to_child(C), sit(O3_1), 3), T2), T2 <= t, time(T2).
goal(read_to_child(C), T3, t, 2) :- subtask(read_to_child(C), read(O4_1), 4), goal(subtask(read_to_child(C), read(O4_1), 4), T3), T3 <= t, time(T3).
goal(read_to_child(C), t) :- goal(read_to_child(C), T0, T2, 1), goal(read_to_child(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(read_to_child(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(read_to_child(C), walk(O), 1).
goal(subtask(read_to_child(C), find(O), 2), t) :- goal(C, find(O), t), subtask(read_to_child(C), find(O), 2).
goal(subtask(read_to_child(C), sit(O), 3), t) :- goal(C, sit(O), t), subtask(read_to_child(C), sit(O), 3).
goal(subtask(read_to_child(C), read(O), 4), t) :- goal(C, read(O), t), subtask(read_to_child(C), read(O), 4).
