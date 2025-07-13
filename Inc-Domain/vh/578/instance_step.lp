#program step(t).

goal(watch_tv(C), t) :- subtask(watch_tv(C)), subtask(watch_tv(C), walk(O1_1), 1), goal(subtask(watch_tv(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(watch_tv(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(watch_tv(C), walk(O), 1).
