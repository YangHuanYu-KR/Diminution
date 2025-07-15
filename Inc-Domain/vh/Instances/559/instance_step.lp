#program step(t).

goal(watch__horror__movie(C), t) :- subtask(watch__horror__movie(C)), subtask(watch__horror__movie(C), walk(O1_1), 1), goal(subtask(watch__horror__movie(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(watch__horror__movie(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(watch__horror__movie(C), walk(O), 1).
