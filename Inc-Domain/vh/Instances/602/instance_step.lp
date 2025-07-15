#program step(t).

goal(paint_ceiling(C), t) :- subtask(paint_ceiling(C)), subtask(paint_ceiling(C), walk(O1_1), 1), goal(subtask(paint_ceiling(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(paint_ceiling(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(paint_ceiling(C), walk(O), 1).
