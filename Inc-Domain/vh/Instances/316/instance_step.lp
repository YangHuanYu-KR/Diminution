#program step(t).

goal(listen_to_music(C), t) :- subtask(listen_to_music(C)), subtask(listen_to_music(C), walk(O1_1), 1), goal(subtask(listen_to_music(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(listen_to_music(C), switchon(O2_1), 2), goal(subtask(listen_to_music(C), switchon(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(listen_to_music(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(listen_to_music(C), walk(O), 1).
goal(subtask(listen_to_music(C), switchon(O), 2), t) :- goal(C, switchon(O), t), subtask(listen_to_music(C), switchon(O), 2).
