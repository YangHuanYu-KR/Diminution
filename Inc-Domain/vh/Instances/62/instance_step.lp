#program step(t).

goal(text_friends_while_sitting_on_couch(C), T0, t, 1) :- subtask(text_friends_while_sitting_on_couch(C)), subtask(text_friends_while_sitting_on_couch(C), sit(O1_1), 1), goal(subtask(text_friends_while_sitting_on_couch(C), sit(O1_1), 1), T0), T0 <= T1, time(T0), subtask(text_friends_while_sitting_on_couch(C), grab(O2_1), 2), goal(subtask(text_friends_while_sitting_on_couch(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(text_friends_while_sitting_on_couch(C), read(O3_1), 3), goal(subtask(text_friends_while_sitting_on_couch(C), read(O3_1), 3), T2), T2 <= t, time(T2).
goal(text_friends_while_sitting_on_couch(C), T3, t, 2) :- subtask(text_friends_while_sitting_on_couch(C), open(O4_1), 4), goal(subtask(text_friends_while_sitting_on_couch(C), open(O4_1), 4), T3), T3 <= t, time(T3).
goal(text_friends_while_sitting_on_couch(C), t) :- goal(text_friends_while_sitting_on_couch(C), T0, T2, 1), goal(text_friends_while_sitting_on_couch(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(text_friends_while_sitting_on_couch(C), sit(O), 1), t) :- goal(C, sit(O), t), subtask(text_friends_while_sitting_on_couch(C), sit(O), 1).
goal(subtask(text_friends_while_sitting_on_couch(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(text_friends_while_sitting_on_couch(C), grab(O), 2).
goal(subtask(text_friends_while_sitting_on_couch(C), read(O), 3), t) :- goal(C, read(O), t), subtask(text_friends_while_sitting_on_couch(C), read(O), 3).
goal(subtask(text_friends_while_sitting_on_couch(C), open(O), 4), t) :- goal(C, open(O), t), subtask(text_friends_while_sitting_on_couch(C), open(O), 4).
