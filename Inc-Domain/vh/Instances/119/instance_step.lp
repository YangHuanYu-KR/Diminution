#program step(t).

goal(entertain(C), T0, t, 1) :- subtask(entertain(C)), subtask(entertain(C), walk(O1_1), 1), goal(subtask(entertain(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(entertain(C), watch(O2_1), 2), goal(subtask(entertain(C), watch(O2_1), 2), T1), T1 <= T2, time(T1), subtask(entertain(C), eat(O3_1), 3), goal(subtask(entertain(C), eat(O3_1), 3), T2), T2 <= t, time(T2).
goal(entertain(C), T3, t, 2) :- subtask(entertain(C), read(O4_1), 4), goal(subtask(entertain(C), read(O4_1), 4), T3), T3 <= t, time(T3).
goal(entertain(C), t) :- goal(entertain(C), T0, T2, 1), goal(entertain(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(entertain(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(entertain(C), walk(O), 1).
goal(subtask(entertain(C), watch(O), 2), t) :- goal(C, watch(O), t), subtask(entertain(C), watch(O), 2).
goal(subtask(entertain(C), eat(O), 3), t) :- goal(C, eat(O), t), subtask(entertain(C), eat(O), 3).
goal(subtask(entertain(C), read(O), 4), t) :- goal(C, read(O), t), subtask(entertain(C), read(O), 4).
