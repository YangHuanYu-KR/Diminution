#program step(t).

goal(clean_toilet(C), t) :- subtask(clean_toilet(C)), subtask(clean_toilet(C), walk(O1_1), 1), goal(subtask(clean_toilet(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(clean_toilet(C), find(O2_1), 2), goal(subtask(clean_toilet(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(clean_toilet(C), wash(O3_1), 3), goal(subtask(clean_toilet(C), wash(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(clean_toilet(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(clean_toilet(C), walk(O), 1).
goal(subtask(clean_toilet(C), find(O), 2), t) :- goal(C, find(O), t), subtask(clean_toilet(C), find(O), 2).
goal(subtask(clean_toilet(C), wash(O), 3), t) :- goal(C, wash(O), t), subtask(clean_toilet(C), wash(O), 3).
