#program step(t).

goal(receive_credit_card(C), T0, t, 1) :- subtask(receive_credit_card(C)), subtask(receive_credit_card(C), walk(O1_1), 1), goal(subtask(receive_credit_card(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(receive_credit_card(C), open(O2_1), 2), goal(subtask(receive_credit_card(C), open(O2_1), 2), T1), T1 <= T2, time(T1), subtask(receive_credit_card(C), grab(O3_1), 3), goal(subtask(receive_credit_card(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(receive_credit_card(C), T3, t, 2) :- subtask(receive_credit_card(C), open(O4_1), 4), goal(subtask(receive_credit_card(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(receive_credit_card(C), grab(O5_1), 5), goal(subtask(receive_credit_card(C), grab(O5_1), 5), T4), T4 <= t, time(T4).
goal(receive_credit_card(C), t) :- goal(receive_credit_card(C), T0, T2, 1), goal(receive_credit_card(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(receive_credit_card(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(receive_credit_card(C), walk(O), 1).
goal(subtask(receive_credit_card(C), open(O), 2), t) :- goal(C, open(O), t), subtask(receive_credit_card(C), open(O), 2).
goal(subtask(receive_credit_card(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(receive_credit_card(C), grab(O), 3).
goal(subtask(receive_credit_card(C), open(O), 4), t) :- goal(C, open(O), t), subtask(receive_credit_card(C), open(O), 4).
goal(subtask(receive_credit_card(C), grab(O), 5), t) :- goal(C, grab(O), t), subtask(receive_credit_card(C), grab(O), 5).
