#program step(t).

goal(story_reading_time(C), T0, t, 1) :- subtask(story_reading_time(C)), subtask(story_reading_time(C), walk(O1_1), 1), goal(subtask(story_reading_time(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(story_reading_time(C), grab(O2_1), 2), goal(subtask(story_reading_time(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(story_reading_time(C), walk(O3_1), 3), goal(subtask(story_reading_time(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(story_reading_time(C), T3, t, 2) :- subtask(story_reading_time(C), sit(O4_1), 4), goal(subtask(story_reading_time(C), sit(O4_1), 4), T3), T3 <= T4, time(T3), subtask(story_reading_time(C), read(O5_1), 5), goal(subtask(story_reading_time(C), read(O5_1), 5), T4), T4 <= t, time(T4).
goal(story_reading_time(C), t) :- goal(story_reading_time(C), T0, T2, 1), goal(story_reading_time(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(story_reading_time(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(story_reading_time(C), walk(O), 1).
goal(subtask(story_reading_time(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(story_reading_time(C), grab(O), 2).
goal(subtask(story_reading_time(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(story_reading_time(C), walk(O), 3).
goal(subtask(story_reading_time(C), sit(O), 4), t) :- goal(C, sit(O), t), subtask(story_reading_time(C), sit(O), 4).
goal(subtask(story_reading_time(C), read(O), 5), t) :- goal(C, read(O), t), subtask(story_reading_time(C), read(O), 5).
