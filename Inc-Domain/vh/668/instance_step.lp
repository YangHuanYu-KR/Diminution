#program step(t).

goal(set_mail_on_table(C), t) :- subtask(set_mail_on_table(C)), subtask(set_mail_on_table(C), cut(O1_1), 1), goal(subtask(set_mail_on_table(C), cut(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(set_mail_on_table(C), cut(O), 1), t) :- goal(C, cut(O), t), subtask(set_mail_on_table(C), cut(O), 1).
