#program step(t).

goal(wash_face(C), t) :- subtask(wash_face(C)), subtask(wash_face(C), cut(O1_1), 1), goal(subtask(wash_face(C), cut(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(wash_face(C), cut(O), 1), t) :- goal(C, cut(O), t), subtask(wash_face(C), cut(O), 1).
