#program step(t).

goal(apply_lotion(C), T0, t, 1) :- subtask(apply_lotion(C)), subtask(apply_lotion(C), walk(O1_1), 1), goal(subtask(apply_lotion(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(apply_lotion(C), find(O2_1), 2), goal(subtask(apply_lotion(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(apply_lotion(C), grab(O3_1), 3), goal(subtask(apply_lotion(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(apply_lotion(C), T3, t, 2) :- subtask(apply_lotion(C), open(O4_1), 4), goal(subtask(apply_lotion(C), open(O4_1), 4), T3), T3 <= t, time(T3).
goal(apply_lotion(C), t) :- goal(apply_lotion(C), T0, T2, 1), goal(apply_lotion(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(apply_lotion(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(apply_lotion(C), walk(O), 1).
goal(subtask(apply_lotion(C), find(O), 2), t) :- goal(C, find(O), t), subtask(apply_lotion(C), find(O), 2).
goal(subtask(apply_lotion(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(apply_lotion(C), grab(O), 3).
goal(subtask(apply_lotion(C), open(O), 4), t) :- goal(C, open(O), t), subtask(apply_lotion(C), open(O), 4).
