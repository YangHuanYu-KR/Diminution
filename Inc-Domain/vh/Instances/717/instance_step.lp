#program step(t).

goal(story_reading_time(C), T0, t, 1) :- subtask(story_reading_time(C)), subtask(story_reading_time(C), walk(O1_1), 1), goal(subtask(story_reading_time(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(story_reading_time(C), find(O2_1), 2), goal(subtask(story_reading_time(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(story_reading_time(C), open(O3_1), 3), goal(subtask(story_reading_time(C), open(O3_1), 3), T2), T2 <= t, time(T2).
goal(story_reading_time(C), T3, t, 2) :- subtask(story_reading_time(C), close(O4_1), 4), goal(subtask(story_reading_time(C), close(O4_1), 4), T3), T3 <= t, time(T3).
goal(story_reading_time(C), t) :- goal(story_reading_time(C), T0, T2, 1), goal(story_reading_time(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(story_reading_time(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(story_reading_time(C), walk(O), 1).
goal(subtask(story_reading_time(C), find(O), 2), t) :- goal(C, find(O), t), subtask(story_reading_time(C), find(O), 2).
goal(subtask(story_reading_time(C), open(O), 3), t) :- goal(C, open(O), t), subtask(story_reading_time(C), open(O), 3).
goal(subtask(story_reading_time(C), close(O), 4), t) :- goal(C, close(O), t), subtask(story_reading_time(C), close(O), 4).
