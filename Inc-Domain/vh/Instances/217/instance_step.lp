#program step(t).

goal(say_goodbye_to_guests_leaving(C), t) :- subtask(say_goodbye_to_guests_leaving(C)), subtask(say_goodbye_to_guests_leaving(C), walk(O1_1), 1), goal(subtask(say_goodbye_to_guests_leaving(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(say_goodbye_to_guests_leaving(C), open(O2_1), 2), goal(subtask(say_goodbye_to_guests_leaving(C), open(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(say_goodbye_to_guests_leaving(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(say_goodbye_to_guests_leaving(C), walk(O), 1).
goal(subtask(say_goodbye_to_guests_leaving(C), open(O), 2), t) :- goal(C, open(O), t), subtask(say_goodbye_to_guests_leaving(C), open(O), 2).
