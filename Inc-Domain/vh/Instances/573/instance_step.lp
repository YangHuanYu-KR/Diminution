#program step(t).

goal(admire_art(C), t) :- subtask(admire_art(C)), subtask(admire_art(C), find(O1_1), 1), goal(subtask(admire_art(C), find(O1_1), 1), T0), T0 <= T1, time(T0), subtask(admire_art(C), open(O2_1), 2), goal(subtask(admire_art(C), open(O2_1), 2), T1), T1 <= T2, time(T1), subtask(admire_art(C), close(O3_1), 3), goal(subtask(admire_art(C), close(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(admire_art(C), find(O), 1), t) :- goal(C, find(O), t), subtask(admire_art(C), find(O), 1).
goal(subtask(admire_art(C), open(O), 2), t) :- goal(C, open(O), t), subtask(admire_art(C), open(O), 2).
goal(subtask(admire_art(C), close(O), 3), t) :- goal(C, close(O), t), subtask(admire_art(C), close(O), 3).
