#program step(t).

goal(come_in_and_leave_home(C), T0, t, 1) :- subtask(come_in_and_leave_home(C)), subtask(come_in_and_leave_home(C), walk(O1_1), 1), goal(subtask(come_in_and_leave_home(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(come_in_and_leave_home(C), walk(O2_1), 2), goal(subtask(come_in_and_leave_home(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(come_in_and_leave_home(C), walk(O3_1), 3), goal(subtask(come_in_and_leave_home(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(come_in_and_leave_home(C), T3, t, 2) :- subtask(come_in_and_leave_home(C), walk(O4_1), 4), goal(subtask(come_in_and_leave_home(C), walk(O4_1), 4), T3), T3 <= t, time(T3).
goal(come_in_and_leave_home(C), t) :- goal(come_in_and_leave_home(C), T0, T2, 1), goal(come_in_and_leave_home(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(come_in_and_leave_home(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(come_in_and_leave_home(C), walk(O), 1).
goal(subtask(come_in_and_leave_home(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(come_in_and_leave_home(C), walk(O), 2).
goal(subtask(come_in_and_leave_home(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(come_in_and_leave_home(C), walk(O), 3).
goal(subtask(come_in_and_leave_home(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(come_in_and_leave_home(C), walk(O), 4).
