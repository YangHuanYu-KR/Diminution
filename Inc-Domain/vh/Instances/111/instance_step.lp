#program step(t).

goal(relax(C), t) :- subtask(relax(C)), subtask(relax(C), walk(O1_1), 1), goal(subtask(relax(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(relax(C), sit(O2_1), 2), goal(subtask(relax(C), sit(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(relax(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(relax(C), walk(O), 1).
goal(subtask(relax(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(relax(C), sit(O), 2).
