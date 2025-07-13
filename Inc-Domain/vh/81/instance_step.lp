#program step(t).

goal(use_laptop(C), T0, t, 1) :- subtask(use_laptop(C)), subtask(use_laptop(C), walk(O1_1), 1), goal(subtask(use_laptop(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(use_laptop(C), open(O2_1), 2), goal(subtask(use_laptop(C), open(O2_1), 2), T1), T1 <= T2, time(T1), subtask(use_laptop(C), grab(O3_1), 3), goal(subtask(use_laptop(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(use_laptop(C), T3, t, 2) :- subtask(use_laptop(C), switchon(O4_1), 4), goal(subtask(use_laptop(C), switchon(O4_1), 4), T3), T3 <= t, time(T3).
goal(use_laptop(C), t) :- goal(use_laptop(C), T0, T2, 1), goal(use_laptop(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(use_laptop(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(use_laptop(C), walk(O), 1).
goal(subtask(use_laptop(C), open(O), 2), t) :- goal(C, open(O), t), subtask(use_laptop(C), open(O), 2).
goal(subtask(use_laptop(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(use_laptop(C), grab(O), 3).
goal(subtask(use_laptop(C), switchon(O), 4), t) :- goal(C, switchon(O), t), subtask(use_laptop(C), switchon(O), 4).
