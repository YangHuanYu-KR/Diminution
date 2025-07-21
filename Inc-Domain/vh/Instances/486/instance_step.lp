#program step(t).

goal(take_shower(C), t) :- subtask(take_shower(C)), subtask(take_shower(C), walk(O1_1), 1), goal(subtask(take_shower(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(take_shower(C), walk(O2_1), 2), goal(subtask(take_shower(C), walk(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(take_shower(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(take_shower(C), walk(O), 1).
goal(subtask(take_shower(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(take_shower(C), walk(O), 2).
