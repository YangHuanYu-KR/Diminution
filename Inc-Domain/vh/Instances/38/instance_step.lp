#program step(t).

goal(write_an_email(C), T0, t, 1) :- subtask(write_an_email(C)), subtask(write_an_email(C), sit(O1_1), 1), goal(subtask(write_an_email(C), sit(O1_1), 1), T0), T0 <= T1, time(T0), subtask(write_an_email(C), grab(O2_1), 2), goal(subtask(write_an_email(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(write_an_email(C), open(O3_1), 3), goal(subtask(write_an_email(C), open(O3_1), 3), T2), T2 <= t, time(T2).
goal(write_an_email(C), T3, t, 2) :- subtask(write_an_email(C), plugin(O4_1), 4), goal(subtask(write_an_email(C), plugin(O4_1), 4), T3), T3 <= T4, time(T3), subtask(write_an_email(C), read(O5_1), 5), goal(subtask(write_an_email(C), read(O5_1), 5), T4), T4 <= t, time(T4).
goal(write_an_email(C), t) :- goal(write_an_email(C), T0, T2, 1), goal(write_an_email(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(write_an_email(C), sit(O), 1), t) :- goal(C, sit(O), t), subtask(write_an_email(C), sit(O), 1).
goal(subtask(write_an_email(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(write_an_email(C), grab(O), 2).
goal(subtask(write_an_email(C), open(O), 3), t) :- goal(C, open(O), t), subtask(write_an_email(C), open(O), 3).
goal(subtask(write_an_email(C), plugin(O), 4), t) :- goal(C, plugin(O), t), subtask(write_an_email(C), plugin(O), 4).
goal(subtask(write_an_email(C), read(O), 5), t) :- goal(C, read(O), t), subtask(write_an_email(C), read(O), 5).
