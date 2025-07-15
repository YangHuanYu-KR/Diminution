#program step(t).

goal(hand_washing(C), T0, t, 1) :- subtask(hand_washing(C)), subtask(hand_washing(C), walk(O1_1), 1), goal(subtask(hand_washing(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(hand_washing(C), touch(O2_1), 2), goal(subtask(hand_washing(C), touch(O2_1), 2), T1), T1 <= T2, time(T1), subtask(hand_washing(C), switchon(O3_1), 3), goal(subtask(hand_washing(C), switchon(O3_1), 3), T2), T2 <= t, time(T2).
goal(hand_washing(C), T3, t, 2) :- subtask(hand_washing(C), putin(O4_1, O4_2), 4), goal(subtask(hand_washing(C), putin(O4_1, O4_2), 4), T3), T3 <= T4, time(T3), subtask(hand_washing(C), wash(O5_1), 5), goal(subtask(hand_washing(C), wash(O5_1), 5), T4), T4 <= T5, time(T4), subtask(hand_washing(C), touch(O6_1), 6), goal(subtask(hand_washing(C), touch(O6_1), 6), T5), T5 <= t, time(T5).
goal(hand_washing(C), T0, t, 3) :- goal(hand_washing(C), T0, T2, 1), goal(hand_washing(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(hand_washing(C), T6, t, 4) :- subtask(hand_washing(C), switchoff(O7_1), 7), goal(subtask(hand_washing(C), switchoff(O7_1), 7), T6), T6 <= T7, time(T6), subtask(hand_washing(C), grab(O8_1), 8), goal(subtask(hand_washing(C), grab(O8_1), 8), T7), T7 <= T8, time(T7), subtask(hand_washing(C), touch(O9_1), 9), goal(subtask(hand_washing(C), touch(O9_1), 9), T8), T8 <= t, time(T8).
goal(hand_washing(C), t) :- goal(hand_washing(C), T0, T5, 3), goal(hand_washing(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(hand_washing(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(hand_washing(C), walk(O), 1).
goal(subtask(hand_washing(C), touch(O), 2), t) :- goal(C, touch(O), t), subtask(hand_washing(C), touch(O), 2).
goal(subtask(hand_washing(C), switchon(O), 3), t) :- goal(C, switchon(O), t), subtask(hand_washing(C), switchon(O), 3).
goal(subtask(hand_washing(C), putin(O1, O2), 4), t) :- goal(C, putin(O1, O2), t), subtask(hand_washing(C), putin(O1, O2), 4).
goal(subtask(hand_washing(C), wash(O), 5), t) :- goal(C, wash(O), t), subtask(hand_washing(C), wash(O), 5).
goal(subtask(hand_washing(C), touch(O), 6), t) :- goal(C, touch(O), t), subtask(hand_washing(C), touch(O), 6).
goal(subtask(hand_washing(C), switchoff(O), 7), t) :- goal(C, switchoff(O), t), subtask(hand_washing(C), switchoff(O), 7).
goal(subtask(hand_washing(C), grab(O), 8), t) :- goal(C, grab(O), t), subtask(hand_washing(C), grab(O), 8).
goal(subtask(hand_washing(C), touch(O), 9), t) :- goal(C, touch(O), t), subtask(hand_washing(C), touch(O), 9).
