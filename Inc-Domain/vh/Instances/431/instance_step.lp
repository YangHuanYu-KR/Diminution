#program step(t).

goal(put_in_chair(C), t) :- subtask(put_in_chair(C)), subtask(put_in_chair(C), walk(O1_1), 1), goal(subtask(put_in_chair(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(put_in_chair(C), grab(O2_1), 2), goal(subtask(put_in_chair(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(put_in_chair(C), putin(O3_1, O3_2), 3), goal(subtask(put_in_chair(C), putin(O3_1, O3_2), 3), T2), T2 <= t, time(T2).

goal(subtask(put_in_chair(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(put_in_chair(C), walk(O), 1).
goal(subtask(put_in_chair(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(put_in_chair(C), grab(O), 2).
goal(subtask(put_in_chair(C), putin(O1, O2), 3), t) :- goal(C, putin(O1, O2), t), subtask(put_in_chair(C), putin(O1, O2), 3).
