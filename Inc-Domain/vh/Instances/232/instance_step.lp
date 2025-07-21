#program step(t).

goal(keep_cats_out_of_room(C), t) :- subtask(keep_cats_out_of_room(C)), subtask(keep_cats_out_of_room(C), walk(O1_1), 1), goal(subtask(keep_cats_out_of_room(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(keep_cats_out_of_room(C), close(O2_1), 2), goal(subtask(keep_cats_out_of_room(C), close(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(keep_cats_out_of_room(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(keep_cats_out_of_room(C), walk(O), 1).
goal(subtask(keep_cats_out_of_room(C), close(O), 2), t) :- goal(C, close(O), t), subtask(keep_cats_out_of_room(C), close(O), 2).
