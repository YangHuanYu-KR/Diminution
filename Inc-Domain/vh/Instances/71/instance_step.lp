#program step(t).

goal(wake_kids_up(C), T0, t, 1) :- subtask(wake_kids_up(C)), subtask(wake_kids_up(C), walk(O1_1), 1), goal(subtask(wake_kids_up(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(wake_kids_up(C), walk(O2_1), 2), goal(subtask(wake_kids_up(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(wake_kids_up(C), touch(O3_1), 3), goal(subtask(wake_kids_up(C), touch(O3_1), 3), T2), T2 <= t, time(T2).
goal(wake_kids_up(C), T3, t, 2) :- subtask(wake_kids_up(C), switchon(O4_1), 4), goal(subtask(wake_kids_up(C), switchon(O4_1), 4), T3), T3 <= t, time(T3).
goal(wake_kids_up(C), t) :- goal(wake_kids_up(C), T0, T2, 1), goal(wake_kids_up(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(wake_kids_up(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(wake_kids_up(C), walk(O), 1).
goal(subtask(wake_kids_up(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(wake_kids_up(C), walk(O), 2).
goal(subtask(wake_kids_up(C), touch(O), 3), t) :- goal(C, touch(O), t), subtask(wake_kids_up(C), touch(O), 3).
goal(subtask(wake_kids_up(C), switchon(O), 4), t) :- goal(C, switchon(O), t), subtask(wake_kids_up(C), switchon(O), 4).
