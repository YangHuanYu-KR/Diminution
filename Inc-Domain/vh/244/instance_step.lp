#program step(t).

goal(hang_with_friends(C), t) :- subtask(hang_with_friends(C)), subtask(hang_with_friends(C), walk(O1_1), 1), goal(subtask(hang_with_friends(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(hang_with_friends(C), walk(O2_1), 2), goal(subtask(hang_with_friends(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(hang_with_friends(C), sit(O3_1), 3), goal(subtask(hang_with_friends(C), sit(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(hang_with_friends(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(hang_with_friends(C), walk(O), 1).
goal(subtask(hang_with_friends(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(hang_with_friends(C), walk(O), 2).
goal(subtask(hang_with_friends(C), sit(O), 3), t) :- goal(C, sit(O), t), subtask(hang_with_friends(C), sit(O), 3).
