#program step(t).

goal(brush_teeth(C), T0, t, 1) :- subtask(brush_teeth(C)), subtask(brush_teeth(C), walk(O1_1), 1), goal(subtask(brush_teeth(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(brush_teeth(C), find(O2_1), 2), goal(subtask(brush_teeth(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(brush_teeth(C), find(O3_1), 3), goal(subtask(brush_teeth(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(brush_teeth(C), T3, t, 2) :- subtask(brush_teeth(C), plugin(O4_1), 4), goal(subtask(brush_teeth(C), plugin(O4_1), 4), T3), T3 <= T4, time(T3), subtask(brush_teeth(C), wash(O5_1), 5), goal(subtask(brush_teeth(C), wash(O5_1), 5), T4), T4 <= t, time(T4).
goal(brush_teeth(C), t) :- goal(brush_teeth(C), T0, T2, 1), goal(brush_teeth(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(brush_teeth(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(brush_teeth(C), walk(O), 1).
goal(subtask(brush_teeth(C), find(O), 2), t) :- goal(C, find(O), t), subtask(brush_teeth(C), find(O), 2).
goal(subtask(brush_teeth(C), find(O), 3), t) :- goal(C, find(O), t), subtask(brush_teeth(C), find(O), 3).
goal(subtask(brush_teeth(C), plugin(O), 4), t) :- goal(C, plugin(O), t), subtask(brush_teeth(C), plugin(O), 4).
goal(subtask(brush_teeth(C), wash(O), 5), t) :- goal(C, wash(O), t), subtask(brush_teeth(C), wash(O), 5).
