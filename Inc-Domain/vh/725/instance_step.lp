#program step(t).

goal(do_laundry(C), t) :- subtask(do_laundry(C)), subtask(do_laundry(C), walk(O1_1), 1), goal(subtask(do_laundry(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(do_laundry(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(do_laundry(C), walk(O), 1).
