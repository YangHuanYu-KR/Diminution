#program step(t).

goal(leave_home(C), t) :- subtask(leave_home(C)), subtask(leave_home(C), walk(O1_1), 1), goal(subtask(leave_home(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(leave_home(C), open(O2_1), 2), goal(subtask(leave_home(C), open(O2_1), 2), T1), T1 <= T2, time(T1), subtask(leave_home(C), walk(O3_1), 3), goal(subtask(leave_home(C), walk(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(leave_home(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(leave_home(C), walk(O), 1).
goal(subtask(leave_home(C), open(O), 2), t) :- goal(C, open(O), t), subtask(leave_home(C), open(O), 2).
goal(subtask(leave_home(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(leave_home(C), walk(O), 3).
