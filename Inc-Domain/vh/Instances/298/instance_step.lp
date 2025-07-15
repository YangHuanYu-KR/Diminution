#program step(t).

goal(oil_dining_room(C), T0, t, 1) :- subtask(oil_dining_room(C)), subtask(oil_dining_room(C), walk(O1_1), 1), goal(subtask(oil_dining_room(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(oil_dining_room(C), grab(O2_1), 2), goal(subtask(oil_dining_room(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(oil_dining_room(C), walk(O3_1), 3), goal(subtask(oil_dining_room(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(oil_dining_room(C), T3, t, 2) :- subtask(oil_dining_room(C), pour(O4_1, O4_2), 4), goal(subtask(oil_dining_room(C), pour(O4_1, O4_2), 4), T3), T3 <= T4, time(T3), subtask(oil_dining_room(C), drop(O5_1), 5), goal(subtask(oil_dining_room(C), drop(O5_1), 5), T4), T4 <= t, time(T4).
goal(oil_dining_room(C), t) :- goal(oil_dining_room(C), T0, T2, 1), goal(oil_dining_room(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(oil_dining_room(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(oil_dining_room(C), walk(O), 1).
goal(subtask(oil_dining_room(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(oil_dining_room(C), grab(O), 2).
goal(subtask(oil_dining_room(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(oil_dining_room(C), walk(O), 3).
goal(subtask(oil_dining_room(C), pour(O1, O2), 4), t) :- goal(C, pour(O1, O2), t), subtask(oil_dining_room(C), pour(O1, O2), 4).
goal(subtask(oil_dining_room(C), drop(O), 5), t) :- goal(C, drop(O), t), subtask(oil_dining_room(C), drop(O), 5).
