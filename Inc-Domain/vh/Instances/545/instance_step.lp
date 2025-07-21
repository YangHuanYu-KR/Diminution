#program step(t).

goal(try_yourself_off(C), t) :- subtask(try_yourself_off(C)), subtask(try_yourself_off(C), walk(O1_1), 1), goal(subtask(try_yourself_off(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(try_yourself_off(C), walk(O2_1), 2), goal(subtask(try_yourself_off(C), walk(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(try_yourself_off(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(try_yourself_off(C), walk(O), 1).
goal(subtask(try_yourself_off(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(try_yourself_off(C), walk(O), 2).
