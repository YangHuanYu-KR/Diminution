#program step(t).

goal(keep_cats_out_of_room(C), t) :- subtask(keep_cats_out_of_room(C)), subtask(keep_cats_out_of_room(C), walk(O1_1), 1), goal(subtask(keep_cats_out_of_room(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(keep_cats_out_of_room(C), find(O2_1), 2), goal(subtask(keep_cats_out_of_room(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(keep_cats_out_of_room(C), open(O3_1), 3), goal(subtask(keep_cats_out_of_room(C), open(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(keep_cats_out_of_room(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(keep_cats_out_of_room(C), walk(O), 1).
goal(subtask(keep_cats_out_of_room(C), find(O), 2), t) :- goal(C, find(O), t), subtask(keep_cats_out_of_room(C), find(O), 2).
goal(subtask(keep_cats_out_of_room(C), open(O), 3), t) :- goal(C, open(O), t), subtask(keep_cats_out_of_room(C), open(O), 3).
