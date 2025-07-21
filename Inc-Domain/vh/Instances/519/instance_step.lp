#program step(t).

goal(sort_laundry(C), t) :- subtask(sort_laundry(C)), subtask(sort_laundry(C), walk(O1_1), 1), goal(subtask(sort_laundry(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(sort_laundry(C), walk(O2_1), 2), goal(subtask(sort_laundry(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(sort_laundry(C), walk(O3_1), 3), goal(subtask(sort_laundry(C), walk(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(sort_laundry(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(sort_laundry(C), walk(O), 1).
goal(subtask(sort_laundry(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(sort_laundry(C), walk(O), 2).
goal(subtask(sort_laundry(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(sort_laundry(C), walk(O), 3).
