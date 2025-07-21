#program step(t).

goal(switch_on_lamp(C), t) :- subtask(switch_on_lamp(C)), subtask(switch_on_lamp(C), walk(O1_1), 1), goal(subtask(switch_on_lamp(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(switch_on_lamp(C), switchon(O2_1), 2), goal(subtask(switch_on_lamp(C), switchon(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(switch_on_lamp(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(switch_on_lamp(C), walk(O), 1).
goal(subtask(switch_on_lamp(C), switchon(O), 2), t) :- goal(C, switchon(O), t), subtask(switch_on_lamp(C), switchon(O), 2).
