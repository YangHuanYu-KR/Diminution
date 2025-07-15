#program step(t).

goal(check_email(C), T0, t, 1) :- subtask(check_email(C)), subtask(check_email(C), walk(O1_1), 1), goal(subtask(check_email(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(check_email(C), lookat(O2_1), 2), goal(subtask(check_email(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(check_email(C), touch(O3_1), 3), goal(subtask(check_email(C), touch(O3_1), 3), T2), T2 <= t, time(T2).
goal(check_email(C), T3, t, 2) :- subtask(check_email(C), lookat(O4_1), 4), goal(subtask(check_email(C), lookat(O4_1), 4), T3), T3 <= T4, time(T3), subtask(check_email(C), read(O5_1), 5), goal(subtask(check_email(C), read(O5_1), 5), T4), T4 <= t, time(T4).
goal(check_email(C), t) :- goal(check_email(C), T0, T2, 1), goal(check_email(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(check_email(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(check_email(C), walk(O), 1).
goal(subtask(check_email(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(check_email(C), lookat(O), 2).
goal(subtask(check_email(C), touch(O), 3), t) :- goal(C, touch(O), t), subtask(check_email(C), touch(O), 3).
goal(subtask(check_email(C), lookat(O), 4), t) :- goal(C, lookat(O), t), subtask(check_email(C), lookat(O), 4).
goal(subtask(check_email(C), read(O), 5), t) :- goal(C, read(O), t), subtask(check_email(C), read(O), 5).
