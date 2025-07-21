#program step(t).

goal(relax_on_sofa(C), t) :- subtask(relax_on_sofa(C)), subtask(relax_on_sofa(C), walk(O1_1), 1), goal(subtask(relax_on_sofa(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(relax_on_sofa(C), find(O2_1), 2), goal(subtask(relax_on_sofa(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(relax_on_sofa(C), open(O3_1), 3), goal(subtask(relax_on_sofa(C), open(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(relax_on_sofa(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(relax_on_sofa(C), walk(O), 1).
goal(subtask(relax_on_sofa(C), find(O), 2), t) :- goal(C, find(O), t), subtask(relax_on_sofa(C), find(O), 2).
goal(subtask(relax_on_sofa(C), open(O), 3), t) :- goal(C, open(O), t), subtask(relax_on_sofa(C), open(O), 3).
