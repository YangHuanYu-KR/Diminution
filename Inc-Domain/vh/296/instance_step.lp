#program step(t).

goal(sent_email(C), T0, t, 1) :- subtask(sent_email(C)), subtask(sent_email(C), walk(O1_1), 1), goal(subtask(sent_email(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(sent_email(C), lookat(O2_1), 2), goal(subtask(sent_email(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(sent_email(C), sit(O3_1), 3), goal(subtask(sent_email(C), sit(O3_1), 3), T2), T2 <= t, time(T2).
goal(sent_email(C), T3, t, 2) :- subtask(sent_email(C), grab(O4_1), 4), goal(subtask(sent_email(C), grab(O4_1), 4), T3), T3 <= t, time(T3).
goal(sent_email(C), t) :- goal(sent_email(C), T0, T2, 1), goal(sent_email(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(sent_email(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(sent_email(C), walk(O), 1).
goal(subtask(sent_email(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(sent_email(C), lookat(O), 2).
goal(subtask(sent_email(C), sit(O), 3), t) :- goal(C, sit(O), t), subtask(sent_email(C), sit(O), 3).
goal(subtask(sent_email(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(sent_email(C), grab(O), 4).
