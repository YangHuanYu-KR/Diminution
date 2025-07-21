#program step(t).

goal(vacuum_carpet(C), t) :- subtask(vacuum_carpet(C)), subtask(vacuum_carpet(C), walk(O1_1), 1), goal(subtask(vacuum_carpet(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(vacuum_carpet(C), switchon(O2_1), 2), goal(subtask(vacuum_carpet(C), switchon(O2_1), 2), T1), T1 <= T2, time(T1), subtask(vacuum_carpet(C), switchoff(O3_1), 3), goal(subtask(vacuum_carpet(C), switchoff(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(vacuum_carpet(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(vacuum_carpet(C), walk(O), 1).
goal(subtask(vacuum_carpet(C), switchon(O), 2), t) :- goal(C, switchon(O), t), subtask(vacuum_carpet(C), switchon(O), 2).
goal(subtask(vacuum_carpet(C), switchoff(O), 3), t) :- goal(C, switchoff(O), t), subtask(vacuum_carpet(C), switchoff(O), 3).
