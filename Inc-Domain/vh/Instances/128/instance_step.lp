#program step(t).

goal(browse_computer(C), t) :- subtask(browse_computer(C)), subtask(browse_computer(C), walk(O1_1), 1), goal(subtask(browse_computer(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(browse_computer(C), lookat(O2_1), 2), goal(subtask(browse_computer(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(browse_computer(C), touch(O3_1), 3), goal(subtask(browse_computer(C), touch(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(browse_computer(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(browse_computer(C), walk(O), 1).
goal(subtask(browse_computer(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(browse_computer(C), lookat(O), 2).
goal(subtask(browse_computer(C), touch(O), 3), t) :- goal(C, touch(O), t), subtask(browse_computer(C), touch(O), 3).
