#program step(t).

goal(play_on_laptop(C), t) :- subtask(play_on_laptop(C)), subtask(play_on_laptop(C), walk(O1_1), 1), goal(subtask(play_on_laptop(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(play_on_laptop(C), walk(O2_1), 2), goal(subtask(play_on_laptop(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(play_on_laptop(C), touch(O3_1), 3), goal(subtask(play_on_laptop(C), touch(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(play_on_laptop(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(play_on_laptop(C), walk(O), 1).
goal(subtask(play_on_laptop(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(play_on_laptop(C), walk(O), 2).
goal(subtask(play_on_laptop(C), touch(O), 3), t) :- goal(C, touch(O), t), subtask(play_on_laptop(C), touch(O), 3).
