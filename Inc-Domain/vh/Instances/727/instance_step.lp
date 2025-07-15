#program step(t).

goal(manage_emails(C), t) :- subtask(manage_emails(C)), subtask(manage_emails(C), walk(O1_1), 1), goal(subtask(manage_emails(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(manage_emails(C), walk(O2_1), 2), goal(subtask(manage_emails(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(manage_emails(C), cut(O3_1), 3), goal(subtask(manage_emails(C), cut(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(manage_emails(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(manage_emails(C), walk(O), 1).
goal(subtask(manage_emails(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(manage_emails(C), walk(O), 2).
goal(subtask(manage_emails(C), cut(O), 3), t) :- goal(C, cut(O), t), subtask(manage_emails(C), cut(O), 3).
