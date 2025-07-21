#program step(t).

goal(get_out_dish(C), t) :- subtask(get_out_dish(C)), subtask(get_out_dish(C), walk(O1_1), 1), goal(subtask(get_out_dish(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(get_out_dish(C), find(O2_1), 2), goal(subtask(get_out_dish(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(get_out_dish(C), grab(O3_1), 3), goal(subtask(get_out_dish(C), grab(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(get_out_dish(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(get_out_dish(C), walk(O), 1).
goal(subtask(get_out_dish(C), find(O), 2), t) :- goal(C, find(O), t), subtask(get_out_dish(C), find(O), 2).
goal(subtask(get_out_dish(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(get_out_dish(C), grab(O), 3).
