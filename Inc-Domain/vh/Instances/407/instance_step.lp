#program step(t).

goal(sweep_hallway_please(C), T0, t, 1) :- subtask(sweep_hallway_please(C)), subtask(sweep_hallway_please(C), walk(O1_1), 1), goal(subtask(sweep_hallway_please(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(sweep_hallway_please(C), grab(O2_1), 2), goal(subtask(sweep_hallway_please(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(sweep_hallway_please(C), walk(O3_1), 3), goal(subtask(sweep_hallway_please(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(sweep_hallway_please(C), T3, t, 2) :- subtask(sweep_hallway_please(C), plugin(O4_1), 4), goal(subtask(sweep_hallway_please(C), plugin(O4_1), 4), T3), T3 <= t, time(T3).
goal(sweep_hallway_please(C), t) :- goal(sweep_hallway_please(C), T0, T2, 1), goal(sweep_hallway_please(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(sweep_hallway_please(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(sweep_hallway_please(C), walk(O), 1).
goal(subtask(sweep_hallway_please(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(sweep_hallway_please(C), grab(O), 2).
goal(subtask(sweep_hallway_please(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(sweep_hallway_please(C), walk(O), 3).
goal(subtask(sweep_hallway_please(C), plugin(O), 4), t) :- goal(C, plugin(O), t), subtask(sweep_hallway_please(C), plugin(O), 4).
