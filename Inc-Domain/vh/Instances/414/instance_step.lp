#program step(t).

goal(try_yourself_off(C), T0, t, 1) :- subtask(try_yourself_off(C)), subtask(try_yourself_off(C), walk(O1_1), 1), goal(subtask(try_yourself_off(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(try_yourself_off(C), grab(O2_1), 2), goal(subtask(try_yourself_off(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(try_yourself_off(C), walk(O3_1), 3), goal(subtask(try_yourself_off(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(try_yourself_off(C), T3, t, 2) :- subtask(try_yourself_off(C), touch(O4_1), 4), goal(subtask(try_yourself_off(C), touch(O4_1), 4), T3), T3 <= T4, time(T3), subtask(try_yourself_off(C), touch(O5_1), 5), goal(subtask(try_yourself_off(C), touch(O5_1), 5), T4), T4 <= T5, time(T4), subtask(try_yourself_off(C), touch(O6_1), 6), goal(subtask(try_yourself_off(C), touch(O6_1), 6), T5), T5 <= t, time(T5).
goal(try_yourself_off(C), T0, t, 3) :- goal(try_yourself_off(C), T0, T2, 1), goal(try_yourself_off(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(try_yourself_off(C), T6, t, 4) :- subtask(try_yourself_off(C), putback(O7_1, O7_2), 7), goal(subtask(try_yourself_off(C), putback(O7_1, O7_2), 7), T6), T6 <= t, time(T6).
goal(try_yourself_off(C), t) :- goal(try_yourself_off(C), T0, T5, 3), goal(try_yourself_off(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(try_yourself_off(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(try_yourself_off(C), walk(O), 1).
goal(subtask(try_yourself_off(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(try_yourself_off(C), grab(O), 2).
goal(subtask(try_yourself_off(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(try_yourself_off(C), walk(O), 3).
goal(subtask(try_yourself_off(C), touch(O), 4), t) :- goal(C, touch(O), t), subtask(try_yourself_off(C), touch(O), 4).
goal(subtask(try_yourself_off(C), touch(O), 5), t) :- goal(C, touch(O), t), subtask(try_yourself_off(C), touch(O), 5).
goal(subtask(try_yourself_off(C), touch(O), 6), t) :- goal(C, touch(O), t), subtask(try_yourself_off(C), touch(O), 6).
goal(subtask(try_yourself_off(C), putback(O1, O2), 7), t) :- goal(C, putback(O1, O2), t), subtask(try_yourself_off(C), putback(O1, O2), 7).
