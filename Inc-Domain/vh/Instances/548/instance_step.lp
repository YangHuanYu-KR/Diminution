#program step(t).

goal(hand_washing(C), T0, t, 1) :- subtask(hand_washing(C)), subtask(hand_washing(C), find(O1_1), 1), goal(subtask(hand_washing(C), find(O1_1), 1), T0), T0 <= T1, time(T0), subtask(hand_washing(C), open(O2_1), 2), goal(subtask(hand_washing(C), open(O2_1), 2), T1), T1 <= T2, time(T1), subtask(hand_washing(C), find(O3_1), 3), goal(subtask(hand_washing(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(hand_washing(C), T3, t, 2) :- subtask(hand_washing(C), putin(O4_1, O4_2), 4), goal(subtask(hand_washing(C), putin(O4_1, O4_2), 4), T3), T3 <= T4, time(T3), subtask(hand_washing(C), walk(O5_1), 5), goal(subtask(hand_washing(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(hand_washing(C), walk(O6_1), 6), goal(subtask(hand_washing(C), walk(O6_1), 6), T5), T5 <= t, time(T5).
goal(hand_washing(C), t) :- goal(hand_washing(C), T0, T2, 1), goal(hand_washing(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(hand_washing(C), find(O), 1), t) :- goal(C, find(O), t), subtask(hand_washing(C), find(O), 1).
goal(subtask(hand_washing(C), open(O), 2), t) :- goal(C, open(O), t), subtask(hand_washing(C), open(O), 2).
goal(subtask(hand_washing(C), find(O), 3), t) :- goal(C, find(O), t), subtask(hand_washing(C), find(O), 3).
goal(subtask(hand_washing(C), putin(O1, O2), 4), t) :- goal(C, putin(O1, O2), t), subtask(hand_washing(C), putin(O1, O2), 4).
goal(subtask(hand_washing(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(hand_washing(C), walk(O), 5).
goal(subtask(hand_washing(C), walk(O), 6), t) :- goal(C, walk(O), t), subtask(hand_washing(C), walk(O), 6).
