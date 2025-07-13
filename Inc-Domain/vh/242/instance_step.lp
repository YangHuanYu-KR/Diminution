#program step(t).

goal(playing_video_game(C), T0, t, 1) :- subtask(playing_video_game(C)), subtask(playing_video_game(C), walk(O1_1), 1), goal(subtask(playing_video_game(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(playing_video_game(C), walk(O2_1), 2), goal(subtask(playing_video_game(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(playing_video_game(C), grab(O3_1), 3), goal(subtask(playing_video_game(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(playing_video_game(C), T3, t, 2) :- subtask(playing_video_game(C), plugin(O4_1), 4), goal(subtask(playing_video_game(C), plugin(O4_1), 4), T3), T3 <= T4, time(T3), subtask(playing_video_game(C), switchon(O5_1), 5), goal(subtask(playing_video_game(C), switchon(O5_1), 5), T4), T4 <= t, time(T4).
goal(playing_video_game(C), t) :- goal(playing_video_game(C), T0, T2, 1), goal(playing_video_game(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(playing_video_game(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(playing_video_game(C), walk(O), 1).
goal(subtask(playing_video_game(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(playing_video_game(C), walk(O), 2).
goal(subtask(playing_video_game(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(playing_video_game(C), grab(O), 3).
goal(subtask(playing_video_game(C), plugin(O), 4), t) :- goal(C, plugin(O), t), subtask(playing_video_game(C), plugin(O), 4).
goal(subtask(playing_video_game(C), switchon(O), 5), t) :- goal(C, switchon(O), t), subtask(playing_video_game(C), switchon(O), 5).
