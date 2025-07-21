#program step(t).

goal(eat(C), T0, t, 1) :- subtask(eat(C)), subtask(eat(C), find(O1_1), 1), goal(subtask(eat(C), find(O1_1), 1), T0), T0 <= T1, time(T0), subtask(eat(C), grab(O2_1), 2), goal(subtask(eat(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(eat(C), find(O3_1), 3), goal(subtask(eat(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(eat(C), T3, t, 2) :- subtask(eat(C), grab(O4_1), 4), goal(subtask(eat(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(eat(C), eat(O5_1), 5), goal(subtask(eat(C), eat(O5_1), 5), T4), T4 <= t, time(T4).
goal(eat(C), t) :- goal(eat(C), T0, T2, 1), goal(eat(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(eat(C), find(O), 1), t) :- goal(C, find(O), t), subtask(eat(C), find(O), 1).
goal(subtask(eat(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(eat(C), grab(O), 2).
goal(subtask(eat(C), find(O), 3), t) :- goal(C, find(O), t), subtask(eat(C), find(O), 3).
goal(subtask(eat(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(eat(C), grab(O), 4).
goal(subtask(eat(C), eat(O), 5), t) :- goal(C, eat(O), t), subtask(eat(C), eat(O), 5).
