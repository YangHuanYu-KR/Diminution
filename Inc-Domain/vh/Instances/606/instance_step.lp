#program step(t).

goal(switch_on_lamp(C), t) :- subtask(switch_on_lamp(C)), subtask(switch_on_lamp(C), walk(O1_1), 1), goal(subtask(switch_on_lamp(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(switch_on_lamp(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(switch_on_lamp(C), walk(O), 1).
