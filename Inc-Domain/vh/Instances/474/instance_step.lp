#program step(t).

goal(brush_teeth(C), t) :- subtask(brush_teeth(C)), subtask(brush_teeth(C), walk(O1_1), 1), goal(subtask(brush_teeth(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(brush_teeth(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(brush_teeth(C), walk(O), 1).
