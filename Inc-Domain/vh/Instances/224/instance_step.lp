#program step(t).

goal(find_dictionary(C), t) :- subtask(find_dictionary(C)), subtask(find_dictionary(C), walk(O1_1), 1), goal(subtask(find_dictionary(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(find_dictionary(C), lookat(O2_1), 2), goal(subtask(find_dictionary(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(find_dictionary(C), grab(O3_1), 3), goal(subtask(find_dictionary(C), grab(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(find_dictionary(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(find_dictionary(C), walk(O), 1).
goal(subtask(find_dictionary(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(find_dictionary(C), lookat(O), 2).
goal(subtask(find_dictionary(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(find_dictionary(C), grab(O), 3).
