#program step(t).

goal(use_toilet(C), t) :- subtask(use_toilet(C)), subtask(use_toilet(C), walk(O1_1), 1), goal(subtask(use_toilet(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(use_toilet(C), walk(O2_1), 2), goal(subtask(use_toilet(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(use_toilet(C), plugin(O3_1), 3), goal(subtask(use_toilet(C), plugin(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(use_toilet(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(use_toilet(C), walk(O), 1).
goal(subtask(use_toilet(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(use_toilet(C), walk(O), 2).
goal(subtask(use_toilet(C), plugin(O), 3), t) :- goal(C, plugin(O), t), subtask(use_toilet(C), plugin(O), 3).
