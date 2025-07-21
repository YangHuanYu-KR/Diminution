#program step(t).

goal(clean__mirror(C), T0, t, 1) :- subtask(clean__mirror(C)), subtask(clean__mirror(C), walk(O1_1), 1), goal(subtask(clean__mirror(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(clean__mirror(C), find(O2_1), 2), goal(subtask(clean__mirror(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(clean__mirror(C), touch(O3_1), 3), goal(subtask(clean__mirror(C), touch(O3_1), 3), T2), T2 <= t, time(T2).
goal(clean__mirror(C), T3, t, 2) :- subtask(clean__mirror(C), wash(O4_1), 4), goal(subtask(clean__mirror(C), wash(O4_1), 4), T3), T3 <= t, time(T3).
goal(clean__mirror(C), t) :- goal(clean__mirror(C), T0, T2, 1), goal(clean__mirror(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(clean__mirror(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(clean__mirror(C), walk(O), 1).
goal(subtask(clean__mirror(C), find(O), 2), t) :- goal(C, find(O), t), subtask(clean__mirror(C), find(O), 2).
goal(subtask(clean__mirror(C), touch(O), 3), t) :- goal(C, touch(O), t), subtask(clean__mirror(C), touch(O), 3).
goal(subtask(clean__mirror(C), wash(O), 4), t) :- goal(C, wash(O), t), subtask(clean__mirror(C), wash(O), 4).
