#program step(t).

goal(grab_things(C), T0, t, 1) :- subtask(grab_things(C)), subtask(grab_things(C), grab(O1_1), 1), goal(subtask(grab_things(C), grab(O1_1), 1), T0), T0 <= T1, time(T0), subtask(grab_things(C), grab(O2_1), 2), goal(subtask(grab_things(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(grab_things(C), grab(O3_1), 3), goal(subtask(grab_things(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(grab_things(C), T3, t, 2) :- subtask(grab_things(C), grab(O4_1), 4), goal(subtask(grab_things(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(grab_things(C), grab(O5_1), 5), goal(subtask(grab_things(C), grab(O5_1), 5), T4), T4 <= T5, time(T4), subtask(grab_things(C), grab(O6_1), 6), goal(subtask(grab_things(C), grab(O6_1), 6), T5), T5 <= t, time(T5).
goal(grab_things(C), t) :- goal(grab_things(C), T0, T2, 1), goal(grab_things(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(grab_things(C), grab(O), 1), t) :- goal(C, grab(O), t), subtask(grab_things(C), grab(O), 1).
goal(subtask(grab_things(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(grab_things(C), grab(O), 2).
goal(subtask(grab_things(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(grab_things(C), grab(O), 3).
goal(subtask(grab_things(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(grab_things(C), grab(O), 4).
goal(subtask(grab_things(C), grab(O), 5), t) :- goal(C, grab(O), t), subtask(grab_things(C), grab(O), 5).
goal(subtask(grab_things(C), grab(O), 6), t) :- goal(C, grab(O), t), subtask(grab_things(C), grab(O), 6).
