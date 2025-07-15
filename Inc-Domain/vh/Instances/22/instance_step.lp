#program step(t).

goal(start_computer(C), t) :- subtask(start_computer(C)), subtask(start_computer(C), walk(O1_1), 1), goal(subtask(start_computer(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(start_computer(C), grab(O2_1), 2), goal(subtask(start_computer(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(start_computer(C), switchon(O3_1), 3), goal(subtask(start_computer(C), switchon(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(start_computer(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(start_computer(C), walk(O), 1).
goal(subtask(start_computer(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(start_computer(C), grab(O), 2).
goal(subtask(start_computer(C), switchon(O), 3), t) :- goal(C, switchon(O), t), subtask(start_computer(C), switchon(O), 3).
