#program step(t).

goal(relax(C), T0, t, 1) :- subtask(relax(C)), subtask(relax(C), walk(O1_1), 1), goal(subtask(relax(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(relax(C), lie(O2_1), 2), goal(subtask(relax(C), lie(O2_1), 2), T1), T1 <= T2, time(T1), subtask(relax(C), walk(O3_1), 3), goal(subtask(relax(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(relax(C), T3, t, 2) :- subtask(relax(C), switchon(O4_1), 4), goal(subtask(relax(C), switchon(O4_1), 4), T3), T3 <= T4, time(T3), subtask(relax(C), watch(O5_1), 5), goal(subtask(relax(C), watch(O5_1), 5), T4), T4 <= t, time(T4).
goal(relax(C), t) :- goal(relax(C), T0, T2, 1), goal(relax(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(relax(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(relax(C), walk(O), 1).
goal(subtask(relax(C), lie(O), 2), t) :- goal(C, lie(O), t), subtask(relax(C), lie(O), 2).
goal(subtask(relax(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(relax(C), walk(O), 3).
goal(subtask(relax(C), switchon(O), 4), t) :- goal(C, switchon(O), t), subtask(relax(C), switchon(O), 4).
goal(subtask(relax(C), watch(O), 5), t) :- goal(C, watch(O), t), subtask(relax(C), watch(O), 5).
