#program step(t).

goal(use_computer(C), T0, t, 1) :- subtask(use_computer(C)), subtask(use_computer(C), walk(O1_1), 1), goal(subtask(use_computer(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(use_computer(C), sit(O2_1), 2), goal(subtask(use_computer(C), sit(O2_1), 2), T1), T1 <= T2, time(T1), subtask(use_computer(C), open(O3_1), 3), goal(subtask(use_computer(C), open(O3_1), 3), T2), T2 <= t, time(T2).
goal(use_computer(C), T3, t, 2) :- subtask(use_computer(C), switchon(O4_1), 4), goal(subtask(use_computer(C), switchon(O4_1), 4), T3), T3 <= t, time(T3).
goal(use_computer(C), t) :- goal(use_computer(C), T0, T2, 1), goal(use_computer(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(use_computer(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(use_computer(C), walk(O), 1).
goal(subtask(use_computer(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(use_computer(C), sit(O), 2).
goal(subtask(use_computer(C), open(O), 3), t) :- goal(C, open(O), t), subtask(use_computer(C), open(O), 3).
goal(subtask(use_computer(C), switchon(O), 4), t) :- goal(C, switchon(O), t), subtask(use_computer(C), switchon(O), 4).
