#program step(t).

goal(enjoy_view_out_window(C), t) :- subtask(enjoy_view_out_window(C)), subtask(enjoy_view_out_window(C), walk(O1_1), 1), goal(subtask(enjoy_view_out_window(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(enjoy_view_out_window(C), lookat(O2_1), 2), goal(subtask(enjoy_view_out_window(C), lookat(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(enjoy_view_out_window(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(enjoy_view_out_window(C), walk(O), 1).
goal(subtask(enjoy_view_out_window(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(enjoy_view_out_window(C), lookat(O), 2).
