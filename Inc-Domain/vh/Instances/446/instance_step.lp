#program step(t).

goal(say_goodbye_to_guests_leaving(C), t) :- subtask(say_goodbye_to_guests_leaving(C)), subtask(say_goodbye_to_guests_leaving(C), walk(O1_1), 1), goal(subtask(say_goodbye_to_guests_leaving(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(say_goodbye_to_guests_leaving(C), lookat(O2_1), 2), goal(subtask(say_goodbye_to_guests_leaving(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(say_goodbye_to_guests_leaving(C), lookat(O3_1), 3), goal(subtask(say_goodbye_to_guests_leaving(C), lookat(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(say_goodbye_to_guests_leaving(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(say_goodbye_to_guests_leaving(C), walk(O), 1).
goal(subtask(say_goodbye_to_guests_leaving(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(say_goodbye_to_guests_leaving(C), lookat(O), 2).
goal(subtask(say_goodbye_to_guests_leaving(C), lookat(O), 3), t) :- goal(C, lookat(O), t), subtask(say_goodbye_to_guests_leaving(C), lookat(O), 3).
