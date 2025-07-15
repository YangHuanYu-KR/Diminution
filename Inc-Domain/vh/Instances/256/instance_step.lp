#program step(t).

goal(turn_off_tv(C), t) :- subtask(turn_off_tv(C)), subtask(turn_off_tv(C), walk(O1_1), 1), goal(subtask(turn_off_tv(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(turn_off_tv(C), find(O2_1), 2), goal(subtask(turn_off_tv(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(turn_off_tv(C), switchoff(O3_1), 3), goal(subtask(turn_off_tv(C), switchoff(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(turn_off_tv(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(turn_off_tv(C), walk(O), 1).
goal(subtask(turn_off_tv(C), find(O), 2), t) :- goal(C, find(O), t), subtask(turn_off_tv(C), find(O), 2).
goal(subtask(turn_off_tv(C), switchoff(O), 3), t) :- goal(C, switchoff(O), t), subtask(turn_off_tv(C), switchoff(O), 3).
