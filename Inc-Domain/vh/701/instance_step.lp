#program step(t).

goal(sit_in_chair(C), T0, t, 1) :- subtask(sit_in_chair(C)), subtask(sit_in_chair(C), find(O1_1), 1), goal(subtask(sit_in_chair(C), find(O1_1), 1), T0), T0 <= T1, time(T0), subtask(sit_in_chair(C), open(O2_1), 2), goal(subtask(sit_in_chair(C), open(O2_1), 2), T1), T1 <= T2, time(T1), subtask(sit_in_chair(C), close(O3_1), 3), goal(subtask(sit_in_chair(C), close(O3_1), 3), T2), T2 <= t, time(T2).
goal(sit_in_chair(C), T3, t, 2) :- subtask(sit_in_chair(C), walk(O4_1), 4), goal(subtask(sit_in_chair(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(sit_in_chair(C), walk(O5_1), 5), goal(subtask(sit_in_chair(C), walk(O5_1), 5), T4), T4 <= t, time(T4).
goal(sit_in_chair(C), t) :- goal(sit_in_chair(C), T0, T2, 1), goal(sit_in_chair(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(sit_in_chair(C), find(O), 1), t) :- goal(C, find(O), t), subtask(sit_in_chair(C), find(O), 1).
goal(subtask(sit_in_chair(C), open(O), 2), t) :- goal(C, open(O), t), subtask(sit_in_chair(C), open(O), 2).
goal(subtask(sit_in_chair(C), close(O), 3), t) :- goal(C, close(O), t), subtask(sit_in_chair(C), close(O), 3).
goal(subtask(sit_in_chair(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(sit_in_chair(C), walk(O), 4).
goal(subtask(sit_in_chair(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(sit_in_chair(C), walk(O), 5).
