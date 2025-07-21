#program step(t).

goal(wipe_down_baseboards_please(C), T0, t, 1) :- subtask(wipe_down_baseboards_please(C)), subtask(wipe_down_baseboards_please(C), walk(O1_1), 1), goal(subtask(wipe_down_baseboards_please(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(wipe_down_baseboards_please(C), touch(O2_1), 2), goal(subtask(wipe_down_baseboards_please(C), touch(O2_1), 2), T1), T1 <= T2, time(T1), subtask(wipe_down_baseboards_please(C), find(O3_1), 3), goal(subtask(wipe_down_baseboards_please(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(wipe_down_baseboards_please(C), T3, t, 2) :- subtask(wipe_down_baseboards_please(C), wash(O4_1), 4), goal(subtask(wipe_down_baseboards_please(C), wash(O4_1), 4), T3), T3 <= t, time(T3).
goal(wipe_down_baseboards_please(C), t) :- goal(wipe_down_baseboards_please(C), T0, T2, 1), goal(wipe_down_baseboards_please(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(wipe_down_baseboards_please(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(wipe_down_baseboards_please(C), walk(O), 1).
goal(subtask(wipe_down_baseboards_please(C), touch(O), 2), t) :- goal(C, touch(O), t), subtask(wipe_down_baseboards_please(C), touch(O), 2).
goal(subtask(wipe_down_baseboards_please(C), find(O), 3), t) :- goal(C, find(O), t), subtask(wipe_down_baseboards_please(C), find(O), 3).
goal(subtask(wipe_down_baseboards_please(C), wash(O), 4), t) :- goal(C, wash(O), t), subtask(wipe_down_baseboards_please(C), wash(O), 4).
