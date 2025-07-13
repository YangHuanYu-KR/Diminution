#program step(t).

goal(find_dictionary(C), t) :- subtask(find_dictionary(C)), subtask(find_dictionary(C), walk(O1_1), 1), goal(subtask(find_dictionary(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(find_dictionary(C), open(O2_1), 2), goal(subtask(find_dictionary(C), open(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(find_dictionary(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(find_dictionary(C), walk(O), 1).
goal(subtask(find_dictionary(C), open(O), 2), t) :- goal(C, open(O), t), subtask(find_dictionary(C), open(O), 2).
