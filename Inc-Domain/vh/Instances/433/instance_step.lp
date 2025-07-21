#program step(t).

goal(look_at_painting(C), t) :- subtask(look_at_painting(C)), subtask(look_at_painting(C), walk(O1_1), 1), goal(subtask(look_at_painting(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(look_at_painting(C), lookat(O2_1), 2), goal(subtask(look_at_painting(C), lookat(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(look_at_painting(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(look_at_painting(C), walk(O), 1).
goal(subtask(look_at_painting(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(look_at_painting(C), lookat(O), 2).
