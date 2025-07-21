#program step(t).

goal(wash_monitor(C), t) :- subtask(wash_monitor(C)), subtask(wash_monitor(C), grab(O1_1), 1), goal(subtask(wash_monitor(C), grab(O1_1), 1), T0), T0 <= T1, time(T0), subtask(wash_monitor(C), find(O2_1), 2), goal(subtask(wash_monitor(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(wash_monitor(C), wash(O3_1), 3), goal(subtask(wash_monitor(C), wash(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(wash_monitor(C), grab(O), 1), t) :- goal(C, grab(O), t), subtask(wash_monitor(C), grab(O), 1).
goal(subtask(wash_monitor(C), find(O), 2), t) :- goal(C, find(O), t), subtask(wash_monitor(C), find(O), 2).
goal(subtask(wash_monitor(C), wash(O), 3), t) :- goal(C, wash(O), t), subtask(wash_monitor(C), wash(O), 3).
