#program step(t).

goal(deficate(C), t) :- subtask(deficate(C)), subtask(deficate(C), walk(O1_1), 1), goal(subtask(deficate(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(deficate(C), sit(O2_1), 2), goal(subtask(deficate(C), sit(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(deficate(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 1).
goal(subtask(deficate(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 2).
