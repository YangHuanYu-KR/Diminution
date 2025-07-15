#program step(t).

goal(put_away_groceries(C), t) :- subtask(put_away_groceries(C)), subtask(put_away_groceries(C), walk(O1_1), 1), goal(subtask(put_away_groceries(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(put_away_groceries(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(put_away_groceries(C), walk(O), 1).
