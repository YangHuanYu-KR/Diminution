#program step(t).

goal(sleep(C), t) :- subtask(sleep(C)), subtask(sleep(C), walk(O1_1), 1), goal(subtask(sleep(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(sleep(C), walk(O2_1), 2), goal(subtask(sleep(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(sleep(C), lie(O3_1), 3), goal(subtask(sleep(C), lie(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(sleep(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(sleep(C), walk(O), 1).
goal(subtask(sleep(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(sleep(C), walk(O), 2).
goal(subtask(sleep(C), lie(O), 3), t) :- goal(C, lie(O), t), subtask(sleep(C), lie(O), 3).
