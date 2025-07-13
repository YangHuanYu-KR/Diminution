#program step(t).

goal(listen_to_music(C), t) :- subtask(listen_to_music(C)), subtask(listen_to_music(C), find(O1_1), 1), goal(subtask(listen_to_music(C), find(O1_1), 1), T0), T0 <= T1, time(T0), subtask(listen_to_music(C), switchon(O2_1), 2), goal(subtask(listen_to_music(C), switchon(O2_1), 2), T1), T1 <= T2, time(T1), subtask(listen_to_music(C), watch(O3_1), 3), goal(subtask(listen_to_music(C), watch(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(listen_to_music(C), find(O), 1), t) :- goal(C, find(O), t), subtask(listen_to_music(C), find(O), 1).
goal(subtask(listen_to_music(C), switchon(O), 2), t) :- goal(C, switchon(O), t), subtask(listen_to_music(C), switchon(O), 2).
goal(subtask(listen_to_music(C), watch(O), 3), t) :- goal(C, watch(O), t), subtask(listen_to_music(C), watch(O), 3).
