#program step(t).

goal(check_appearance_in_mirror(C), t) :- subtask(check_appearance_in_mirror(C)), subtask(check_appearance_in_mirror(C), walk(O1_1), 1), goal(subtask(check_appearance_in_mirror(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(check_appearance_in_mirror(C), find(O2_1), 2), goal(subtask(check_appearance_in_mirror(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(check_appearance_in_mirror(C), lookat(O3_1), 3), goal(subtask(check_appearance_in_mirror(C), lookat(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(check_appearance_in_mirror(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(check_appearance_in_mirror(C), walk(O), 1).
goal(subtask(check_appearance_in_mirror(C), find(O), 2), t) :- goal(C, find(O), t), subtask(check_appearance_in_mirror(C), find(O), 2).
goal(subtask(check_appearance_in_mirror(C), lookat(O), 3), t) :- goal(C, lookat(O), t), subtask(check_appearance_in_mirror(C), lookat(O), 3).
