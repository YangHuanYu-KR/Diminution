#program step(t).

goal(restock(C), T0, t, 1) :- subtask(restock(C)), subtask(restock(C), walk(O1_1), 1), goal(subtask(restock(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(restock(C), walk(O2_1), 2), goal(subtask(restock(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(restock(C), find(O3_1), 3), goal(subtask(restock(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(restock(C), T3, t, 2) :- subtask(restock(C), walk(O4_1), 4), goal(subtask(restock(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(restock(C), walk(O5_1), 5), goal(subtask(restock(C), walk(O5_1), 5), T4), T4 <= t, time(T4).
goal(restock(C), t) :- goal(restock(C), T0, T2, 1), goal(restock(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(restock(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(restock(C), walk(O), 1).
goal(subtask(restock(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(restock(C), walk(O), 2).
goal(subtask(restock(C), find(O), 3), t) :- goal(C, find(O), t), subtask(restock(C), find(O), 3).
goal(subtask(restock(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(restock(C), walk(O), 4).
goal(subtask(restock(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(restock(C), walk(O), 5).
