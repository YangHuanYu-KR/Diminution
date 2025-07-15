#program step(t).

goal(drink(C), T0, t, 1) :- subtask(drink(C)), subtask(drink(C), walk(O1_1), 1), goal(subtask(drink(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(drink(C), lookat(O2_1), 2), goal(subtask(drink(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(drink(C), read(O3_1), 3), goal(subtask(drink(C), read(O3_1), 3), T2), T2 <= t, time(T2).
goal(drink(C), T3, t, 2) :- subtask(drink(C), walk(O4_1), 4), goal(subtask(drink(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(drink(C), walk(O5_1), 5), goal(subtask(drink(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(drink(C), walk(O6_1), 6), goal(subtask(drink(C), walk(O6_1), 6), T5), T5 <= t, time(T5).
goal(drink(C), t) :- goal(drink(C), T0, T2, 1), goal(drink(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(drink(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(drink(C), walk(O), 1).
goal(subtask(drink(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(drink(C), lookat(O), 2).
goal(subtask(drink(C), read(O), 3), t) :- goal(C, read(O), t), subtask(drink(C), read(O), 3).
goal(subtask(drink(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(drink(C), walk(O), 4).
goal(subtask(drink(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(drink(C), walk(O), 5).
goal(subtask(drink(C), walk(O), 6), t) :- goal(C, walk(O), t), subtask(drink(C), walk(O), 6).
