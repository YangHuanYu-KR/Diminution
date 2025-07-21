#program step(t).

goal(story_reading_time(C), t) :- subtask(story_reading_time(C)), subtask(story_reading_time(C), walk(O1_1), 1), goal(subtask(story_reading_time(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(story_reading_time(C), find(O2_1), 2), goal(subtask(story_reading_time(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(story_reading_time(C), read(O3_1), 3), goal(subtask(story_reading_time(C), read(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(story_reading_time(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(story_reading_time(C), walk(O), 1).
goal(subtask(story_reading_time(C), find(O), 2), t) :- goal(C, find(O), t), subtask(story_reading_time(C), find(O), 2).
goal(subtask(story_reading_time(C), read(O), 3), t) :- goal(C, read(O), t), subtask(story_reading_time(C), read(O), 3).
