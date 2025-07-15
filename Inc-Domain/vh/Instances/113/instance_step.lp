#program step(t).

goal(turn_on_tv_with_remote(C), T0, t, 1) :- subtask(turn_on_tv_with_remote(C)), subtask(turn_on_tv_with_remote(C), find(O1_1), 1), goal(subtask(turn_on_tv_with_remote(C), find(O1_1), 1), T0), T0 <= T1, time(T0), subtask(turn_on_tv_with_remote(C), turnto(O2_1), 2), goal(subtask(turn_on_tv_with_remote(C), turnto(O2_1), 2), T1), T1 <= T2, time(T1), subtask(turn_on_tv_with_remote(C), find(O3_1), 3), goal(subtask(turn_on_tv_with_remote(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(turn_on_tv_with_remote(C), T3, t, 2) :- subtask(turn_on_tv_with_remote(C), grab(O4_1), 4), goal(subtask(turn_on_tv_with_remote(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(turn_on_tv_with_remote(C), switchon(O5_1), 5), goal(subtask(turn_on_tv_with_remote(C), switchon(O5_1), 5), T4), T4 <= t, time(T4).
goal(turn_on_tv_with_remote(C), t) :- goal(turn_on_tv_with_remote(C), T0, T2, 1), goal(turn_on_tv_with_remote(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(turn_on_tv_with_remote(C), find(O), 1), t) :- goal(C, find(O), t), subtask(turn_on_tv_with_remote(C), find(O), 1).
goal(subtask(turn_on_tv_with_remote(C), turnto(O), 2), t) :- goal(C, turnto(O), t), subtask(turn_on_tv_with_remote(C), turnto(O), 2).
goal(subtask(turn_on_tv_with_remote(C), find(O), 3), t) :- goal(C, find(O), t), subtask(turn_on_tv_with_remote(C), find(O), 3).
goal(subtask(turn_on_tv_with_remote(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(turn_on_tv_with_remote(C), grab(O), 4).
goal(subtask(turn_on_tv_with_remote(C), switchon(O), 5), t) :- goal(C, switchon(O), t), subtask(turn_on_tv_with_remote(C), switchon(O), 5).
