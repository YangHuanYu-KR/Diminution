#program step(t).

goal(check_email(C), t) :- subtask(check_email(C)), subtask(check_email(C), walk(O1_1), 1), goal(subtask(check_email(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(check_email(C), sit(O2_1), 2), goal(subtask(check_email(C), sit(O2_1), 2), T1), T1 <= T2, time(T1), subtask(check_email(C), lookat(O3_1), 3), goal(subtask(check_email(C), lookat(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(check_email(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(check_email(C), walk(O), 1).
goal(subtask(check_email(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(check_email(C), sit(O), 2).
goal(subtask(check_email(C), lookat(O), 3), t) :- goal(C, lookat(O), t), subtask(check_email(C), lookat(O), 3).
