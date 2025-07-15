#program step(t).

goal(put_in_chair(C), t) :- subtask(put_in_chair(C)), subtask(put_in_chair(C), find(O1_1), 1), goal(subtask(put_in_chair(C), find(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(put_in_chair(C), find(O), 1), t) :- goal(C, find(O), t), subtask(put_in_chair(C), find(O), 1).
