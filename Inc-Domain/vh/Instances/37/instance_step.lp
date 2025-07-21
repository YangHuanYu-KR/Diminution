#program step(t).

goal(wash_dishes_by_hand(C), T0, t, 1) :- subtask(wash_dishes_by_hand(C)), subtask(wash_dishes_by_hand(C), walk(O1_1), 1), goal(subtask(wash_dishes_by_hand(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(wash_dishes_by_hand(C), find(O2_1), 2), goal(subtask(wash_dishes_by_hand(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(wash_dishes_by_hand(C), putin(O3_1, O3_2), 3), goal(subtask(wash_dishes_by_hand(C), putin(O3_1, O3_2), 3), T2), T2 <= t, time(T2).
goal(wash_dishes_by_hand(C), T3, t, 2) :- subtask(wash_dishes_by_hand(C), grab(O4_1), 4), goal(subtask(wash_dishes_by_hand(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(wash_dishes_by_hand(C), putin(O5_1, O5_2), 5), goal(subtask(wash_dishes_by_hand(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(wash_dishes_by_hand(C), grab(O6_1), 6), goal(subtask(wash_dishes_by_hand(C), grab(O6_1), 6), T5), T5 <= t, time(T5).
goal(wash_dishes_by_hand(C), T0, t, 3) :- goal(wash_dishes_by_hand(C), T0, T2, 1), goal(wash_dishes_by_hand(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(wash_dishes_by_hand(C), T6, t, 4) :- subtask(wash_dishes_by_hand(C), putin(O7_1, O7_2), 7), goal(subtask(wash_dishes_by_hand(C), putin(O7_1, O7_2), 7), T6), T6 <= T7, time(T6), subtask(wash_dishes_by_hand(C), wash(O8_1), 8), goal(subtask(wash_dishes_by_hand(C), wash(O8_1), 8), T7), T7 <= T8, time(T7), subtask(wash_dishes_by_hand(C), putin(O9_1, O9_2), 9), goal(subtask(wash_dishes_by_hand(C), putin(O9_1, O9_2), 9), T8), T8 <= t, time(T8).
goal(wash_dishes_by_hand(C), T0, t, 5) :- goal(wash_dishes_by_hand(C), T0, T5, 3), goal(wash_dishes_by_hand(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(wash_dishes_by_hand(C), T9, t, 6) :- subtask(wash_dishes_by_hand(C), putin(O10_1, O10_2), 10), goal(subtask(wash_dishes_by_hand(C), putin(O10_1, O10_2), 10), T9), T9 <= t, time(T9).
goal(wash_dishes_by_hand(C), t) :- goal(wash_dishes_by_hand(C), T0, T8, 5), goal(wash_dishes_by_hand(C), T9, t, 6), time(T0), time(T8), time(T9), T8 <= T9.

goal(subtask(wash_dishes_by_hand(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(wash_dishes_by_hand(C), walk(O), 1).
goal(subtask(wash_dishes_by_hand(C), find(O), 2), t) :- goal(C, find(O), t), subtask(wash_dishes_by_hand(C), find(O), 2).
goal(subtask(wash_dishes_by_hand(C), putin(O1, O2), 3), t) :- goal(C, putin(O1, O2), t), subtask(wash_dishes_by_hand(C), putin(O1, O2), 3).
goal(subtask(wash_dishes_by_hand(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(wash_dishes_by_hand(C), grab(O), 4).
goal(subtask(wash_dishes_by_hand(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(wash_dishes_by_hand(C), putin(O1, O2), 5).
goal(subtask(wash_dishes_by_hand(C), grab(O), 6), t) :- goal(C, grab(O), t), subtask(wash_dishes_by_hand(C), grab(O), 6).
goal(subtask(wash_dishes_by_hand(C), putin(O1, O2), 7), t) :- goal(C, putin(O1, O2), t), subtask(wash_dishes_by_hand(C), putin(O1, O2), 7).
goal(subtask(wash_dishes_by_hand(C), wash(O), 8), t) :- goal(C, wash(O), t), subtask(wash_dishes_by_hand(C), wash(O), 8).
goal(subtask(wash_dishes_by_hand(C), putin(O1, O2), 9), t) :- goal(C, putin(O1, O2), t), subtask(wash_dishes_by_hand(C), putin(O1, O2), 9).
goal(subtask(wash_dishes_by_hand(C), putin(O1, O2), 10), t) :- goal(C, putin(O1, O2), t), subtask(wash_dishes_by_hand(C), putin(O1, O2), 10).
