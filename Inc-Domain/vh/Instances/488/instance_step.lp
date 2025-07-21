#program step(t).

goal(grab_things(C), T0, t, 1) :- subtask(grab_things(C)), subtask(grab_things(C), walk(O1_1), 1), goal(subtask(grab_things(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(grab_things(C), find(O2_1), 2), goal(subtask(grab_things(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(grab_things(C), open(O3_1), 3), goal(subtask(grab_things(C), open(O3_1), 3), T2), T2 <= t, time(T2).
goal(grab_things(C), T3, t, 2) :- subtask(grab_things(C), walk(O4_1), 4), goal(subtask(grab_things(C), walk(O4_1), 4), T3), T3 <= t, time(T3).
goal(grab_things(C), t) :- goal(grab_things(C), T0, T2, 1), goal(grab_things(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(grab_things(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(grab_things(C), walk(O), 1).
goal(subtask(grab_things(C), find(O), 2), t) :- goal(C, find(O), t), subtask(grab_things(C), find(O), 2).
goal(subtask(grab_things(C), open(O), 3), t) :- goal(C, open(O), t), subtask(grab_things(C), open(O), 3).
goal(subtask(grab_things(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(grab_things(C), walk(O), 4).
