#program step(t).

goal(work(C), T0, t, 1) :- subtask(work(C)), subtask(work(C), walk(O1_1), 1), goal(subtask(work(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(work(C), sit(O2_1), 2), goal(subtask(work(C), sit(O2_1), 2), T1), T1 <= T2, time(T1), subtask(work(C), open(O3_1), 3), goal(subtask(work(C), open(O3_1), 3), T2), T2 <= t, time(T2).
goal(work(C), T3, t, 2) :- subtask(work(C), watch(O4_1), 4), goal(subtask(work(C), watch(O4_1), 4), T3), T3 <= t, time(T3).
goal(work(C), t) :- goal(work(C), T0, T2, 1), goal(work(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(work(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(work(C), walk(O), 1).
goal(subtask(work(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(work(C), sit(O), 2).
goal(subtask(work(C), open(O), 3), t) :- goal(C, open(O), t), subtask(work(C), open(O), 3).
goal(subtask(work(C), watch(O), 4), t) :- goal(C, watch(O), t), subtask(work(C), watch(O), 4).
