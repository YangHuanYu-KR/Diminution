#program step(t).

goal(have_snack(C), t) :- subtask(have_snack(C)), subtask(have_snack(C), walk(O1_1), 1), goal(subtask(have_snack(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(have_snack(C), find(O2_1), 2), goal(subtask(have_snack(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(have_snack(C), eat(O3_1), 3), goal(subtask(have_snack(C), eat(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(have_snack(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(have_snack(C), walk(O), 1).
goal(subtask(have_snack(C), find(O), 2), t) :- goal(C, find(O), t), subtask(have_snack(C), find(O), 2).
goal(subtask(have_snack(C), eat(O), 3), t) :- goal(C, eat(O), t), subtask(have_snack(C), eat(O), 3).
