#program step(t).

goal(use_computer(C), t) :- subtask(use_computer(C)), subtask(use_computer(C), walk(O1_1), 1), goal(subtask(use_computer(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(use_computer(C), walk(O2_1), 2), goal(subtask(use_computer(C), walk(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(use_computer(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(use_computer(C), walk(O), 1).
goal(subtask(use_computer(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(use_computer(C), walk(O), 2).
