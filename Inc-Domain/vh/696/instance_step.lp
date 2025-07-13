#program step(t).

goal(push_all_chairs_in(C), t) :- subtask(push_all_chairs_in(C)), subtask(push_all_chairs_in(C), find(O1_1), 1), goal(subtask(push_all_chairs_in(C), find(O1_1), 1), T0), T0 <= T1, time(T0), subtask(push_all_chairs_in(C), open(O2_1), 2), goal(subtask(push_all_chairs_in(C), open(O2_1), 2), T1), T1 <= T2, time(T1), subtask(push_all_chairs_in(C), close(O3_1), 3), goal(subtask(push_all_chairs_in(C), close(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(push_all_chairs_in(C), find(O), 1), t) :- goal(C, find(O), t), subtask(push_all_chairs_in(C), find(O), 1).
goal(subtask(push_all_chairs_in(C), open(O), 2), t) :- goal(C, open(O), t), subtask(push_all_chairs_in(C), open(O), 2).
goal(subtask(push_all_chairs_in(C), close(O), 3), t) :- goal(C, close(O), t), subtask(push_all_chairs_in(C), close(O), 3).
