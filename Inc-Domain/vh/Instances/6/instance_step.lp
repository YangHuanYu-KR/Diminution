#program step(t).

goal(do_work(C), t) :- subtask(do_work(C)), subtask(do_work(C), sit(O1_1), 1), goal(subtask(do_work(C), sit(O1_1), 1), T0), T0 <= T1, time(T0), subtask(do_work(C), grab(O2_1), 2), goal(subtask(do_work(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(do_work(C), read(O3_1), 3), goal(subtask(do_work(C), read(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(do_work(C), sit(O), 1), t) :- goal(C, sit(O), t), subtask(do_work(C), sit(O), 1).
goal(subtask(do_work(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(do_work(C), grab(O), 2).
goal(subtask(do_work(C), read(O), 3), t) :- goal(C, read(O), t), subtask(do_work(C), read(O), 3).
