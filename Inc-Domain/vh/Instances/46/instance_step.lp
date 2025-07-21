#program step(t).

goal(take_shower(C), T0, t, 1) :- subtask(take_shower(C)), subtask(take_shower(C), walk(O1_1), 1), goal(subtask(take_shower(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(take_shower(C), find(O2_1), 2), goal(subtask(take_shower(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(take_shower(C), switchon(O3_1), 3), goal(subtask(take_shower(C), switchon(O3_1), 3), T2), T2 <= t, time(T2).
goal(take_shower(C), T3, t, 2) :- subtask(take_shower(C), touch(O4_1), 4), goal(subtask(take_shower(C), touch(O4_1), 4), T3), T3 <= T4, time(T3), subtask(take_shower(C), wash(O5_1), 5), goal(subtask(take_shower(C), wash(O5_1), 5), T4), T4 <= t, time(T4).
goal(take_shower(C), t) :- goal(take_shower(C), T0, T2, 1), goal(take_shower(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(take_shower(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(take_shower(C), walk(O), 1).
goal(subtask(take_shower(C), find(O), 2), t) :- goal(C, find(O), t), subtask(take_shower(C), find(O), 2).
goal(subtask(take_shower(C), switchon(O), 3), t) :- goal(C, switchon(O), t), subtask(take_shower(C), switchon(O), 3).
goal(subtask(take_shower(C), touch(O), 4), t) :- goal(C, touch(O), t), subtask(take_shower(C), touch(O), 4).
goal(subtask(take_shower(C), wash(O), 5), t) :- goal(C, wash(O), t), subtask(take_shower(C), wash(O), 5).
