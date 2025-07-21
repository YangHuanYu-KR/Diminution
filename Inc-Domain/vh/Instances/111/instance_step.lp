#program step(t).

goal(hand_washing(C), t) :- subtask(hand_washing(C)), subtask(hand_washing(C), walk(O1_1), 1), goal(subtask(hand_washing(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(hand_washing(C), find(O2_1), 2), goal(subtask(hand_washing(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(hand_washing(C), wash(O3_1), 3), goal(subtask(hand_washing(C), wash(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(hand_washing(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(hand_washing(C), walk(O), 1).
goal(subtask(hand_washing(C), find(O), 2), t) :- goal(C, find(O), t), subtask(hand_washing(C), find(O), 2).
goal(subtask(hand_washing(C), wash(O), 3), t) :- goal(C, wash(O), t), subtask(hand_washing(C), wash(O), 3).
