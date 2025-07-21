#program step(t).

goal(draw_picture(C), t) :- subtask(draw_picture(C)), subtask(draw_picture(C), walk(O1_1), 1), goal(subtask(draw_picture(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(draw_picture(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(draw_picture(C), walk(O), 1).
