#program step(t).

goal(sew(C), t) :- subtask(sew(C)), subtask(sew(C), walk(O1_1), 1), goal(subtask(sew(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(sew(C), walk(O2_1), 2), goal(subtask(sew(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(sew(C), switchon(O3_1), 3), goal(subtask(sew(C), switchon(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(sew(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(sew(C), walk(O), 1).
goal(subtask(sew(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(sew(C), walk(O), 2).
goal(subtask(sew(C), switchon(O), 3), t) :- goal(C, switchon(O), t), subtask(sew(C), switchon(O), 3).
