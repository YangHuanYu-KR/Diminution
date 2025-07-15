#program step(t).

goal(get_glass_of_milk(C), T0, t, 1) :- subtask(get_glass_of_milk(C)), subtask(get_glass_of_milk(C), walk(O1_1), 1), goal(subtask(get_glass_of_milk(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(get_glass_of_milk(C), find(O2_1), 2), goal(subtask(get_glass_of_milk(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(get_glass_of_milk(C), grab(O3_1), 3), goal(subtask(get_glass_of_milk(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(get_glass_of_milk(C), T3, t, 2) :- subtask(get_glass_of_milk(C), find(O4_1), 4), goal(subtask(get_glass_of_milk(C), find(O4_1), 4), T3), T3 <= T4, time(T3), subtask(get_glass_of_milk(C), grab(O5_1), 5), goal(subtask(get_glass_of_milk(C), grab(O5_1), 5), T4), T4 <= T5, time(T4), subtask(get_glass_of_milk(C), pour(O6_1, O6_2), 6), goal(subtask(get_glass_of_milk(C), pour(O6_1, O6_2), 6), T5), T5 <= t, time(T5).
goal(get_glass_of_milk(C), t) :- goal(get_glass_of_milk(C), T0, T2, 1), goal(get_glass_of_milk(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(get_glass_of_milk(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(get_glass_of_milk(C), walk(O), 1).
goal(subtask(get_glass_of_milk(C), find(O), 2), t) :- goal(C, find(O), t), subtask(get_glass_of_milk(C), find(O), 2).
goal(subtask(get_glass_of_milk(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(get_glass_of_milk(C), grab(O), 3).
goal(subtask(get_glass_of_milk(C), find(O), 4), t) :- goal(C, find(O), t), subtask(get_glass_of_milk(C), find(O), 4).
goal(subtask(get_glass_of_milk(C), grab(O), 5), t) :- goal(C, grab(O), t), subtask(get_glass_of_milk(C), grab(O), 5).
goal(subtask(get_glass_of_milk(C), pour(O1, O2), 6), t) :- goal(C, pour(O1, O2), t), subtask(get_glass_of_milk(C), pour(O1, O2), 6).
