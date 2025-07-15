#program step(t).

goal(look_in_refrigerator(C), t) :- subtask(look_in_refrigerator(C)), subtask(look_in_refrigerator(C), walk(O1_1), 1), goal(subtask(look_in_refrigerator(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(look_in_refrigerator(C), open(O2_1), 2), goal(subtask(look_in_refrigerator(C), open(O2_1), 2), T1), T1 <= T2, time(T1), subtask(look_in_refrigerator(C), lookat(O3_1), 3), goal(subtask(look_in_refrigerator(C), lookat(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(look_in_refrigerator(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(look_in_refrigerator(C), walk(O), 1).
goal(subtask(look_in_refrigerator(C), open(O), 2), t) :- goal(C, open(O), t), subtask(look_in_refrigerator(C), open(O), 2).
goal(subtask(look_in_refrigerator(C), lookat(O), 3), t) :- goal(C, lookat(O), t), subtask(look_in_refrigerator(C), lookat(O), 3).
