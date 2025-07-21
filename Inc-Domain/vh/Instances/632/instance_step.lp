#program step(t).

goal(turn_off_tv(C), T0, t, 1) :- subtask(turn_off_tv(C)), subtask(turn_off_tv(C), walk(O1_1), 1), goal(subtask(turn_off_tv(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(turn_off_tv(C), switchon(O2_1), 2), goal(subtask(turn_off_tv(C), switchon(O2_1), 2), T1), T1 <= T2, time(T1), subtask(turn_off_tv(C), switchoff(O3_1), 3), goal(subtask(turn_off_tv(C), switchoff(O3_1), 3), T2), T2 <= t, time(T2).
goal(turn_off_tv(C), T3, t, 2) :- subtask(turn_off_tv(C), plugin(O4_1), 4), goal(subtask(turn_off_tv(C), plugin(O4_1), 4), T3), T3 <= T4, time(T3), subtask(turn_off_tv(C), plugout(O5_1), 5), goal(subtask(turn_off_tv(C), plugout(O5_1), 5), T4), T4 <= t, time(T4).
goal(turn_off_tv(C), t) :- goal(turn_off_tv(C), T0, T2, 1), goal(turn_off_tv(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(turn_off_tv(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(turn_off_tv(C), walk(O), 1).
goal(subtask(turn_off_tv(C), switchon(O), 2), t) :- goal(C, switchon(O), t), subtask(turn_off_tv(C), switchon(O), 2).
goal(subtask(turn_off_tv(C), switchoff(O), 3), t) :- goal(C, switchoff(O), t), subtask(turn_off_tv(C), switchoff(O), 3).
goal(subtask(turn_off_tv(C), plugin(O), 4), t) :- goal(C, plugin(O), t), subtask(turn_off_tv(C), plugin(O), 4).
goal(subtask(turn_off_tv(C), plugout(O), 5), t) :- goal(C, plugout(O), t), subtask(turn_off_tv(C), plugout(O), 5).
