#program step(t).

goal(grab_some_juice(C), t) :- subtask(grab_some_juice(C)), subtask(grab_some_juice(C), walk(O1_1), 1), goal(subtask(grab_some_juice(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(grab_some_juice(C), grab(O2_1), 2), goal(subtask(grab_some_juice(C), grab(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(grab_some_juice(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(grab_some_juice(C), walk(O), 1).
goal(subtask(grab_some_juice(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(grab_some_juice(C), grab(O), 2).
