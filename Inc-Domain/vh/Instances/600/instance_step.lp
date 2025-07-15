#program step(t).

goal(text_friends_while_sitting_on_couch(C), t) :- subtask(text_friends_while_sitting_on_couch(C)), subtask(text_friends_while_sitting_on_couch(C), walk(O1_1), 1), goal(subtask(text_friends_while_sitting_on_couch(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(text_friends_while_sitting_on_couch(C), switchon(O2_1), 2), goal(subtask(text_friends_while_sitting_on_couch(C), switchon(O2_1), 2), T1), T1 <= T2, time(T1), subtask(text_friends_while_sitting_on_couch(C), sit(O3_1), 3), goal(subtask(text_friends_while_sitting_on_couch(C), sit(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(text_friends_while_sitting_on_couch(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(text_friends_while_sitting_on_couch(C), walk(O), 1).
goal(subtask(text_friends_while_sitting_on_couch(C), switchon(O), 2), t) :- goal(C, switchon(O), t), subtask(text_friends_while_sitting_on_couch(C), switchon(O), 2).
goal(subtask(text_friends_while_sitting_on_couch(C), sit(O), 3), t) :- goal(C, sit(O), t), subtask(text_friends_while_sitting_on_couch(C), sit(O), 3).
