#program step(t).

goal(playing_video_game(C), t) :- subtask(playing_video_game(C)), subtask(playing_video_game(C), walk(O1_1), 1), goal(subtask(playing_video_game(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(playing_video_game(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(playing_video_game(C), walk(O), 1).
