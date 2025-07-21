#program step(t).

goal(type_up_document(C), T0, t, 1) :- subtask(type_up_document(C)), subtask(type_up_document(C), walk(O1_1), 1), goal(subtask(type_up_document(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(type_up_document(C), find(O2_1), 2), goal(subtask(type_up_document(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(type_up_document(C), switchon(O3_1), 3), goal(subtask(type_up_document(C), switchon(O3_1), 3), T2), T2 <= t, time(T2).
goal(type_up_document(C), T3, t, 2) :- subtask(type_up_document(C), grab(O4_1), 4), goal(subtask(type_up_document(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(type_up_document(C), open(O5_1), 5), goal(subtask(type_up_document(C), open(O5_1), 5), T4), T4 <= t, time(T4).
goal(type_up_document(C), t) :- goal(type_up_document(C), T0, T2, 1), goal(type_up_document(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(type_up_document(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(type_up_document(C), walk(O), 1).
goal(subtask(type_up_document(C), find(O), 2), t) :- goal(C, find(O), t), subtask(type_up_document(C), find(O), 2).
goal(subtask(type_up_document(C), switchon(O), 3), t) :- goal(C, switchon(O), t), subtask(type_up_document(C), switchon(O), 3).
goal(subtask(type_up_document(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(type_up_document(C), grab(O), 4).
goal(subtask(type_up_document(C), open(O), 5), t) :- goal(C, open(O), t), subtask(type_up_document(C), open(O), 5).
