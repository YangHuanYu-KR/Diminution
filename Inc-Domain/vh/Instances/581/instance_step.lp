#program step(t).

goal(give_milk_to_cat(C), T0, t, 1) :- subtask(give_milk_to_cat(C)), subtask(give_milk_to_cat(C), walk(O1_1), 1), goal(subtask(give_milk_to_cat(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(give_milk_to_cat(C), lookat(O2_1), 2), goal(subtask(give_milk_to_cat(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(give_milk_to_cat(C), walk(O3_1), 3), goal(subtask(give_milk_to_cat(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(give_milk_to_cat(C), T3, t, 2) :- subtask(give_milk_to_cat(C), lookat(O4_1), 4), goal(subtask(give_milk_to_cat(C), lookat(O4_1), 4), T3), T3 <= t, time(T3).
goal(give_milk_to_cat(C), t) :- goal(give_milk_to_cat(C), T0, T2, 1), goal(give_milk_to_cat(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(give_milk_to_cat(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(give_milk_to_cat(C), walk(O), 1).
goal(subtask(give_milk_to_cat(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(give_milk_to_cat(C), lookat(O), 2).
goal(subtask(give_milk_to_cat(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(give_milk_to_cat(C), walk(O), 3).
goal(subtask(give_milk_to_cat(C), lookat(O), 4), t) :- goal(C, lookat(O), t), subtask(give_milk_to_cat(C), lookat(O), 4).
