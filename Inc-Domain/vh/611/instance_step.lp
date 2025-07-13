#program step(t).

goal(collect_napkin_rings(C), t) :- subtask(collect_napkin_rings(C)), subtask(collect_napkin_rings(C), walk(O1_1), 1), goal(subtask(collect_napkin_rings(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(collect_napkin_rings(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(collect_napkin_rings(C), walk(O), 1).
