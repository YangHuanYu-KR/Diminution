#program step(t).

goal(shampoo_hair(C), T0, t, 1) :- subtask(shampoo_hair(C)), subtask(shampoo_hair(C), walk(O1_1), 1), goal(subtask(shampoo_hair(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(shampoo_hair(C), find(O2_1), 2), goal(subtask(shampoo_hair(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(shampoo_hair(C), grab(O3_1), 3), goal(subtask(shampoo_hair(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(shampoo_hair(C), T3, t, 2) :- subtask(shampoo_hair(C), turnto(O4_1), 4), goal(subtask(shampoo_hair(C), turnto(O4_1), 4), T3), T3 <= T4, time(T3), subtask(shampoo_hair(C), open(O5_1), 5), goal(subtask(shampoo_hair(C), open(O5_1), 5), T4), T4 <= T5, time(T4), subtask(shampoo_hair(C), wash(O6_1), 6), goal(subtask(shampoo_hair(C), wash(O6_1), 6), T5), T5 <= t, time(T5).
goal(shampoo_hair(C), T0, t, 3) :- goal(shampoo_hair(C), T0, T2, 1), goal(shampoo_hair(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(shampoo_hair(C), T6, t, 4) :- subtask(shampoo_hair(C), close(O7_1), 7), goal(subtask(shampoo_hair(C), close(O7_1), 7), T6), T6 <= T7, time(T6), subtask(shampoo_hair(C), putback(O8_1, O8_2), 8), goal(subtask(shampoo_hair(C), putback(O8_1, O8_2), 8), T7), T7 <= t, time(T7).
goal(shampoo_hair(C), t) :- goal(shampoo_hair(C), T0, T5, 3), goal(shampoo_hair(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(shampoo_hair(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(shampoo_hair(C), walk(O), 1).
goal(subtask(shampoo_hair(C), find(O), 2), t) :- goal(C, find(O), t), subtask(shampoo_hair(C), find(O), 2).
goal(subtask(shampoo_hair(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(shampoo_hair(C), grab(O), 3).
goal(subtask(shampoo_hair(C), turnto(O), 4), t) :- goal(C, turnto(O), t), subtask(shampoo_hair(C), turnto(O), 4).
goal(subtask(shampoo_hair(C), open(O), 5), t) :- goal(C, open(O), t), subtask(shampoo_hair(C), open(O), 5).
goal(subtask(shampoo_hair(C), wash(O), 6), t) :- goal(C, wash(O), t), subtask(shampoo_hair(C), wash(O), 6).
goal(subtask(shampoo_hair(C), close(O), 7), t) :- goal(C, close(O), t), subtask(shampoo_hair(C), close(O), 7).
goal(subtask(shampoo_hair(C), putback(O1, O2), 8), t) :- goal(C, putback(O1, O2), t), subtask(shampoo_hair(C), putback(O1, O2), 8).
