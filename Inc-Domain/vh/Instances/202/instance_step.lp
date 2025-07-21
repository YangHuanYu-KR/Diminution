#program step(t).

goal(shampoo_hair(C), T0, t, 1) :- subtask(shampoo_hair(C)), subtask(shampoo_hair(C), walk(O1_1), 1), goal(subtask(shampoo_hair(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(shampoo_hair(C), find(O2_1), 2), goal(subtask(shampoo_hair(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(shampoo_hair(C), touch(O3_1), 3), goal(subtask(shampoo_hair(C), touch(O3_1), 3), T2), T2 <= t, time(T2).
goal(shampoo_hair(C), T3, t, 2) :- subtask(shampoo_hair(C), wash(O4_1), 4), goal(subtask(shampoo_hair(C), wash(O4_1), 4), T3), T3 <= t, time(T3).
goal(shampoo_hair(C), t) :- goal(shampoo_hair(C), T0, T2, 1), goal(shampoo_hair(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(shampoo_hair(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(shampoo_hair(C), walk(O), 1).
goal(subtask(shampoo_hair(C), find(O), 2), t) :- goal(C, find(O), t), subtask(shampoo_hair(C), find(O), 2).
goal(subtask(shampoo_hair(C), touch(O), 3), t) :- goal(C, touch(O), t), subtask(shampoo_hair(C), touch(O), 3).
goal(subtask(shampoo_hair(C), wash(O), 4), t) :- goal(C, wash(O), t), subtask(shampoo_hair(C), wash(O), 4).
