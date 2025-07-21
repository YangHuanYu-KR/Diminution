#program step(t).

goal(getting__dresses(C), t) :- subtask(getting__dresses(C)), subtask(getting__dresses(C), walk(O1_1), 1), goal(subtask(getting__dresses(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(getting__dresses(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(getting__dresses(C), walk(O), 1).
