#program step(t).

goal(organize_closet(C), t) :- subtask(organize_closet(C)), subtask(organize_closet(C), walk(O1_1), 1), goal(subtask(organize_closet(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(organize_closet(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(organize_closet(C), walk(O), 1).
