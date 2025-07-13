#program step(t).

goal(look_in_refrigerator(C), T0, t, 1) :- subtask(look_in_refrigerator(C)), subtask(look_in_refrigerator(C), walk(O1_1), 1), goal(subtask(look_in_refrigerator(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(look_in_refrigerator(C), find(O2_1), 2), goal(subtask(look_in_refrigerator(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(look_in_refrigerator(C), open(O3_1), 3), goal(subtask(look_in_refrigerator(C), open(O3_1), 3), T2), T2 <= t, time(T2).
goal(look_in_refrigerator(C), T3, t, 2) :- subtask(look_in_refrigerator(C), lookat(O4_1), 4), goal(subtask(look_in_refrigerator(C), lookat(O4_1), 4), T3), T3 <= T4, time(T3), subtask(look_in_refrigerator(C), close(O5_1), 5), goal(subtask(look_in_refrigerator(C), close(O5_1), 5), T4), T4 <= t, time(T4).
goal(look_in_refrigerator(C), t) :- goal(look_in_refrigerator(C), T0, T2, 1), goal(look_in_refrigerator(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(look_in_refrigerator(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(look_in_refrigerator(C), walk(O), 1).
goal(subtask(look_in_refrigerator(C), find(O), 2), t) :- goal(C, find(O), t), subtask(look_in_refrigerator(C), find(O), 2).
goal(subtask(look_in_refrigerator(C), open(O), 3), t) :- goal(C, open(O), t), subtask(look_in_refrigerator(C), open(O), 3).
goal(subtask(look_in_refrigerator(C), lookat(O), 4), t) :- goal(C, lookat(O), t), subtask(look_in_refrigerator(C), lookat(O), 4).
goal(subtask(look_in_refrigerator(C), close(O), 5), t) :- goal(C, close(O), t), subtask(look_in_refrigerator(C), close(O), 5).
