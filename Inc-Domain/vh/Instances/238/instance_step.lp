#program step(t).

goal(do_homework(C), T0, t, 1) :- subtask(do_homework(C)), subtask(do_homework(C), walk(O1_1), 1), goal(subtask(do_homework(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(do_homework(C), sit(O2_1), 2), goal(subtask(do_homework(C), sit(O2_1), 2), T1), T1 <= T2, time(T1), subtask(do_homework(C), grab(O3_1), 3), goal(subtask(do_homework(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(do_homework(C), T3, t, 2) :- subtask(do_homework(C), open(O4_1), 4), goal(subtask(do_homework(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(do_homework(C), read(O5_1), 5), goal(subtask(do_homework(C), read(O5_1), 5), T4), T4 <= t, time(T4).
goal(do_homework(C), t) :- goal(do_homework(C), T0, T2, 1), goal(do_homework(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(do_homework(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(do_homework(C), walk(O), 1).
goal(subtask(do_homework(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(do_homework(C), sit(O), 2).
goal(subtask(do_homework(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(do_homework(C), grab(O), 3).
goal(subtask(do_homework(C), open(O), 4), t) :- goal(C, open(O), t), subtask(do_homework(C), open(O), 4).
goal(subtask(do_homework(C), read(O), 5), t) :- goal(C, read(O), t), subtask(do_homework(C), read(O), 5).
