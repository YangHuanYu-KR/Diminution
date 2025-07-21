#program step(t).

goal(eat_snacks_and_drink_tea(C), T0, t, 1) :- subtask(eat_snacks_and_drink_tea(C)), subtask(eat_snacks_and_drink_tea(C), walk(O1_1), 1), goal(subtask(eat_snacks_and_drink_tea(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(eat_snacks_and_drink_tea(C), walk(O2_1), 2), goal(subtask(eat_snacks_and_drink_tea(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(eat_snacks_and_drink_tea(C), grab(O3_1), 3), goal(subtask(eat_snacks_and_drink_tea(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(eat_snacks_and_drink_tea(C), T3, t, 2) :- subtask(eat_snacks_and_drink_tea(C), find(O4_1), 4), goal(subtask(eat_snacks_and_drink_tea(C), find(O4_1), 4), T3), T3 <= T4, time(T3), subtask(eat_snacks_and_drink_tea(C), open(O5_1), 5), goal(subtask(eat_snacks_and_drink_tea(C), open(O5_1), 5), T4), T4 <= T5, time(T4), subtask(eat_snacks_and_drink_tea(C), close(O6_1), 6), goal(subtask(eat_snacks_and_drink_tea(C), close(O6_1), 6), T5), T5 <= t, time(T5).
goal(eat_snacks_and_drink_tea(C), t) :- goal(eat_snacks_and_drink_tea(C), T0, T2, 1), goal(eat_snacks_and_drink_tea(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(eat_snacks_and_drink_tea(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(eat_snacks_and_drink_tea(C), walk(O), 1).
goal(subtask(eat_snacks_and_drink_tea(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(eat_snacks_and_drink_tea(C), walk(O), 2).
goal(subtask(eat_snacks_and_drink_tea(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(eat_snacks_and_drink_tea(C), grab(O), 3).
goal(subtask(eat_snacks_and_drink_tea(C), find(O), 4), t) :- goal(C, find(O), t), subtask(eat_snacks_and_drink_tea(C), find(O), 4).
goal(subtask(eat_snacks_and_drink_tea(C), open(O), 5), t) :- goal(C, open(O), t), subtask(eat_snacks_and_drink_tea(C), open(O), 5).
goal(subtask(eat_snacks_and_drink_tea(C), close(O), 6), t) :- goal(C, close(O), t), subtask(eat_snacks_and_drink_tea(C), close(O), 6).
