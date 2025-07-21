#program step(t).

goal(surf_internet(C), T0, t, 1) :- subtask(surf_internet(C)), subtask(surf_internet(C), walk(O1_1), 1), goal(subtask(surf_internet(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(surf_internet(C), walk(O2_1), 2), goal(subtask(surf_internet(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(surf_internet(C), sit(O3_1), 3), goal(subtask(surf_internet(C), sit(O3_1), 3), T2), T2 <= t, time(T2).
goal(surf_internet(C), T3, t, 2) :- subtask(surf_internet(C), touch(O4_1), 4), goal(subtask(surf_internet(C), touch(O4_1), 4), T3), T3 <= T4, time(T3), subtask(surf_internet(C), lookat(O5_1), 5), goal(subtask(surf_internet(C), lookat(O5_1), 5), T4), T4 <= t, time(T4).
goal(surf_internet(C), t) :- goal(surf_internet(C), T0, T2, 1), goal(surf_internet(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(surf_internet(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(surf_internet(C), walk(O), 1).
goal(subtask(surf_internet(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(surf_internet(C), walk(O), 2).
goal(subtask(surf_internet(C), sit(O), 3), t) :- goal(C, sit(O), t), subtask(surf_internet(C), sit(O), 3).
goal(subtask(surf_internet(C), touch(O), 4), t) :- goal(C, touch(O), t), subtask(surf_internet(C), touch(O), 4).
goal(subtask(surf_internet(C), lookat(O), 5), t) :- goal(C, lookat(O), t), subtask(surf_internet(C), lookat(O), 5).
