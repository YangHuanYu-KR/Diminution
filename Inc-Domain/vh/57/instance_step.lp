#program step(t).

goal(browse_internet(C), T0, t, 1) :- subtask(browse_internet(C)), subtask(browse_internet(C), walk(O1_1), 1), goal(subtask(browse_internet(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(browse_internet(C), sit(O2_1), 2), goal(subtask(browse_internet(C), sit(O2_1), 2), T1), T1 <= T2, time(T1), subtask(browse_internet(C), lookat(O3_1), 3), goal(subtask(browse_internet(C), lookat(O3_1), 3), T2), T2 <= t, time(T2).
goal(browse_internet(C), T3, t, 2) :- subtask(browse_internet(C), touch(O4_1), 4), goal(subtask(browse_internet(C), touch(O4_1), 4), T3), T3 <= T4, time(T3), subtask(browse_internet(C), switchon(O5_1), 5), goal(subtask(browse_internet(C), switchon(O5_1), 5), T4), T4 <= t, time(T4).
goal(browse_internet(C), t) :- goal(browse_internet(C), T0, T2, 1), goal(browse_internet(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(browse_internet(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(browse_internet(C), walk(O), 1).
goal(subtask(browse_internet(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(browse_internet(C), sit(O), 2).
goal(subtask(browse_internet(C), lookat(O), 3), t) :- goal(C, lookat(O), t), subtask(browse_internet(C), lookat(O), 3).
goal(subtask(browse_internet(C), touch(O), 4), t) :- goal(C, touch(O), t), subtask(browse_internet(C), touch(O), 4).
goal(subtask(browse_internet(C), switchon(O), 5), t) :- goal(C, switchon(O), t), subtask(browse_internet(C), switchon(O), 5).
