#program step(t).

goal(make_bed(C), T0, t, 1) :- subtask(make_bed(C)), subtask(make_bed(C), walk(O1_1), 1), goal(subtask(make_bed(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(make_bed(C), grab(O2_1), 2), goal(subtask(make_bed(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(make_bed(C), putback(O3_1, O3_2), 3), goal(subtask(make_bed(C), putback(O3_1, O3_2), 3), T2), T2 <= t, time(T2).
goal(make_bed(C), T3, t, 2) :- subtask(make_bed(C), touch(O4_1), 4), goal(subtask(make_bed(C), touch(O4_1), 4), T3), T3 <= t, time(T3).
goal(make_bed(C), t) :- goal(make_bed(C), T0, T2, 1), goal(make_bed(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(make_bed(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(make_bed(C), walk(O), 1).
goal(subtask(make_bed(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(make_bed(C), grab(O), 2).
goal(subtask(make_bed(C), putback(O1, O2), 3), t) :- goal(C, putback(O1, O2), t), subtask(make_bed(C), putback(O1, O2), 3).
goal(subtask(make_bed(C), touch(O), 4), t) :- goal(C, touch(O), t), subtask(make_bed(C), touch(O), 4).
