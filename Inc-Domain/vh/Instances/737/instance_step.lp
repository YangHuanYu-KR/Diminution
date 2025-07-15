#program step(t).

goal(play_games(C), t) :- subtask(play_games(C)), subtask(play_games(C), cut(O1_1), 1), goal(subtask(play_games(C), cut(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(play_games(C), cut(O), 1), t) :- goal(C, cut(O), t), subtask(play_games(C), cut(O), 1).
