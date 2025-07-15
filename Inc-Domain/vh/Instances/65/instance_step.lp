#program step(t).

goal(clean_screen(C), t) :- subtask(clean_screen(C)), subtask(clean_screen(C), grab(O1_1), 1), goal(subtask(clean_screen(C), grab(O1_1), 1), T0), T0 <= T1, time(T0), subtask(clean_screen(C), find(O2_1), 2), goal(subtask(clean_screen(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(clean_screen(C), touch(O3_1), 3), goal(subtask(clean_screen(C), touch(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(clean_screen(C), grab(O), 1), t) :- goal(C, grab(O), t), subtask(clean_screen(C), grab(O), 1).
goal(subtask(clean_screen(C), find(O), 2), t) :- goal(C, find(O), t), subtask(clean_screen(C), find(O), 2).
goal(subtask(clean_screen(C), touch(O), 3), t) :- goal(C, touch(O), t), subtask(clean_screen(C), touch(O), 3).
