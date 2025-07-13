#program step(t).

goal(receive_credit_card(C), t) :- subtask(receive_credit_card(C)), subtask(receive_credit_card(C), switchoff(O1_1), 1), goal(subtask(receive_credit_card(C), switchoff(O1_1), 1), T0), T0 <= T1, time(T0), subtask(receive_credit_card(C), switchon(O2_1), 2), goal(subtask(receive_credit_card(C), switchon(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(receive_credit_card(C), switchoff(O), 1), t) :- goal(C, switchoff(O), t), subtask(receive_credit_card(C), switchoff(O), 1).
goal(subtask(receive_credit_card(C), switchon(O), 2), t) :- goal(C, switchon(O), t), subtask(receive_credit_card(C), switchon(O), 2).
