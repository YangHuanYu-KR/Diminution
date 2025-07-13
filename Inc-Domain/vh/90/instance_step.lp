#program step(t).

goal(hang_up_jacket(C), T0, t, 1) :- subtask(hang_up_jacket(C)), subtask(hang_up_jacket(C), walk(O1_1), 1), goal(subtask(hang_up_jacket(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(hang_up_jacket(C), find(O2_1), 2), goal(subtask(hang_up_jacket(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(hang_up_jacket(C), grab(O3_1), 3), goal(subtask(hang_up_jacket(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(hang_up_jacket(C), T3, t, 2) :- subtask(hang_up_jacket(C), find(O4_1), 4), goal(subtask(hang_up_jacket(C), find(O4_1), 4), T3), T3 <= T4, time(T3), subtask(hang_up_jacket(C), putin(O5_1, O5_2), 5), goal(subtask(hang_up_jacket(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(hang_up_jacket(C), touch(O6_1), 6), goal(subtask(hang_up_jacket(C), touch(O6_1), 6), T5), T5 <= t, time(T5).
goal(hang_up_jacket(C), t) :- goal(hang_up_jacket(C), T0, T2, 1), goal(hang_up_jacket(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(hang_up_jacket(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(hang_up_jacket(C), walk(O), 1).
goal(subtask(hang_up_jacket(C), find(O), 2), t) :- goal(C, find(O), t), subtask(hang_up_jacket(C), find(O), 2).
goal(subtask(hang_up_jacket(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(hang_up_jacket(C), grab(O), 3).
goal(subtask(hang_up_jacket(C), find(O), 4), t) :- goal(C, find(O), t), subtask(hang_up_jacket(C), find(O), 4).
goal(subtask(hang_up_jacket(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(hang_up_jacket(C), putin(O1, O2), 5).
goal(subtask(hang_up_jacket(C), touch(O), 6), t) :- goal(C, touch(O), t), subtask(hang_up_jacket(C), touch(O), 6).
