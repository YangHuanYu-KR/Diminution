#program step(t).

goal(paint_ceiling(C), T0, t, 1) :- subtask(paint_ceiling(C)), subtask(paint_ceiling(C), walk(O1_1), 1), goal(subtask(paint_ceiling(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(paint_ceiling(C), grab(O2_1), 2), goal(subtask(paint_ceiling(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(paint_ceiling(C), find(O3_1), 3), goal(subtask(paint_ceiling(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(paint_ceiling(C), T3, t, 2) :- subtask(paint_ceiling(C), wash(O4_1), 4), goal(subtask(paint_ceiling(C), wash(O4_1), 4), T3), T3 <= t, time(T3).
goal(paint_ceiling(C), t) :- goal(paint_ceiling(C), T0, T2, 1), goal(paint_ceiling(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(paint_ceiling(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(paint_ceiling(C), walk(O), 1).
goal(subtask(paint_ceiling(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(paint_ceiling(C), grab(O), 2).
goal(subtask(paint_ceiling(C), find(O), 3), t) :- goal(C, find(O), t), subtask(paint_ceiling(C), find(O), 3).
goal(subtask(paint_ceiling(C), wash(O), 4), t) :- goal(C, wash(O), t), subtask(paint_ceiling(C), wash(O), 4).
