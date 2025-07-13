#program step(t).

goal(admire_art(C), t) :- subtask(admire_art(C)), subtask(admire_art(C), walk(O1_1), 1), goal(subtask(admire_art(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(admire_art(C), lookat(O2_1), 2), goal(subtask(admire_art(C), lookat(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(admire_art(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(admire_art(C), walk(O), 1).
goal(subtask(admire_art(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(admire_art(C), lookat(O), 2).
