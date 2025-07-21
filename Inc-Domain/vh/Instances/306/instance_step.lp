#program step(t).

goal(social_media__checks(C), T0, t, 1) :- subtask(social_media__checks(C)), subtask(social_media__checks(C), walk(O1_1), 1), goal(subtask(social_media__checks(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(social_media__checks(C), walk(O2_1), 2), goal(subtask(social_media__checks(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(social_media__checks(C), walk(O3_1), 3), goal(subtask(social_media__checks(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(social_media__checks(C), T3, t, 2) :- subtask(social_media__checks(C), open(O4_1), 4), goal(subtask(social_media__checks(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(social_media__checks(C), lookat(O5_1), 5), goal(subtask(social_media__checks(C), lookat(O5_1), 5), T4), T4 <= t, time(T4).
goal(social_media__checks(C), t) :- goal(social_media__checks(C), T0, T2, 1), goal(social_media__checks(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(social_media__checks(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(social_media__checks(C), walk(O), 1).
goal(subtask(social_media__checks(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(social_media__checks(C), walk(O), 2).
goal(subtask(social_media__checks(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(social_media__checks(C), walk(O), 3).
goal(subtask(social_media__checks(C), open(O), 4), t) :- goal(C, open(O), t), subtask(social_media__checks(C), open(O), 4).
goal(subtask(social_media__checks(C), lookat(O), 5), t) :- goal(C, lookat(O), t), subtask(social_media__checks(C), lookat(O), 5).
