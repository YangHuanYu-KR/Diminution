#program step(t).

goal(watch__horror__movie(C), t) :- subtask(watch__horror__movie(C)), subtask(watch__horror__movie(C), walk(O1_1), 1), goal(subtask(watch__horror__movie(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(watch__horror__movie(C), find(O2_1), 2), goal(subtask(watch__horror__movie(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(watch__horror__movie(C), watch(O3_1), 3), goal(subtask(watch__horror__movie(C), watch(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(watch__horror__movie(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(watch__horror__movie(C), walk(O), 1).
goal(subtask(watch__horror__movie(C), find(O), 2), t) :- goal(C, find(O), t), subtask(watch__horror__movie(C), find(O), 2).
goal(subtask(watch__horror__movie(C), watch(O), 3), t) :- goal(C, watch(O), t), subtask(watch__horror__movie(C), watch(O), 3).
