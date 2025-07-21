#program step(t).

goal(play_games(C), T0, t, 1) :- subtask(play_games(C)), subtask(play_games(C), walk(O1_1), 1), goal(subtask(play_games(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(play_games(C), grab(O2_1), 2), goal(subtask(play_games(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(play_games(C), switchon(O3_1), 3), goal(subtask(play_games(C), switchon(O3_1), 3), T2), T2 <= t, time(T2).
goal(play_games(C), T3, t, 2) :- subtask(play_games(C), sit(O4_1), 4), goal(subtask(play_games(C), sit(O4_1), 4), T3), T3 <= t, time(T3).
goal(play_games(C), t) :- goal(play_games(C), T0, T2, 1), goal(play_games(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(play_games(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(play_games(C), walk(O), 1).
goal(subtask(play_games(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(play_games(C), grab(O), 2).
goal(subtask(play_games(C), switchon(O), 3), t) :- goal(C, switchon(O), t), subtask(play_games(C), switchon(O), 3).
goal(subtask(play_games(C), sit(O), 4), t) :- goal(C, sit(O), t), subtask(play_games(C), sit(O), 4).
