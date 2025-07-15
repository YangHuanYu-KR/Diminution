#program step(t).

goal(try_yourself_off(C), T0, t, 1) :- subtask(try_yourself_off(C)), subtask(try_yourself_off(C), walk(O1_1), 1), goal(subtask(try_yourself_off(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(try_yourself_off(C), find(O2_1), 2), goal(subtask(try_yourself_off(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(try_yourself_off(C), touch(O3_1), 3), goal(subtask(try_yourself_off(C), touch(O3_1), 3), T2), T2 <= t, time(T2).
goal(try_yourself_off(C), T3, t, 2) :- subtask(try_yourself_off(C), wash(O4_1), 4), goal(subtask(try_yourself_off(C), wash(O4_1), 4), T3), T3 <= T4, time(T3), subtask(try_yourself_off(C), touch(O5_1), 5), goal(subtask(try_yourself_off(C), touch(O5_1), 5), T4), T4 <= t, time(T4).
goal(try_yourself_off(C), t) :- goal(try_yourself_off(C), T0, T2, 1), goal(try_yourself_off(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(try_yourself_off(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(try_yourself_off(C), walk(O), 1).
goal(subtask(try_yourself_off(C), find(O), 2), t) :- goal(C, find(O), t), subtask(try_yourself_off(C), find(O), 2).
goal(subtask(try_yourself_off(C), touch(O), 3), t) :- goal(C, touch(O), t), subtask(try_yourself_off(C), touch(O), 3).
goal(subtask(try_yourself_off(C), wash(O), 4), t) :- goal(C, wash(O), t), subtask(try_yourself_off(C), wash(O), 4).
goal(subtask(try_yourself_off(C), touch(O), 5), t) :- goal(C, touch(O), t), subtask(try_yourself_off(C), touch(O), 5).
