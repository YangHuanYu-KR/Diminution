#program step(t).

goal(prepare_dinner(C), t) :- subtask(prepare_dinner(C)), subtask(prepare_dinner(C), walk(O1_1), 1), goal(subtask(prepare_dinner(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(prepare_dinner(C), walk(O2_1), 2), goal(subtask(prepare_dinner(C), walk(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(prepare_dinner(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 1).
goal(subtask(prepare_dinner(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 2).
