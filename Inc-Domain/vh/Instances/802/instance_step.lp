#program step(t).

goal(hang_pictures(C), t) :- subtask(hang_pictures(C)), subtask(hang_pictures(C), walk(O1_1), 1), goal(subtask(hang_pictures(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(hang_pictures(C), walk(O2_1), 2), goal(subtask(hang_pictures(C), walk(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(hang_pictures(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(hang_pictures(C), walk(O), 1).
goal(subtask(hang_pictures(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(hang_pictures(C), walk(O), 2).
