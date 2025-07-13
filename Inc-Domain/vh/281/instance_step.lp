#program step(t).

goal(feed_me(C), T0, t, 1) :- subtask(feed_me(C)), subtask(feed_me(C), walk(O1_1), 1), goal(subtask(feed_me(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(feed_me(C), lookat(O2_1), 2), goal(subtask(feed_me(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(feed_me(C), grab(O3_1), 3), goal(subtask(feed_me(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(feed_me(C), T3, t, 2) :- subtask(feed_me(C), walk(O4_1), 4), goal(subtask(feed_me(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(feed_me(C), sit(O5_1), 5), goal(subtask(feed_me(C), sit(O5_1), 5), T4), T4 <= T5, time(T4), subtask(feed_me(C), eat(O6_1), 6), goal(subtask(feed_me(C), eat(O6_1), 6), T5), T5 <= t, time(T5).
goal(feed_me(C), t) :- goal(feed_me(C), T0, T2, 1), goal(feed_me(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(feed_me(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(feed_me(C), walk(O), 1).
goal(subtask(feed_me(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(feed_me(C), lookat(O), 2).
goal(subtask(feed_me(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(feed_me(C), grab(O), 3).
goal(subtask(feed_me(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(feed_me(C), walk(O), 4).
goal(subtask(feed_me(C), sit(O), 5), t) :- goal(C, sit(O), t), subtask(feed_me(C), sit(O), 5).
goal(subtask(feed_me(C), eat(O), 6), t) :- goal(C, eat(O), t), subtask(feed_me(C), eat(O), 6).
