#program step(t).

goal(turn_on_light(C), t) :- subtask(turn_on_light(C)), subtask(turn_on_light(C), walk(O1_1), 1), goal(subtask(turn_on_light(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(turn_on_light(C), walk(O2_1), 2), goal(subtask(turn_on_light(C), walk(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(turn_on_light(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(turn_on_light(C), walk(O), 1).
goal(subtask(turn_on_light(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(turn_on_light(C), walk(O), 2).
