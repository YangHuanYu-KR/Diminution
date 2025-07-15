#program step(t).

goal(write_report(C), T0, t, 1) :- subtask(write_report(C)), subtask(write_report(C), walk(O1_1), 1), goal(subtask(write_report(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(write_report(C), sit(O2_1), 2), goal(subtask(write_report(C), sit(O2_1), 2), T1), T1 <= T2, time(T1), subtask(write_report(C), open(O3_1), 3), goal(subtask(write_report(C), open(O3_1), 3), T2), T2 <= t, time(T2).
goal(write_report(C), T3, t, 2) :- subtask(write_report(C), read(O4_1), 4), goal(subtask(write_report(C), read(O4_1), 4), T3), T3 <= t, time(T3).
goal(write_report(C), t) :- goal(write_report(C), T0, T2, 1), goal(write_report(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(write_report(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(write_report(C), walk(O), 1).
goal(subtask(write_report(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(write_report(C), sit(O), 2).
goal(subtask(write_report(C), open(O), 3), t) :- goal(C, open(O), t), subtask(write_report(C), open(O), 3).
goal(subtask(write_report(C), read(O), 4), t) :- goal(C, read(O), t), subtask(write_report(C), read(O), 4).
