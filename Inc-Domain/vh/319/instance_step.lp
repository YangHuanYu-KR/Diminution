#program step(t).

goal(relax_on_sofa(C), t) :- subtask(relax_on_sofa(C)), subtask(relax_on_sofa(C), walk(O1_1), 1), goal(subtask(relax_on_sofa(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(relax_on_sofa(C), sit(O2_1), 2), goal(subtask(relax_on_sofa(C), sit(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(relax_on_sofa(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(relax_on_sofa(C), walk(O), 1).
goal(subtask(relax_on_sofa(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(relax_on_sofa(C), sit(O), 2).
