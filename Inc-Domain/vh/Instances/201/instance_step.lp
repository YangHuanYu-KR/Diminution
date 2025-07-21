#program step(t).

goal(file_expense_reports(C), T0, t, 1) :- subtask(file_expense_reports(C)), subtask(file_expense_reports(C), walk(O1_1), 1), goal(subtask(file_expense_reports(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(file_expense_reports(C), find(O2_1), 2), goal(subtask(file_expense_reports(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(file_expense_reports(C), open(O3_1), 3), goal(subtask(file_expense_reports(C), open(O3_1), 3), T2), T2 <= t, time(T2).
goal(file_expense_reports(C), T3, t, 2) :- subtask(file_expense_reports(C), putin(O4_1, O4_2), 4), goal(subtask(file_expense_reports(C), putin(O4_1, O4_2), 4), T3), T3 <= T4, time(T3), subtask(file_expense_reports(C), putin(O5_1, O5_2), 5), goal(subtask(file_expense_reports(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(file_expense_reports(C), close(O6_1), 6), goal(subtask(file_expense_reports(C), close(O6_1), 6), T5), T5 <= t, time(T5).
goal(file_expense_reports(C), t) :- goal(file_expense_reports(C), T0, T2, 1), goal(file_expense_reports(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(file_expense_reports(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(file_expense_reports(C), walk(O), 1).
goal(subtask(file_expense_reports(C), find(O), 2), t) :- goal(C, find(O), t), subtask(file_expense_reports(C), find(O), 2).
goal(subtask(file_expense_reports(C), open(O), 3), t) :- goal(C, open(O), t), subtask(file_expense_reports(C), open(O), 3).
goal(subtask(file_expense_reports(C), putin(O1, O2), 4), t) :- goal(C, putin(O1, O2), t), subtask(file_expense_reports(C), putin(O1, O2), 4).
goal(subtask(file_expense_reports(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(file_expense_reports(C), putin(O1, O2), 5).
goal(subtask(file_expense_reports(C), close(O), 6), t) :- goal(C, close(O), t), subtask(file_expense_reports(C), close(O), 6).
