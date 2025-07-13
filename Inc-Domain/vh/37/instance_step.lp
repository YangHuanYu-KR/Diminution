#program step(t).

goal(drink(C), t) :- subtask(drink(C)), subtask(drink(C), grab(O1_1), 1), goal(subtask(drink(C), grab(O1_1), 1), T0), T0 <= T1, time(T0), subtask(drink(C), find(O2_1), 2), goal(subtask(drink(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(drink(C), drink(O3_1), 3), goal(subtask(drink(C), drink(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(drink(C), grab(O), 1), t) :- goal(C, grab(O), t), subtask(drink(C), grab(O), 1).
goal(subtask(drink(C), find(O), 2), t) :- goal(C, find(O), t), subtask(drink(C), find(O), 2).
goal(subtask(drink(C), drink(O), 3), t) :- goal(C, drink(O), t), subtask(drink(C), drink(O), 3).
