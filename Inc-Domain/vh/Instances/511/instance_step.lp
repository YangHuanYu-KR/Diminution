#program step(t).

goal(breakfast(C), t) :- subtask(breakfast(C)), subtask(breakfast(C), walk(O1_1), 1), goal(subtask(breakfast(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(breakfast(C), switchon(O2_1), 2), goal(subtask(breakfast(C), switchon(O2_1), 2), T1), T1 <= T2, time(T1), subtask(breakfast(C), plugin(O3_1), 3), goal(subtask(breakfast(C), plugin(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(breakfast(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(breakfast(C), walk(O), 1).
goal(subtask(breakfast(C), switchon(O), 2), t) :- goal(C, switchon(O), t), subtask(breakfast(C), switchon(O), 2).
goal(subtask(breakfast(C), plugin(O), 3), t) :- goal(C, plugin(O), t), subtask(breakfast(C), plugin(O), 3).
