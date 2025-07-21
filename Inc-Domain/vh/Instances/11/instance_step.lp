#program step(t).

goal(keep_cats_out_of_room(C), T0, t, 1) :- subtask(keep_cats_out_of_room(C)), subtask(keep_cats_out_of_room(C), walk(O1_1), 1), goal(subtask(keep_cats_out_of_room(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(keep_cats_out_of_room(C), close(O2_1), 2), goal(subtask(keep_cats_out_of_room(C), close(O2_1), 2), T1), T1 <= T2, time(T1), subtask(keep_cats_out_of_room(C), grab(O3_1), 3), goal(subtask(keep_cats_out_of_room(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(keep_cats_out_of_room(C), T3, t, 2) :- subtask(keep_cats_out_of_room(C), putback(O4_1, O4_2), 4), goal(subtask(keep_cats_out_of_room(C), putback(O4_1, O4_2), 4), T3), T3 <= t, time(T3).
goal(keep_cats_out_of_room(C), t) :- goal(keep_cats_out_of_room(C), T0, T2, 1), goal(keep_cats_out_of_room(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(keep_cats_out_of_room(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(keep_cats_out_of_room(C), walk(O), 1).
goal(subtask(keep_cats_out_of_room(C), close(O), 2), t) :- goal(C, close(O), t), subtask(keep_cats_out_of_room(C), close(O), 2).
goal(subtask(keep_cats_out_of_room(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(keep_cats_out_of_room(C), grab(O), 3).
goal(subtask(keep_cats_out_of_room(C), putback(O1, O2), 4), t) :- goal(C, putback(O1, O2), t), subtask(keep_cats_out_of_room(C), putback(O1, O2), 4).
