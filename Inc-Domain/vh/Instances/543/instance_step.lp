#program step(t).

goal(keep_cats_inside_while_door_is_open(C), t) :- subtask(keep_cats_inside_while_door_is_open(C)), subtask(keep_cats_inside_while_door_is_open(C), find(O1_1), 1), goal(subtask(keep_cats_inside_while_door_is_open(C), find(O1_1), 1), T0), T0 <= T1, time(T0), subtask(keep_cats_inside_while_door_is_open(C), open(O2_1), 2), goal(subtask(keep_cats_inside_while_door_is_open(C), open(O2_1), 2), T1), T1 <= T2, time(T1), subtask(keep_cats_inside_while_door_is_open(C), close(O3_1), 3), goal(subtask(keep_cats_inside_while_door_is_open(C), close(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(keep_cats_inside_while_door_is_open(C), find(O), 1), t) :- goal(C, find(O), t), subtask(keep_cats_inside_while_door_is_open(C), find(O), 1).
goal(subtask(keep_cats_inside_while_door_is_open(C), open(O), 2), t) :- goal(C, open(O), t), subtask(keep_cats_inside_while_door_is_open(C), open(O), 2).
goal(subtask(keep_cats_inside_while_door_is_open(C), close(O), 3), t) :- goal(C, close(O), t), subtask(keep_cats_inside_while_door_is_open(C), close(O), 3).
