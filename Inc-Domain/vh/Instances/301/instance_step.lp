#program step(t).

goal(sew(C), T0, t, 1) :- subtask(sew(C)), subtask(sew(C), walk(O1_1), 1), goal(subtask(sew(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(sew(C), grab(O2_1), 2), goal(subtask(sew(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(sew(C), walk(O3_1), 3), goal(subtask(sew(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(sew(C), T3, t, 2) :- subtask(sew(C), sit(O4_1), 4), goal(subtask(sew(C), sit(O4_1), 4), T3), T3 <= T4, time(T3), subtask(sew(C), touch(O5_1), 5), goal(subtask(sew(C), touch(O5_1), 5), T4), T4 <= t, time(T4).
goal(sew(C), t) :- goal(sew(C), T0, T2, 1), goal(sew(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(sew(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(sew(C), walk(O), 1).
goal(subtask(sew(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(sew(C), grab(O), 2).
goal(subtask(sew(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(sew(C), walk(O), 3).
goal(subtask(sew(C), sit(O), 4), t) :- goal(C, sit(O), t), subtask(sew(C), sit(O), 4).
goal(subtask(sew(C), touch(O), 5), t) :- goal(C, touch(O), t), subtask(sew(C), touch(O), 5).
