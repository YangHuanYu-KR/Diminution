#program step(t).

goal(clean_mirror(C), T0, t, 1) :- subtask(clean_mirror(C)), subtask(clean_mirror(C), walk(O1_1), 1), goal(subtask(clean_mirror(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(clean_mirror(C), grab(O2_1), 2), goal(subtask(clean_mirror(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(clean_mirror(C), grab(O3_1), 3), goal(subtask(clean_mirror(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(clean_mirror(C), T3, t, 2) :- subtask(clean_mirror(C), walk(O4_1), 4), goal(subtask(clean_mirror(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(clean_mirror(C), wash(O5_1), 5), goal(subtask(clean_mirror(C), wash(O5_1), 5), T4), T4 <= t, time(T4).
goal(clean_mirror(C), t) :- goal(clean_mirror(C), T0, T2, 1), goal(clean_mirror(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(clean_mirror(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(clean_mirror(C), walk(O), 1).
goal(subtask(clean_mirror(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(clean_mirror(C), grab(O), 2).
goal(subtask(clean_mirror(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(clean_mirror(C), grab(O), 3).
goal(subtask(clean_mirror(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(clean_mirror(C), walk(O), 4).
goal(subtask(clean_mirror(C), wash(O), 5), t) :- goal(C, wash(O), t), subtask(clean_mirror(C), wash(O), 5).
