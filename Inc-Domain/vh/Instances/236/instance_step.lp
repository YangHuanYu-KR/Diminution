#program step(t).

goal(have_snack(C), T0, t, 1) :- subtask(have_snack(C)), subtask(have_snack(C), walk(O1_1), 1), goal(subtask(have_snack(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(have_snack(C), walk(O2_1), 2), goal(subtask(have_snack(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(have_snack(C), grab(O3_1), 3), goal(subtask(have_snack(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(have_snack(C), T3, t, 2) :- subtask(have_snack(C), sit(O4_1), 4), goal(subtask(have_snack(C), sit(O4_1), 4), T3), T3 <= T4, time(T3), subtask(have_snack(C), eat(O5_1), 5), goal(subtask(have_snack(C), eat(O5_1), 5), T4), T4 <= t, time(T4).
goal(have_snack(C), t) :- goal(have_snack(C), T0, T2, 1), goal(have_snack(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(have_snack(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(have_snack(C), walk(O), 1).
goal(subtask(have_snack(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(have_snack(C), walk(O), 2).
goal(subtask(have_snack(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(have_snack(C), grab(O), 3).
goal(subtask(have_snack(C), sit(O), 4), t) :- goal(C, sit(O), t), subtask(have_snack(C), sit(O), 4).
goal(subtask(have_snack(C), eat(O), 5), t) :- goal(C, eat(O), t), subtask(have_snack(C), eat(O), 5).
