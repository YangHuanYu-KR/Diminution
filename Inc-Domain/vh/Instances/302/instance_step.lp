#program step(t).

goal(deficate(C), t) :- subtask(deficate(C)), subtask(deficate(C), walk(O1_1), 1), goal(subtask(deficate(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(deficate(C), walk(O2_1), 2), goal(subtask(deficate(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(deficate(C), sit(O3_1), 3), goal(subtask(deficate(C), sit(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(deficate(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 1).
goal(subtask(deficate(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 2).
goal(subtask(deficate(C), sit(O), 3), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 3).
