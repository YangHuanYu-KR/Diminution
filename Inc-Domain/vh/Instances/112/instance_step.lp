#program step(t).

goal(watch_fly(C), t) :- subtask(watch_fly(C)), subtask(watch_fly(C), sit(O1_1), 1), goal(subtask(watch_fly(C), sit(O1_1), 1), T0), T0 <= T1, time(T0), subtask(watch_fly(C), watch(O2_1), 2), goal(subtask(watch_fly(C), watch(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(watch_fly(C), sit(O), 1), t) :- goal(C, sit(O), t), subtask(watch_fly(C), sit(O), 1).
goal(subtask(watch_fly(C), watch(O), 2), t) :- goal(C, watch(O), t), subtask(watch_fly(C), watch(O), 2).
