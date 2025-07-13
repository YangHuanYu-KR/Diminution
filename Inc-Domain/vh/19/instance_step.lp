#program step(t).

goal(lock_door(C), T0, t, 1) :- subtask(lock_door(C)), subtask(lock_door(C), walk(O1_1), 1), goal(subtask(lock_door(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(lock_door(C), find(O2_1), 2), goal(subtask(lock_door(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(lock_door(C), close(O3_1), 3), goal(subtask(lock_door(C), close(O3_1), 3), T2), T2 <= t, time(T2).
goal(lock_door(C), T3, t, 2) :- subtask(lock_door(C), turnto(O4_1), 4), goal(subtask(lock_door(C), turnto(O4_1), 4), T3), T3 <= t, time(T3).
goal(lock_door(C), t) :- goal(lock_door(C), T0, T2, 1), goal(lock_door(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(lock_door(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(lock_door(C), walk(O), 1).
goal(subtask(lock_door(C), find(O), 2), t) :- goal(C, find(O), t), subtask(lock_door(C), find(O), 2).
goal(subtask(lock_door(C), close(O), 3), t) :- goal(C, close(O), t), subtask(lock_door(C), close(O), 3).
goal(subtask(lock_door(C), turnto(O), 4), t) :- goal(C, turnto(O), t), subtask(lock_door(C), turnto(O), 4).
