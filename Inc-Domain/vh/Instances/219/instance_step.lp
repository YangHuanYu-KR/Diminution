#program step(t).

goal(surf_internet(C), t) :- subtask(surf_internet(C)), subtask(surf_internet(C), sit(O1_1), 1), goal(subtask(surf_internet(C), sit(O1_1), 1), T0), T0 <= T1, time(T0), subtask(surf_internet(C), open(O2_1), 2), goal(subtask(surf_internet(C), open(O2_1), 2), T1), T1 <= T2, time(T1), subtask(surf_internet(C), plugin(O3_1), 3), goal(subtask(surf_internet(C), plugin(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(surf_internet(C), sit(O), 1), t) :- goal(C, sit(O), t), subtask(surf_internet(C), sit(O), 1).
goal(subtask(surf_internet(C), open(O), 2), t) :- goal(C, open(O), t), subtask(surf_internet(C), open(O), 2).
goal(subtask(surf_internet(C), plugin(O), 3), t) :- goal(C, plugin(O), t), subtask(surf_internet(C), plugin(O), 3).
