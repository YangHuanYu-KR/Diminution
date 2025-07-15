#program step(t).

goal(do_homework(C), t) :- subtask(do_homework(C)), subtask(do_homework(C), walk(O1_1), 1), goal(subtask(do_homework(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(do_homework(C), switchon(O2_1), 2), goal(subtask(do_homework(C), switchon(O2_1), 2), T1), T1 <= T2, time(T1), subtask(do_homework(C), walk(O3_1), 3), goal(subtask(do_homework(C), walk(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(do_homework(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(do_homework(C), walk(O), 1).
goal(subtask(do_homework(C), switchon(O), 2), t) :- goal(C, switchon(O), t), subtask(do_homework(C), switchon(O), 2).
goal(subtask(do_homework(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(do_homework(C), walk(O), 3).
