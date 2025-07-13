#program step(t).

goal(wash_dishes_by_hand(C), t) :- subtask(wash_dishes_by_hand(C)), subtask(wash_dishes_by_hand(C), walk(O1_1), 1), goal(subtask(wash_dishes_by_hand(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(wash_dishes_by_hand(C), cut(O2_1), 2), goal(subtask(wash_dishes_by_hand(C), cut(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(wash_dishes_by_hand(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(wash_dishes_by_hand(C), walk(O), 1).
goal(subtask(wash_dishes_by_hand(C), cut(O), 2), t) :- goal(C, cut(O), t), subtask(wash_dishes_by_hand(C), cut(O), 2).
