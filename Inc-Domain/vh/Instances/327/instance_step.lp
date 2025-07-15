#program step(t).

goal(wash_hands(C), T0, t, 1) :- subtask(wash_hands(C)), subtask(wash_hands(C), walk(O1_1), 1), goal(subtask(wash_hands(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(wash_hands(C), grab(O2_1), 2), goal(subtask(wash_hands(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(wash_hands(C), touch(O3_1), 3), goal(subtask(wash_hands(C), touch(O3_1), 3), T2), T2 <= t, time(T2).
goal(wash_hands(C), T3, t, 2) :- subtask(wash_hands(C), wash(O4_1), 4), goal(subtask(wash_hands(C), wash(O4_1), 4), T3), T3 <= T4, time(T3), subtask(wash_hands(C), close(O5_1), 5), goal(subtask(wash_hands(C), close(O5_1), 5), T4), T4 <= T5, time(T4), subtask(wash_hands(C), putback(O6_1, O6_2), 6), goal(subtask(wash_hands(C), putback(O6_1, O6_2), 6), T5), T5 <= t, time(T5).
goal(wash_hands(C), t) :- goal(wash_hands(C), T0, T2, 1), goal(wash_hands(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(wash_hands(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(wash_hands(C), walk(O), 1).
goal(subtask(wash_hands(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(wash_hands(C), grab(O), 2).
goal(subtask(wash_hands(C), touch(O), 3), t) :- goal(C, touch(O), t), subtask(wash_hands(C), touch(O), 3).
goal(subtask(wash_hands(C), wash(O), 4), t) :- goal(C, wash(O), t), subtask(wash_hands(C), wash(O), 4).
goal(subtask(wash_hands(C), close(O), 5), t) :- goal(C, close(O), t), subtask(wash_hands(C), close(O), 5).
goal(subtask(wash_hands(C), putback(O1, O2), 6), t) :- goal(C, putback(O1, O2), t), subtask(wash_hands(C), putback(O1, O2), 6).
