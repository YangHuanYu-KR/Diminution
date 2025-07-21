#program step(t).

goal(put_on_glasses(C), t) :- subtask(put_on_glasses(C)), subtask(put_on_glasses(C), find(O1_1), 1), goal(subtask(put_on_glasses(C), find(O1_1), 1), T0), T0 <= T1, time(T0), subtask(put_on_glasses(C), grab(O2_1), 2), goal(subtask(put_on_glasses(C), grab(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(put_on_glasses(C), find(O), 1), t) :- goal(C, find(O), t), subtask(put_on_glasses(C), find(O), 1).
goal(subtask(put_on_glasses(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(put_on_glasses(C), grab(O), 2).
