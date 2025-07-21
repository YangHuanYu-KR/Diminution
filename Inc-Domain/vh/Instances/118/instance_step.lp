#program step(t).

goal(put_down_bags(C), t) :- subtask(put_down_bags(C)), subtask(put_down_bags(C), walk(O1_1), 1), goal(subtask(put_down_bags(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(put_down_bags(C), grab(O2_1), 2), goal(subtask(put_down_bags(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(put_down_bags(C), drop(O3_1), 3), goal(subtask(put_down_bags(C), drop(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(put_down_bags(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(put_down_bags(C), walk(O), 1).
goal(subtask(put_down_bags(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(put_down_bags(C), grab(O), 2).
goal(subtask(put_down_bags(C), drop(O), 3), t) :- goal(C, drop(O), t), subtask(put_down_bags(C), drop(O), 3).
