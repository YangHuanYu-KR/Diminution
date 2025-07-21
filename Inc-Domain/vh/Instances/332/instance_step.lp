#program step(t).

goal(pick_up_dirty_dishes(C), T0, t, 1) :- subtask(pick_up_dirty_dishes(C)), subtask(pick_up_dirty_dishes(C), walk(O1_1), 1), goal(subtask(pick_up_dirty_dishes(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(pick_up_dirty_dishes(C), lookat(O2_1), 2), goal(subtask(pick_up_dirty_dishes(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(pick_up_dirty_dishes(C), grab(O3_1), 3), goal(subtask(pick_up_dirty_dishes(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(pick_up_dirty_dishes(C), T3, t, 2) :- subtask(pick_up_dirty_dishes(C), walk(O4_1), 4), goal(subtask(pick_up_dirty_dishes(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(pick_up_dirty_dishes(C), putin(O5_1, O5_2), 5), goal(subtask(pick_up_dirty_dishes(C), putin(O5_1, O5_2), 5), T4), T4 <= t, time(T4).
goal(pick_up_dirty_dishes(C), t) :- goal(pick_up_dirty_dishes(C), T0, T2, 1), goal(pick_up_dirty_dishes(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(pick_up_dirty_dishes(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(pick_up_dirty_dishes(C), walk(O), 1).
goal(subtask(pick_up_dirty_dishes(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(pick_up_dirty_dishes(C), lookat(O), 2).
goal(subtask(pick_up_dirty_dishes(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(pick_up_dirty_dishes(C), grab(O), 3).
goal(subtask(pick_up_dirty_dishes(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(pick_up_dirty_dishes(C), walk(O), 4).
goal(subtask(pick_up_dirty_dishes(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(pick_up_dirty_dishes(C), putin(O1, O2), 5).
