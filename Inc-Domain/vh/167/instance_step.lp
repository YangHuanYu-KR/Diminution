#program step(t).

goal(greet_guests(C), t) :- subtask(greet_guests(C)), subtask(greet_guests(C), walk(O1_1), 1), goal(subtask(greet_guests(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(greet_guests(C), open(O2_1), 2), goal(subtask(greet_guests(C), open(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(greet_guests(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(greet_guests(C), walk(O), 1).
goal(subtask(greet_guests(C), open(O), 2), t) :- goal(C, open(O), t), subtask(greet_guests(C), open(O), 2).
