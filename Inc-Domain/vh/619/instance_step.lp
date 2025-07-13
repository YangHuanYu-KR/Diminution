#program step(t).

goal(use_laptop(C), T0, t, 1) :- subtask(use_laptop(C)), subtask(use_laptop(C), walk(O1_1), 1), goal(subtask(use_laptop(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(use_laptop(C), find(O2_1), 2), goal(subtask(use_laptop(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(use_laptop(C), open(O3_1), 3), goal(subtask(use_laptop(C), open(O3_1), 3), T2), T2 <= t, time(T2).
goal(use_laptop(C), T3, t, 2) :- subtask(use_laptop(C), walk(O4_1), 4), goal(subtask(use_laptop(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(use_laptop(C), walk(O5_1), 5), goal(subtask(use_laptop(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(use_laptop(C), switchon(O6_1), 6), goal(subtask(use_laptop(C), switchon(O6_1), 6), T5), T5 <= t, time(T5).
goal(use_laptop(C), t) :- goal(use_laptop(C), T0, T2, 1), goal(use_laptop(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(use_laptop(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(use_laptop(C), walk(O), 1).
goal(subtask(use_laptop(C), find(O), 2), t) :- goal(C, find(O), t), subtask(use_laptop(C), find(O), 2).
goal(subtask(use_laptop(C), open(O), 3), t) :- goal(C, open(O), t), subtask(use_laptop(C), open(O), 3).
goal(subtask(use_laptop(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(use_laptop(C), walk(O), 4).
goal(subtask(use_laptop(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(use_laptop(C), walk(O), 5).
goal(subtask(use_laptop(C), switchon(O), 6), t) :- goal(C, switchon(O), t), subtask(use_laptop(C), switchon(O), 6).
