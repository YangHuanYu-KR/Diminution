#program step(t).

goal(put_away_clean_clothes(C), t) :- subtask(put_away_clean_clothes(C)), subtask(put_away_clean_clothes(C), walk(O1_1), 1), goal(subtask(put_away_clean_clothes(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(put_away_clean_clothes(C), putback(O2_1, O2_2), 2), goal(subtask(put_away_clean_clothes(C), putback(O2_1, O2_2), 2), T1), T1 <= t, time(T1).

goal(subtask(put_away_clean_clothes(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(put_away_clean_clothes(C), walk(O), 1).
goal(subtask(put_away_clean_clothes(C), putback(O1, O2), 2), t) :- goal(C, putback(O1, O2), t), subtask(put_away_clean_clothes(C), putback(O1, O2), 2).
