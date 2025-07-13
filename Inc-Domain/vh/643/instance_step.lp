#program step(t).

goal(greet_people(C), T0, t, 1) :- subtask(greet_people(C)), subtask(greet_people(C), walk(O1_1), 1), goal(subtask(greet_people(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(greet_people(C), lookat(O2_1), 2), goal(subtask(greet_people(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(greet_people(C), find(O3_1), 3), goal(subtask(greet_people(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(greet_people(C), T3, t, 2) :- subtask(greet_people(C), open(O4_1), 4), goal(subtask(greet_people(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(greet_people(C), walk(O5_1), 5), goal(subtask(greet_people(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(greet_people(C), walk(O6_1), 6), goal(subtask(greet_people(C), walk(O6_1), 6), T5), T5 <= t, time(T5).
goal(greet_people(C), t) :- goal(greet_people(C), T0, T2, 1), goal(greet_people(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(greet_people(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(greet_people(C), walk(O), 1).
goal(subtask(greet_people(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(greet_people(C), lookat(O), 2).
goal(subtask(greet_people(C), find(O), 3), t) :- goal(C, find(O), t), subtask(greet_people(C), find(O), 3).
goal(subtask(greet_people(C), open(O), 4), t) :- goal(C, open(O), t), subtask(greet_people(C), open(O), 4).
goal(subtask(greet_people(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(greet_people(C), walk(O), 5).
goal(subtask(greet_people(C), walk(O), 6), t) :- goal(C, walk(O), t), subtask(greet_people(C), walk(O), 6).
