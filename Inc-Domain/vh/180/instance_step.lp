#program step(t).

goal(admire_art(C), T0, t, 1) :- subtask(admire_art(C)), subtask(admire_art(C), walk(O1_1), 1), goal(subtask(admire_art(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(admire_art(C), lookat(O2_1), 2), goal(subtask(admire_art(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(admire_art(C), lookat(O3_1), 3), goal(subtask(admire_art(C), lookat(O3_1), 3), T2), T2 <= t, time(T2).
goal(admire_art(C), T3, t, 2) :- subtask(admire_art(C), lookat(O4_1), 4), goal(subtask(admire_art(C), lookat(O4_1), 4), T3), T3 <= t, time(T3).
goal(admire_art(C), t) :- goal(admire_art(C), T0, T2, 1), goal(admire_art(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(admire_art(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(admire_art(C), walk(O), 1).
goal(subtask(admire_art(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(admire_art(C), lookat(O), 2).
goal(subtask(admire_art(C), lookat(O), 3), t) :- goal(C, lookat(O), t), subtask(admire_art(C), lookat(O), 3).
goal(subtask(admire_art(C), lookat(O), 4), t) :- goal(C, lookat(O), t), subtask(admire_art(C), lookat(O), 4).
