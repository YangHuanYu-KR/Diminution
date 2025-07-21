#program step(t).

goal(answer_door(C), t) :- subtask(answer_door(C)), subtask(answer_door(C), walk(O1_1), 1), goal(subtask(answer_door(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(answer_door(C), turnto(O2_1), 2), goal(subtask(answer_door(C), turnto(O2_1), 2), T1), T1 <= T2, time(T1), subtask(answer_door(C), open(O3_1), 3), goal(subtask(answer_door(C), open(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(answer_door(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(answer_door(C), walk(O), 1).
goal(subtask(answer_door(C), turnto(O), 2), t) :- goal(C, turnto(O), t), subtask(answer_door(C), turnto(O), 2).
goal(subtask(answer_door(C), open(O), 3), t) :- goal(C, open(O), t), subtask(answer_door(C), open(O), 3).
