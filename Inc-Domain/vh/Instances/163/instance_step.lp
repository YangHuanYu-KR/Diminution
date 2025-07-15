#program step(t).

goal(sit_in_chair(C), t) :- subtask(sit_in_chair(C)), subtask(sit_in_chair(C), walk(O1_1), 1), goal(subtask(sit_in_chair(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(sit_in_chair(C), find(O2_1), 2), goal(subtask(sit_in_chair(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(sit_in_chair(C), sit(O3_1), 3), goal(subtask(sit_in_chair(C), sit(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(sit_in_chair(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(sit_in_chair(C), walk(O), 1).
goal(subtask(sit_in_chair(C), find(O), 2), t) :- goal(C, find(O), t), subtask(sit_in_chair(C), find(O), 2).
goal(subtask(sit_in_chair(C), sit(O), 3), t) :- goal(C, sit(O), t), subtask(sit_in_chair(C), sit(O), 3).
