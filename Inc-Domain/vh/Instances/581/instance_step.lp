#program step(t).

goal(file_documents(C), t) :- subtask(file_documents(C)), subtask(file_documents(C), walk(O1_1), 1), goal(subtask(file_documents(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(file_documents(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(file_documents(C), walk(O), 1).
