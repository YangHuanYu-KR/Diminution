#program step(t).

goal(clean_bathroom(C), T0, t, 1) :- subtask(clean_bathroom(C)), subtask(clean_bathroom(C), walk(O1_1), 1), goal(subtask(clean_bathroom(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(clean_bathroom(C), grab(O2_1), 2), goal(subtask(clean_bathroom(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(clean_bathroom(C), switchon(O3_1), 3), goal(subtask(clean_bathroom(C), switchon(O3_1), 3), T2), T2 <= t, time(T2).
goal(clean_bathroom(C), T3, t, 2) :- subtask(clean_bathroom(C), putin(O4_1, O4_2), 4), goal(subtask(clean_bathroom(C), putin(O4_1, O4_2), 4), T3), T3 <= t, time(T3).
goal(clean_bathroom(C), t) :- goal(clean_bathroom(C), T0, T2, 1), goal(clean_bathroom(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(clean_bathroom(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(clean_bathroom(C), walk(O), 1).
goal(subtask(clean_bathroom(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(clean_bathroom(C), grab(O), 2).
goal(subtask(clean_bathroom(C), switchon(O), 3), t) :- goal(C, switchon(O), t), subtask(clean_bathroom(C), switchon(O), 3).
goal(subtask(clean_bathroom(C), putin(O1, O2), 4), t) :- goal(C, putin(O1, O2), t), subtask(clean_bathroom(C), putin(O1, O2), 4).
