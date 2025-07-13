#program step(t).

goal(change_tv_channels(C), T0, t, 1) :- subtask(change_tv_channels(C)), subtask(change_tv_channels(C), walk(O1_1), 1), goal(subtask(change_tv_channels(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(change_tv_channels(C), lookat(O2_1), 2), goal(subtask(change_tv_channels(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(change_tv_channels(C), grab(O3_1), 3), goal(subtask(change_tv_channels(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(change_tv_channels(C), T3, t, 2) :- subtask(change_tv_channels(C), watch(O4_1), 4), goal(subtask(change_tv_channels(C), watch(O4_1), 4), T3), T3 <= T4, time(T3), subtask(change_tv_channels(C), touch(O5_1), 5), goal(subtask(change_tv_channels(C), touch(O5_1), 5), T4), T4 <= T5, time(T4), subtask(change_tv_channels(C), switchon(O6_1), 6), goal(subtask(change_tv_channels(C), switchon(O6_1), 6), T5), T5 <= t, time(T5).
goal(change_tv_channels(C), T0, t, 3) :- goal(change_tv_channels(C), T0, T2, 1), goal(change_tv_channels(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(change_tv_channels(C), T6, t, 4) :- subtask(change_tv_channels(C), plugout(O7_1), 7), goal(subtask(change_tv_channels(C), plugout(O7_1), 7), T6), T6 <= T7, time(T6), subtask(change_tv_channels(C), watch(O8_1), 8), goal(subtask(change_tv_channels(C), watch(O8_1), 8), T7), T7 <= t, time(T7).
goal(change_tv_channels(C), t) :- goal(change_tv_channels(C), T0, T5, 3), goal(change_tv_channels(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(change_tv_channels(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(change_tv_channels(C), walk(O), 1).
goal(subtask(change_tv_channels(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(change_tv_channels(C), lookat(O), 2).
goal(subtask(change_tv_channels(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(change_tv_channels(C), grab(O), 3).
goal(subtask(change_tv_channels(C), watch(O), 4), t) :- goal(C, watch(O), t), subtask(change_tv_channels(C), watch(O), 4).
goal(subtask(change_tv_channels(C), touch(O), 5), t) :- goal(C, touch(O), t), subtask(change_tv_channels(C), touch(O), 5).
goal(subtask(change_tv_channels(C), switchon(O), 6), t) :- goal(C, switchon(O), t), subtask(change_tv_channels(C), switchon(O), 6).
goal(subtask(change_tv_channels(C), plugout(O), 7), t) :- goal(C, plugout(O), t), subtask(change_tv_channels(C), plugout(O), 7).
goal(subtask(change_tv_channels(C), watch(O), 8), t) :- goal(C, watch(O), t), subtask(change_tv_channels(C), watch(O), 8).
