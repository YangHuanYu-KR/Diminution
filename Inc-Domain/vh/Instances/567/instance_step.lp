#program step(t).

goal(oil_dining_room(C), T0, t, 1) :- subtask(oil_dining_room(C)), subtask(oil_dining_room(C), walk(O1_1), 1), goal(subtask(oil_dining_room(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(oil_dining_room(C), grab(O2_1), 2), goal(subtask(oil_dining_room(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(oil_dining_room(C), find(O3_1), 3), goal(subtask(oil_dining_room(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(oil_dining_room(C), T3, t, 2) :- subtask(oil_dining_room(C), find(O4_1), 4), goal(subtask(oil_dining_room(C), find(O4_1), 4), T3), T3 <= T4, time(T3), subtask(oil_dining_room(C), find(O5_1), 5), goal(subtask(oil_dining_room(C), find(O5_1), 5), T4), T4 <= T5, time(T4), subtask(oil_dining_room(C), walk(O6_1), 6), goal(subtask(oil_dining_room(C), walk(O6_1), 6), T5), T5 <= t, time(T5).
goal(oil_dining_room(C), T0, t, 3) :- goal(oil_dining_room(C), T0, T2, 1), goal(oil_dining_room(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(oil_dining_room(C), T6, t, 4) :- subtask(oil_dining_room(C), grab(O7_1), 7), goal(subtask(oil_dining_room(C), grab(O7_1), 7), T6), T6 <= T7, time(T6), subtask(oil_dining_room(C), find(O8_1), 8), goal(subtask(oil_dining_room(C), find(O8_1), 8), T7), T7 <= t, time(T7).
goal(oil_dining_room(C), t) :- goal(oil_dining_room(C), T0, T5, 3), goal(oil_dining_room(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(oil_dining_room(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(oil_dining_room(C), walk(O), 1).
goal(subtask(oil_dining_room(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(oil_dining_room(C), grab(O), 2).
goal(subtask(oil_dining_room(C), find(O), 3), t) :- goal(C, find(O), t), subtask(oil_dining_room(C), find(O), 3).
goal(subtask(oil_dining_room(C), find(O), 4), t) :- goal(C, find(O), t), subtask(oil_dining_room(C), find(O), 4).
goal(subtask(oil_dining_room(C), find(O), 5), t) :- goal(C, find(O), t), subtask(oil_dining_room(C), find(O), 5).
goal(subtask(oil_dining_room(C), walk(O), 6), t) :- goal(C, walk(O), t), subtask(oil_dining_room(C), walk(O), 6).
goal(subtask(oil_dining_room(C), grab(O), 7), t) :- goal(C, grab(O), t), subtask(oil_dining_room(C), grab(O), 7).
goal(subtask(oil_dining_room(C), find(O), 8), t) :- goal(C, find(O), t), subtask(oil_dining_room(C), find(O), 8).
