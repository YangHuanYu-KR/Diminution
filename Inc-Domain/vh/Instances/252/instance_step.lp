#program step(t).

goal(write_an_email(C), t) :- subtask(write_an_email(C)), subtask(write_an_email(C), walk(O1_1), 1), goal(subtask(write_an_email(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(write_an_email(C), sit(O2_1), 2), goal(subtask(write_an_email(C), sit(O2_1), 2), T1), T1 <= T2, time(T1), subtask(write_an_email(C), grab(O3_1), 3), goal(subtask(write_an_email(C), grab(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(write_an_email(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(write_an_email(C), walk(O), 1).
goal(subtask(write_an_email(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(write_an_email(C), sit(O), 2).
goal(subtask(write_an_email(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(write_an_email(C), grab(O), 3).
