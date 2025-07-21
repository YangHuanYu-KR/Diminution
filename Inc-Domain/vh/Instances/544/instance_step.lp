#program step(t).

goal(read_news(C), t) :- subtask(read_news(C)), subtask(read_news(C), walk(O1_1), 1), goal(subtask(read_news(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(read_news(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(read_news(C), walk(O), 1).
