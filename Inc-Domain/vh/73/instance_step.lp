#program step(t).

goal(collect_napkin_rings(C), T0, t, 1) :- subtask(collect_napkin_rings(C)), subtask(collect_napkin_rings(C), walk(O1_1), 1), goal(subtask(collect_napkin_rings(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(collect_napkin_rings(C), lookat(O2_1), 2), goal(subtask(collect_napkin_rings(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(collect_napkin_rings(C), find(O3_1), 3), goal(subtask(collect_napkin_rings(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(collect_napkin_rings(C), T3, t, 2) :- subtask(collect_napkin_rings(C), grab(O4_1), 4), goal(subtask(collect_napkin_rings(C), grab(O4_1), 4), T3), T3 <= t, time(T3).
goal(collect_napkin_rings(C), t) :- goal(collect_napkin_rings(C), T0, T2, 1), goal(collect_napkin_rings(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(collect_napkin_rings(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(collect_napkin_rings(C), walk(O), 1).
goal(subtask(collect_napkin_rings(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(collect_napkin_rings(C), lookat(O), 2).
goal(subtask(collect_napkin_rings(C), find(O), 3), t) :- goal(C, find(O), t), subtask(collect_napkin_rings(C), find(O), 3).
goal(subtask(collect_napkin_rings(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(collect_napkin_rings(C), grab(O), 4).
