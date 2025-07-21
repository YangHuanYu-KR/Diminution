#program step(t).

goal(turn_light_off(C), t) :- subtask(turn_light_off(C)), subtask(turn_light_off(C), walk(O1_1), 1), goal(subtask(turn_light_off(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(turn_light_off(C), switchoff(O2_1), 2), goal(subtask(turn_light_off(C), switchoff(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(turn_light_off(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(turn_light_off(C), walk(O), 1).
goal(subtask(turn_light_off(C), switchoff(O), 2), t) :- goal(C, switchoff(O), t), subtask(turn_light_off(C), switchoff(O), 2).
