#program step(t).

goal(sent_email(C), T0, t, 1) :- subtask(sent_email(C)), subtask(sent_email(C), walk(O1_1), 1), goal(subtask(sent_email(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(sent_email(C), open(O2_1), 2), goal(subtask(sent_email(C), open(O2_1), 2), T1), T1 <= T2, time(T1), subtask(sent_email(C), switchon(O3_1), 3), goal(subtask(sent_email(C), switchon(O3_1), 3), T2), T2 <= t, time(T2).
goal(sent_email(C), T3, t, 2) :- subtask(sent_email(C), find(O4_1), 4), goal(subtask(sent_email(C), find(O4_1), 4), T3), T3 <= T4, time(T3), subtask(sent_email(C), touch(O5_1), 5), goal(subtask(sent_email(C), touch(O5_1), 5), T4), T4 <= T5, time(T4), subtask(sent_email(C), read(O6_1), 6), goal(subtask(sent_email(C), read(O6_1), 6), T5), T5 <= t, time(T5).
goal(sent_email(C), T0, t, 3) :- goal(sent_email(C), T0, T2, 1), goal(sent_email(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(sent_email(C), T6, t, 4) :- subtask(sent_email(C), open(O7_1), 7), goal(subtask(sent_email(C), open(O7_1), 7), T6), T6 <= t, time(T6).
goal(sent_email(C), t) :- goal(sent_email(C), T0, T5, 3), goal(sent_email(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(sent_email(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(sent_email(C), walk(O), 1).
goal(subtask(sent_email(C), open(O), 2), t) :- goal(C, open(O), t), subtask(sent_email(C), open(O), 2).
goal(subtask(sent_email(C), switchon(O), 3), t) :- goal(C, switchon(O), t), subtask(sent_email(C), switchon(O), 3).
goal(subtask(sent_email(C), find(O), 4), t) :- goal(C, find(O), t), subtask(sent_email(C), find(O), 4).
goal(subtask(sent_email(C), touch(O), 5), t) :- goal(C, touch(O), t), subtask(sent_email(C), touch(O), 5).
goal(subtask(sent_email(C), read(O), 6), t) :- goal(C, read(O), t), subtask(sent_email(C), read(O), 6).
goal(subtask(sent_email(C), open(O), 7), t) :- goal(C, open(O), t), subtask(sent_email(C), open(O), 7).
