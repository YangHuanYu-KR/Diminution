#program step(t).

goal(get_ready_for_school(C), t) :- subtask(get_ready_for_school(C)), subtask(get_ready_for_school(C), find(O1_1), 1), goal(subtask(get_ready_for_school(C), find(O1_1), 1), T0), T0 <= T1, time(T0), subtask(get_ready_for_school(C), open(O2_1), 2), goal(subtask(get_ready_for_school(C), open(O2_1), 2), T1), T1 <= T2, time(T1), subtask(get_ready_for_school(C), close(O3_1), 3), goal(subtask(get_ready_for_school(C), close(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(get_ready_for_school(C), find(O), 1), t) :- goal(C, find(O), t), subtask(get_ready_for_school(C), find(O), 1).
goal(subtask(get_ready_for_school(C), open(O), 2), t) :- goal(C, open(O), t), subtask(get_ready_for_school(C), open(O), 2).
goal(subtask(get_ready_for_school(C), close(O), 3), t) :- goal(C, close(O), t), subtask(get_ready_for_school(C), close(O), 3).
