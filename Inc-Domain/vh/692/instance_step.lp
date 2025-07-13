#program step(t).

goal(put_away_keys(C), t) :- subtask(put_away_keys(C)), subtask(put_away_keys(C), cut(O1_1), 1), goal(subtask(put_away_keys(C), cut(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(put_away_keys(C), cut(O), 1), t) :- goal(C, cut(O), t), subtask(put_away_keys(C), cut(O), 1).
