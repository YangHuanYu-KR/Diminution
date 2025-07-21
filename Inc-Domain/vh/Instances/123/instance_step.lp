#program step(t).

goal(cut_bread(C), T0, t, 1) :- subtask(cut_bread(C)), subtask(cut_bread(C), walk(O1_1), 1), goal(subtask(cut_bread(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(cut_bread(C), grab(O2_1), 2), goal(subtask(cut_bread(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(cut_bread(C), find(O3_1), 3), goal(subtask(cut_bread(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(cut_bread(C), T3, t, 2) :- subtask(cut_bread(C), cut(O4_1), 4), goal(subtask(cut_bread(C), cut(O4_1), 4), T3), T3 <= t, time(T3).
goal(cut_bread(C), t) :- goal(cut_bread(C), T0, T2, 1), goal(cut_bread(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(cut_bread(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(cut_bread(C), walk(O), 1).
goal(subtask(cut_bread(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(cut_bread(C), grab(O), 2).
goal(subtask(cut_bread(C), find(O), 3), t) :- goal(C, find(O), t), subtask(cut_bread(C), find(O), 3).
goal(subtask(cut_bread(C), cut(O), 4), t) :- goal(C, cut(O), t), subtask(cut_bread(C), cut(O), 4).
