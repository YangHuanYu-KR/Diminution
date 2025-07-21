#program step(t).

goal(go_to_toilet(C), T0, t, 1) :- subtask(go_to_toilet(C)), subtask(go_to_toilet(C), walk(O1_1), 1), goal(subtask(go_to_toilet(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(go_to_toilet(C), find(O2_1), 2), goal(subtask(go_to_toilet(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(go_to_toilet(C), open(O3_1), 3), goal(subtask(go_to_toilet(C), open(O3_1), 3), T2), T2 <= t, time(T2).
goal(go_to_toilet(C), T3, t, 2) :- subtask(go_to_toilet(C), close(O4_1), 4), goal(subtask(go_to_toilet(C), close(O4_1), 4), T3), T3 <= t, time(T3).
goal(go_to_toilet(C), t) :- goal(go_to_toilet(C), T0, T2, 1), goal(go_to_toilet(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(go_to_toilet(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(go_to_toilet(C), walk(O), 1).
goal(subtask(go_to_toilet(C), find(O), 2), t) :- goal(C, find(O), t), subtask(go_to_toilet(C), find(O), 2).
goal(subtask(go_to_toilet(C), open(O), 3), t) :- goal(C, open(O), t), subtask(go_to_toilet(C), open(O), 3).
goal(subtask(go_to_toilet(C), close(O), 4), t) :- goal(C, close(O), t), subtask(go_to_toilet(C), close(O), 4).
