#program step(t).

goal(set_mail_on_table(C), T0, t, 1) :- subtask(set_mail_on_table(C)), subtask(set_mail_on_table(C), walk(O1_1), 1), goal(subtask(set_mail_on_table(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(set_mail_on_table(C), grab(O2_1), 2), goal(subtask(set_mail_on_table(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(set_mail_on_table(C), find(O3_1), 3), goal(subtask(set_mail_on_table(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(set_mail_on_table(C), T3, t, 2) :- subtask(set_mail_on_table(C), putin(O4_1, O4_2), 4), goal(subtask(set_mail_on_table(C), putin(O4_1, O4_2), 4), T3), T3 <= t, time(T3).
goal(set_mail_on_table(C), t) :- goal(set_mail_on_table(C), T0, T2, 1), goal(set_mail_on_table(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(set_mail_on_table(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(set_mail_on_table(C), walk(O), 1).
goal(subtask(set_mail_on_table(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(set_mail_on_table(C), grab(O), 2).
goal(subtask(set_mail_on_table(C), find(O), 3), t) :- goal(C, find(O), t), subtask(set_mail_on_table(C), find(O), 3).
goal(subtask(set_mail_on_table(C), putin(O1, O2), 4), t) :- goal(C, putin(O1, O2), t), subtask(set_mail_on_table(C), putin(O1, O2), 4).
