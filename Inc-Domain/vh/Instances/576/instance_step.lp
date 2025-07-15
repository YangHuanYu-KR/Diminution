#program step(t).

goal(write_an_email(C), t) :- subtask(write_an_email(C)), subtask(write_an_email(C), walk(O1_1), 1), goal(subtask(write_an_email(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(write_an_email(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(write_an_email(C), walk(O), 1).
