#program step(t).

goal(pick_up_spare_change_on_dresser(C), t) :- subtask(pick_up_spare_change_on_dresser(C)), subtask(pick_up_spare_change_on_dresser(C), walk(O1_1), 1), goal(subtask(pick_up_spare_change_on_dresser(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(pick_up_spare_change_on_dresser(C), lookat(O2_1), 2), goal(subtask(pick_up_spare_change_on_dresser(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(pick_up_spare_change_on_dresser(C), grab(O3_1), 3), goal(subtask(pick_up_spare_change_on_dresser(C), grab(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(pick_up_spare_change_on_dresser(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(pick_up_spare_change_on_dresser(C), walk(O), 1).
goal(subtask(pick_up_spare_change_on_dresser(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(pick_up_spare_change_on_dresser(C), lookat(O), 2).
goal(subtask(pick_up_spare_change_on_dresser(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(pick_up_spare_change_on_dresser(C), grab(O), 3).
