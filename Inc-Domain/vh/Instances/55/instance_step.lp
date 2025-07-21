#program step(t).

goal(turn_on_light(C), T0, t, 1) :- subtask(turn_on_light(C)), subtask(turn_on_light(C), find(O1_1), 1), goal(subtask(turn_on_light(C), find(O1_1), 1), T0), T0 <= T1, time(T0), subtask(turn_on_light(C), walk(O2_1), 2), goal(subtask(turn_on_light(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(turn_on_light(C), walk(O3_1), 3), goal(subtask(turn_on_light(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(turn_on_light(C), T3, t, 2) :- subtask(turn_on_light(C), switchon(O4_1), 4), goal(subtask(turn_on_light(C), switchon(O4_1), 4), T3), T3 <= t, time(T3).
goal(turn_on_light(C), t) :- goal(turn_on_light(C), T0, T2, 1), goal(turn_on_light(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(turn_on_light(C), find(O), 1), t) :- goal(C, find(O), t), subtask(turn_on_light(C), find(O), 1).
goal(subtask(turn_on_light(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(turn_on_light(C), walk(O), 2).
goal(subtask(turn_on_light(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(turn_on_light(C), walk(O), 3).
goal(subtask(turn_on_light(C), switchon(O), 4), t) :- goal(C, switchon(O), t), subtask(turn_on_light(C), switchon(O), 4).
