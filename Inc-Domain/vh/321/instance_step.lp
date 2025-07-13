#program step(t).

goal(go_to_toilet(C), t) :- subtask(go_to_toilet(C)), subtask(go_to_toilet(C), walk(O1_1), 1), goal(subtask(go_to_toilet(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(go_to_toilet(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(go_to_toilet(C), walk(O), 1).
