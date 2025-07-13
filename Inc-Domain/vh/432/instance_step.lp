#program step(t).

goal(sit_in_chair(C), t) :- subtask(sit_in_chair(C)), subtask(sit_in_chair(C), walk(O1_1), 1), goal(subtask(sit_in_chair(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(sit_in_chair(C), sit(O2_1), 2), goal(subtask(sit_in_chair(C), sit(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(sit_in_chair(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(sit_in_chair(C), walk(O), 1).
goal(subtask(sit_in_chair(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(sit_in_chair(C), sit(O), 2).
