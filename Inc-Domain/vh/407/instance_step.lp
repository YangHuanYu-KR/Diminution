#program step(t).

goal(put_on_coat(C), t) :- subtask(put_on_coat(C)), subtask(put_on_coat(C), walk(O1_1), 1), goal(subtask(put_on_coat(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(put_on_coat(C), grab(O2_1), 2), goal(subtask(put_on_coat(C), grab(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(put_on_coat(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(put_on_coat(C), walk(O), 1).
goal(subtask(put_on_coat(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(put_on_coat(C), grab(O), 2).
