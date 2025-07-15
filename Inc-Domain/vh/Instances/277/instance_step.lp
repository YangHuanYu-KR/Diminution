#program step(t).

goal(do_work(C), T0, t, 1) :- subtask(do_work(C)), subtask(do_work(C), walk(O1_1), 1), goal(subtask(do_work(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(do_work(C), sit(O2_1), 2), goal(subtask(do_work(C), sit(O2_1), 2), T1), T1 <= T2, time(T1), subtask(do_work(C), grab(O3_1), 3), goal(subtask(do_work(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(do_work(C), T3, t, 2) :- subtask(do_work(C), grab(O4_1), 4), goal(subtask(do_work(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(do_work(C), lookat(O5_1), 5), goal(subtask(do_work(C), lookat(O5_1), 5), T4), T4 <= T5, time(T4), subtask(do_work(C), touch(O6_1), 6), goal(subtask(do_work(C), touch(O6_1), 6), T5), T5 <= t, time(T5).
goal(do_work(C), t) :- goal(do_work(C), T0, T2, 1), goal(do_work(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(do_work(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(do_work(C), walk(O), 1).
goal(subtask(do_work(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(do_work(C), sit(O), 2).
goal(subtask(do_work(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(do_work(C), grab(O), 3).
goal(subtask(do_work(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(do_work(C), grab(O), 4).
goal(subtask(do_work(C), lookat(O), 5), t) :- goal(C, lookat(O), t), subtask(do_work(C), lookat(O), 5).
goal(subtask(do_work(C), touch(O), 6), t) :- goal(C, touch(O), t), subtask(do_work(C), touch(O), 6).
