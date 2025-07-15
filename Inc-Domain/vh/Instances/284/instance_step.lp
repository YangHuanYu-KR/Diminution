#program step(t).

goal(put_on_glasses(C), t) :- subtask(put_on_glasses(C)), subtask(put_on_glasses(C), walk(O1_1), 1), goal(subtask(put_on_glasses(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(put_on_glasses(C), grab(O2_1), 2), goal(subtask(put_on_glasses(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(put_on_glasses(C), putback(O3_1, O3_2), 3), goal(subtask(put_on_glasses(C), putback(O3_1, O3_2), 3), T2), T2 <= t, time(T2).

goal(subtask(put_on_glasses(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(put_on_glasses(C), walk(O), 1).
goal(subtask(put_on_glasses(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(put_on_glasses(C), grab(O), 2).
goal(subtask(put_on_glasses(C), putback(O1, O2), 3), t) :- goal(C, putback(O1, O2), t), subtask(put_on_glasses(C), putback(O1, O2), 3).
