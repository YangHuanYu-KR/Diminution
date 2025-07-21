#program step(t).

goal(walk_to_room(C), t) :- subtask(walk_to_room(C)), subtask(walk_to_room(C), walk(O1_1), 1), goal(subtask(walk_to_room(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(walk_to_room(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(walk_to_room(C), walk(O), 1).
