#program step(t).

goal(use_toilet(C), t) :- subtask(use_toilet(C)), subtask(use_toilet(C), walk(O1_1), 1), goal(subtask(use_toilet(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(use_toilet(C), touch(O2_1), 2), goal(subtask(use_toilet(C), touch(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(use_toilet(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(use_toilet(C), walk(O), 1).
goal(subtask(use_toilet(C), touch(O), 2), t) :- goal(C, touch(O), t), subtask(use_toilet(C), touch(O), 2).
