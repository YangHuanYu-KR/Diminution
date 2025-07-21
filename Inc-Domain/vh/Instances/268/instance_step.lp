#program step(t).

goal(change_tv_channel(C), T0, t, 1) :- subtask(change_tv_channel(C)), subtask(change_tv_channel(C), walk(O1_1), 1), goal(subtask(change_tv_channel(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(change_tv_channel(C), lookat(O2_1), 2), goal(subtask(change_tv_channel(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(change_tv_channel(C), grab(O3_1), 3), goal(subtask(change_tv_channel(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(change_tv_channel(C), T3, t, 2) :- subtask(change_tv_channel(C), turnto(O4_1), 4), goal(subtask(change_tv_channel(C), turnto(O4_1), 4), T3), T3 <= t, time(T3).
goal(change_tv_channel(C), t) :- goal(change_tv_channel(C), T0, T2, 1), goal(change_tv_channel(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(change_tv_channel(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(change_tv_channel(C), walk(O), 1).
goal(subtask(change_tv_channel(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(change_tv_channel(C), lookat(O), 2).
goal(subtask(change_tv_channel(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(change_tv_channel(C), grab(O), 3).
goal(subtask(change_tv_channel(C), turnto(O), 4), t) :- goal(C, turnto(O), t), subtask(change_tv_channel(C), turnto(O), 4).
