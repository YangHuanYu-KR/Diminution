#program step(t).

goal(surf_internet(C), T0, t, 1) :- subtask(surf_internet(C)), subtask(surf_internet(C), walk(O1_1), 1), goal(subtask(surf_internet(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(surf_internet(C), walk(O2_1), 2), goal(subtask(surf_internet(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(surf_internet(C), walk(O3_1), 3), goal(subtask(surf_internet(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(surf_internet(C), T3, t, 2) :- subtask(surf_internet(C), find(O4_1), 4), goal(subtask(surf_internet(C), find(O4_1), 4), T3), T3 <= T4, time(T3), subtask(surf_internet(C), open(O5_1), 5), goal(subtask(surf_internet(C), open(O5_1), 5), T4), T4 <= T5, time(T4), subtask(surf_internet(C), close(O6_1), 6), goal(subtask(surf_internet(C), close(O6_1), 6), T5), T5 <= t, time(T5).
goal(surf_internet(C), t) :- goal(surf_internet(C), T0, T2, 1), goal(surf_internet(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(surf_internet(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(surf_internet(C), walk(O), 1).
goal(subtask(surf_internet(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(surf_internet(C), walk(O), 2).
goal(subtask(surf_internet(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(surf_internet(C), walk(O), 3).
goal(subtask(surf_internet(C), find(O), 4), t) :- goal(C, find(O), t), subtask(surf_internet(C), find(O), 4).
goal(subtask(surf_internet(C), open(O), 5), t) :- goal(C, open(O), t), subtask(surf_internet(C), open(O), 5).
goal(subtask(surf_internet(C), close(O), 6), t) :- goal(C, close(O), t), subtask(surf_internet(C), close(O), 6).
