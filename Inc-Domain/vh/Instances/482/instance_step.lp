#program step(t).

goal(wash_clothes(C), t) :- subtask(wash_clothes(C)), subtask(wash_clothes(C), walk(O1_1), 1), goal(subtask(wash_clothes(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(wash_clothes(C), find(O2_1), 2), goal(subtask(wash_clothes(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(wash_clothes(C), close(O3_1), 3), goal(subtask(wash_clothes(C), close(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(wash_clothes(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(wash_clothes(C), walk(O), 1).
goal(subtask(wash_clothes(C), find(O), 2), t) :- goal(C, find(O), t), subtask(wash_clothes(C), find(O), 2).
goal(subtask(wash_clothes(C), close(O), 3), t) :- goal(C, close(O), t), subtask(wash_clothes(C), close(O), 3).
