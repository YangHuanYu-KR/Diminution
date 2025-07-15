#program step(t).

goal(pick_up_phone(C), T0, t, 1) :- subtask(pick_up_phone(C)), subtask(pick_up_phone(C), walk(O1_1), 1), goal(subtask(pick_up_phone(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(pick_up_phone(C), walk(O2_1), 2), goal(subtask(pick_up_phone(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(pick_up_phone(C), walk(O3_1), 3), goal(subtask(pick_up_phone(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(pick_up_phone(C), T3, t, 2) :- subtask(pick_up_phone(C), find(O4_1), 4), goal(subtask(pick_up_phone(C), find(O4_1), 4), T3), T3 <= T4, time(T3), subtask(pick_up_phone(C), open(O5_1), 5), goal(subtask(pick_up_phone(C), open(O5_1), 5), T4), T4 <= T5, time(T4), subtask(pick_up_phone(C), putin(O6_1, O6_2), 6), goal(subtask(pick_up_phone(C), putin(O6_1, O6_2), 6), T5), T5 <= t, time(T5).
goal(pick_up_phone(C), T0, t, 3) :- goal(pick_up_phone(C), T0, T2, 1), goal(pick_up_phone(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(pick_up_phone(C), T6, t, 4) :- subtask(pick_up_phone(C), close(O7_1), 7), goal(subtask(pick_up_phone(C), close(O7_1), 7), T6), T6 <= t, time(T6).
goal(pick_up_phone(C), t) :- goal(pick_up_phone(C), T0, T5, 3), goal(pick_up_phone(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(pick_up_phone(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(pick_up_phone(C), walk(O), 1).
goal(subtask(pick_up_phone(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(pick_up_phone(C), walk(O), 2).
goal(subtask(pick_up_phone(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(pick_up_phone(C), walk(O), 3).
goal(subtask(pick_up_phone(C), find(O), 4), t) :- goal(C, find(O), t), subtask(pick_up_phone(C), find(O), 4).
goal(subtask(pick_up_phone(C), open(O), 5), t) :- goal(C, open(O), t), subtask(pick_up_phone(C), open(O), 5).
goal(subtask(pick_up_phone(C), putin(O1, O2), 6), t) :- goal(C, putin(O1, O2), t), subtask(pick_up_phone(C), putin(O1, O2), 6).
goal(subtask(pick_up_phone(C), close(O), 7), t) :- goal(C, close(O), t), subtask(pick_up_phone(C), close(O), 7).
