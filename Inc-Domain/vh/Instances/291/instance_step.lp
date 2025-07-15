#program step(t).

goal(start_computer(C), T0, t, 1) :- subtask(start_computer(C)), subtask(start_computer(C), walk(O1_1), 1), goal(subtask(start_computer(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(start_computer(C), grab(O2_1), 2), goal(subtask(start_computer(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(start_computer(C), plugin(O3_1), 3), goal(subtask(start_computer(C), plugin(O3_1), 3), T2), T2 <= t, time(T2).
goal(start_computer(C), T3, t, 2) :- subtask(start_computer(C), switchon(O4_1), 4), goal(subtask(start_computer(C), switchon(O4_1), 4), T3), T3 <= T4, time(T3), subtask(start_computer(C), grab(O5_1), 5), goal(subtask(start_computer(C), grab(O5_1), 5), T4), T4 <= t, time(T4).
goal(start_computer(C), t) :- goal(start_computer(C), T0, T2, 1), goal(start_computer(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(start_computer(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(start_computer(C), walk(O), 1).
goal(subtask(start_computer(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(start_computer(C), grab(O), 2).
goal(subtask(start_computer(C), plugin(O), 3), t) :- goal(C, plugin(O), t), subtask(start_computer(C), plugin(O), 3).
goal(subtask(start_computer(C), switchon(O), 4), t) :- goal(C, switchon(O), t), subtask(start_computer(C), switchon(O), 4).
goal(subtask(start_computer(C), grab(O), 5), t) :- goal(C, grab(O), t), subtask(start_computer(C), grab(O), 5).
