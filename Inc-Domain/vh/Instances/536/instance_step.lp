#program step(t).

goal(pick_up_dirty_dishes(C), t) :- subtask(pick_up_dirty_dishes(C)), subtask(pick_up_dirty_dishes(C), walk(O1_1), 1), goal(subtask(pick_up_dirty_dishes(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(pick_up_dirty_dishes(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(pick_up_dirty_dishes(C), walk(O), 1).
