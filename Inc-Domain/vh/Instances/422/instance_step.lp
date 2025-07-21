#program step(t).

goal(playing_video_game(C), T0, t, 1) :- subtask(playing_video_game(C)), subtask(playing_video_game(C), walk(O1_1), 1), goal(subtask(playing_video_game(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(playing_video_game(C), grab(O2_1), 2), goal(subtask(playing_video_game(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(playing_video_game(C), walk(O3_1), 3), goal(subtask(playing_video_game(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(playing_video_game(C), T3, t, 2) :- subtask(playing_video_game(C), switchon(O4_1), 4), goal(subtask(playing_video_game(C), switchon(O4_1), 4), T3), T3 <= T4, time(T3), subtask(playing_video_game(C), sit(O5_1), 5), goal(subtask(playing_video_game(C), sit(O5_1), 5), T4), T4 <= T5, time(T4), subtask(playing_video_game(C), grab(O6_1), 6), goal(subtask(playing_video_game(C), grab(O6_1), 6), T5), T5 <= t, time(T5).
goal(playing_video_game(C), t) :- goal(playing_video_game(C), T0, T2, 1), goal(playing_video_game(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(playing_video_game(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(playing_video_game(C), walk(O), 1).
goal(subtask(playing_video_game(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(playing_video_game(C), grab(O), 2).
goal(subtask(playing_video_game(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(playing_video_game(C), walk(O), 3).
goal(subtask(playing_video_game(C), switchon(O), 4), t) :- goal(C, switchon(O), t), subtask(playing_video_game(C), switchon(O), 4).
goal(subtask(playing_video_game(C), sit(O), 5), t) :- goal(C, sit(O), t), subtask(playing_video_game(C), sit(O), 5).
goal(subtask(playing_video_game(C), grab(O), 6), t) :- goal(C, grab(O), t), subtask(playing_video_game(C), grab(O), 6).
