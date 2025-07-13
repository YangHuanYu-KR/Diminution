#program step(t).

goal(sit(C), T0, t, 1) :- subtask(sit(C)), subtask(sit(C), walk(O1_1), 1), goal(subtask(sit(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(sit(C), find(O2_1), 2), goal(subtask(sit(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(sit(C), find(O3_1), 3), goal(subtask(sit(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(sit(C), T3, t, 2) :- subtask(sit(C), find(O4_1), 4), goal(subtask(sit(C), find(O4_1), 4), T3), T3 <= T4, time(T3), subtask(sit(C), find(O5_1), 5), goal(subtask(sit(C), find(O5_1), 5), T4), T4 <= T5, time(T4), subtask(sit(C), find(O6_1), 6), goal(subtask(sit(C), find(O6_1), 6), T5), T5 <= t, time(T5).
goal(sit(C), t) :- goal(sit(C), T0, T2, 1), goal(sit(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(sit(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(sit(C), walk(O), 1).
goal(subtask(sit(C), find(O), 2), t) :- goal(C, find(O), t), subtask(sit(C), find(O), 2).
goal(subtask(sit(C), find(O), 3), t) :- goal(C, find(O), t), subtask(sit(C), find(O), 3).
goal(subtask(sit(C), find(O), 4), t) :- goal(C, find(O), t), subtask(sit(C), find(O), 4).
goal(subtask(sit(C), find(O), 5), t) :- goal(C, find(O), t), subtask(sit(C), find(O), 5).
goal(subtask(sit(C), find(O), 6), t) :- goal(C, find(O), t), subtask(sit(C), find(O), 6).
