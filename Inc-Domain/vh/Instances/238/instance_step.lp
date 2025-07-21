#program step(t).

goal(lock_door(C), t) :- subtask(lock_door(C)), subtask(lock_door(C), walk(O1_1), 1), goal(subtask(lock_door(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(lock_door(C), touch(O2_1), 2), goal(subtask(lock_door(C), touch(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(lock_door(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(lock_door(C), walk(O), 1).
goal(subtask(lock_door(C), touch(O), 2), t) :- goal(C, touch(O), t), subtask(lock_door(C), touch(O), 2).
