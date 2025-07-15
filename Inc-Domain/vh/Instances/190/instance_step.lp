#program step(t).

goal(file_documents(C), T0, t, 1) :- subtask(file_documents(C)), subtask(file_documents(C), grab(O1_1), 1), goal(subtask(file_documents(C), grab(O1_1), 1), T0), T0 <= T1, time(T0), subtask(file_documents(C), find(O2_1), 2), goal(subtask(file_documents(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(file_documents(C), open(O3_1), 3), goal(subtask(file_documents(C), open(O3_1), 3), T2), T2 <= t, time(T2).
goal(file_documents(C), T3, t, 2) :- subtask(file_documents(C), putin(O4_1, O4_2), 4), goal(subtask(file_documents(C), putin(O4_1, O4_2), 4), T3), T3 <= T4, time(T3), subtask(file_documents(C), close(O5_1), 5), goal(subtask(file_documents(C), close(O5_1), 5), T4), T4 <= t, time(T4).
goal(file_documents(C), t) :- goal(file_documents(C), T0, T2, 1), goal(file_documents(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(file_documents(C), grab(O), 1), t) :- goal(C, grab(O), t), subtask(file_documents(C), grab(O), 1).
goal(subtask(file_documents(C), find(O), 2), t) :- goal(C, find(O), t), subtask(file_documents(C), find(O), 2).
goal(subtask(file_documents(C), open(O), 3), t) :- goal(C, open(O), t), subtask(file_documents(C), open(O), 3).
goal(subtask(file_documents(C), putin(O1, O2), 4), t) :- goal(C, putin(O1, O2), t), subtask(file_documents(C), putin(O1, O2), 4).
goal(subtask(file_documents(C), close(O), 5), t) :- goal(C, close(O), t), subtask(file_documents(C), close(O), 5).
