#program step(t).

goal(put_out_flowers(C), t) :- subtask(put_out_flowers(C)), subtask(put_out_flowers(C), walk(O1_1), 1), goal(subtask(put_out_flowers(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(put_out_flowers(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(put_out_flowers(C), walk(O), 1).
