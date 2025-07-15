#program step(t).

goal(de-wrinkle_sheet(C), T0, t, 1) :- subtask(de-wrinkle_sheet(C)), subtask(de-wrinkle_sheet(C), walk(O1_1), 1), goal(subtask(de-wrinkle_sheet(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(de-wrinkle_sheet(C), grab(O2_1), 2), goal(subtask(de-wrinkle_sheet(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(de-wrinkle_sheet(C), touch(O3_1), 3), goal(subtask(de-wrinkle_sheet(C), touch(O3_1), 3), T2), T2 <= t, time(T2).
goal(de-wrinkle_sheet(C), T3, t, 2) :- subtask(de-wrinkle_sheet(C), standup, 4), goal(subtask(de-wrinkle_sheet(C), standup, 4), T3), T3 <= t, time(T3).
goal(de-wrinkle_sheet(C), t) :- goal(de-wrinkle_sheet(C), T0, T2, 1), goal(de-wrinkle_sheet(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(de-wrinkle_sheet(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(de-wrinkle_sheet(C), walk(O), 1).
goal(subtask(de-wrinkle_sheet(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(de-wrinkle_sheet(C), grab(O), 2).
goal(subtask(de-wrinkle_sheet(C), touch(O), 3), t) :- goal(C, touch(O), t), subtask(de-wrinkle_sheet(C), touch(O), 3).
goal(subtask(de-wrinkle_sheet(C), standup, 4), t) :- goal(C, standup, t), subtask(de-wrinkle_sheet(C), standup, 4).
