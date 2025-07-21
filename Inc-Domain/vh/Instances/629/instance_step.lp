#program step(t).

goal(look_at_painting(C), t) :- subtask(look_at_painting(C)), subtask(look_at_painting(C), walk(O1_1), 1), goal(subtask(look_at_painting(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(look_at_painting(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(look_at_painting(C), walk(O), 1).
