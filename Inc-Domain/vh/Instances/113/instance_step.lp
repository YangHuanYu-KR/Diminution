#program step(t).

goal(iron_shirt(C), T0, t, 1) :- subtask(iron_shirt(C)), subtask(iron_shirt(C), walk(O1_1), 1), goal(subtask(iron_shirt(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(iron_shirt(C), find(O2_1), 2), goal(subtask(iron_shirt(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(iron_shirt(C), find(O3_1), 3), goal(subtask(iron_shirt(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(iron_shirt(C), T3, t, 2) :- subtask(iron_shirt(C), walk(O4_1), 4), goal(subtask(iron_shirt(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(iron_shirt(C), plugin(O5_1), 5), goal(subtask(iron_shirt(C), plugin(O5_1), 5), T4), T4 <= T5, time(T4), subtask(iron_shirt(C), touch(O6_1), 6), goal(subtask(iron_shirt(C), touch(O6_1), 6), T5), T5 <= t, time(T5).
goal(iron_shirt(C), T0, t, 3) :- goal(iron_shirt(C), T0, T2, 1), goal(iron_shirt(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(iron_shirt(C), T6, t, 4) :- subtask(iron_shirt(C), wash(O7_1), 7), goal(subtask(iron_shirt(C), wash(O7_1), 7), T6), T6 <= t, time(T6).
goal(iron_shirt(C), t) :- goal(iron_shirt(C), T0, T5, 3), goal(iron_shirt(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(iron_shirt(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(iron_shirt(C), walk(O), 1).
goal(subtask(iron_shirt(C), find(O), 2), t) :- goal(C, find(O), t), subtask(iron_shirt(C), find(O), 2).
goal(subtask(iron_shirt(C), find(O), 3), t) :- goal(C, find(O), t), subtask(iron_shirt(C), find(O), 3).
goal(subtask(iron_shirt(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(iron_shirt(C), walk(O), 4).
goal(subtask(iron_shirt(C), plugin(O), 5), t) :- goal(C, plugin(O), t), subtask(iron_shirt(C), plugin(O), 5).
goal(subtask(iron_shirt(C), touch(O), 6), t) :- goal(C, touch(O), t), subtask(iron_shirt(C), touch(O), 6).
goal(subtask(iron_shirt(C), wash(O), 7), t) :- goal(C, wash(O), t), subtask(iron_shirt(C), wash(O), 7).
