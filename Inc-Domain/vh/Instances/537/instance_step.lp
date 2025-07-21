#program step(t).

goal(sleep(C), T0, t, 1) :- subtask(sleep(C)), subtask(sleep(C), walk(O1_1), 1), goal(subtask(sleep(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(sleep(C), walk(O2_1), 2), goal(subtask(sleep(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(sleep(C), find(O3_1), 3), goal(subtask(sleep(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(sleep(C), T3, t, 2) :- subtask(sleep(C), find(O4_1), 4), goal(subtask(sleep(C), find(O4_1), 4), T3), T3 <= T4, time(T3), subtask(sleep(C), find(O5_1), 5), goal(subtask(sleep(C), find(O5_1), 5), T4), T4 <= T5, time(T4), subtask(sleep(C), find(O6_1), 6), goal(subtask(sleep(C), find(O6_1), 6), T5), T5 <= t, time(T5).
goal(sleep(C), T0, t, 3) :- goal(sleep(C), T0, T2, 1), goal(sleep(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(sleep(C), T6, t, 4) :- subtask(sleep(C), drop(O7_1), 7), goal(subtask(sleep(C), drop(O7_1), 7), T6), T6 <= T7, time(T6), subtask(sleep(C), turnto(O8_1), 8), goal(subtask(sleep(C), turnto(O8_1), 8), T7), T7 <= T8, time(T7), subtask(sleep(C), lookat(O9_1), 9), goal(subtask(sleep(C), lookat(O9_1), 9), T8), T8 <= t, time(T8).
goal(sleep(C), T0, t, 5) :- goal(sleep(C), T0, T5, 3), goal(sleep(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(sleep(C), T9, t, 6) :- subtask(sleep(C), drink(O10_1), 10), goal(subtask(sleep(C), drink(O10_1), 10), T9), T9 <= T10, time(T9), subtask(sleep(C), watch(O11_1), 11), goal(subtask(sleep(C), watch(O11_1), 11), T10), T10 <= T11, time(T10), subtask(sleep(C), read(O12_1), 12), goal(subtask(sleep(C), read(O12_1), 12), T11), T11 <= t, time(T11).
goal(sleep(C), T0, t, 7) :- goal(sleep(C), T0, T8, 5), goal(sleep(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(sleep(C), T12, t, 8) :- subtask(sleep(C), touch(O13_1), 13), goal(subtask(sleep(C), touch(O13_1), 13), T12), T12 <= T13, time(T12), subtask(sleep(C), switchon(O14_1), 14), goal(subtask(sleep(C), switchon(O14_1), 14), T13), T13 <= T14, time(T13), subtask(sleep(C), plugin(O15_1), 15), goal(subtask(sleep(C), plugin(O15_1), 15), T14), T14 <= t, time(T14).
goal(sleep(C), T0, t, 9) :- goal(sleep(C), T0, T11, 7), goal(sleep(C), T12, T14, 8), time(T0), time(T11), time(T12), T11 <= T12, time(T14), T12 <= t.
goal(sleep(C), T15, t, 10) :- subtask(sleep(C), wash(O16_1), 16), goal(subtask(sleep(C), wash(O16_1), 16), T15), T15 <= T16, time(T15), subtask(sleep(C), cut(O17_1), 17), goal(subtask(sleep(C), cut(O17_1), 17), T16), T16 <= T17, time(T16), subtask(sleep(C), eat(O18_1), 18), goal(subtask(sleep(C), eat(O18_1), 18), T17), T17 <= t, time(T17).
goal(sleep(C), t) :- goal(sleep(C), T0, T14, 9), goal(sleep(C), T15, t, 10), time(T0), time(T14), time(T15), T14 <= T15.

goal(subtask(sleep(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(sleep(C), walk(O), 1).
goal(subtask(sleep(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(sleep(C), walk(O), 2).
goal(subtask(sleep(C), find(O), 3), t) :- goal(C, find(O), t), subtask(sleep(C), find(O), 3).
goal(subtask(sleep(C), find(O), 4), t) :- goal(C, find(O), t), subtask(sleep(C), find(O), 4).
goal(subtask(sleep(C), find(O), 5), t) :- goal(C, find(O), t), subtask(sleep(C), find(O), 5).
goal(subtask(sleep(C), find(O), 6), t) :- goal(C, find(O), t), subtask(sleep(C), find(O), 6).
goal(subtask(sleep(C), drop(O), 7), t) :- goal(C, drop(O), t), subtask(sleep(C), drop(O), 7).
goal(subtask(sleep(C), turnto(O), 8), t) :- goal(C, turnto(O), t), subtask(sleep(C), turnto(O), 8).
goal(subtask(sleep(C), lookat(O), 9), t) :- goal(C, lookat(O), t), subtask(sleep(C), lookat(O), 9).
goal(subtask(sleep(C), drink(O), 10), t) :- goal(C, drink(O), t), subtask(sleep(C), drink(O), 10).
goal(subtask(sleep(C), watch(O), 11), t) :- goal(C, watch(O), t), subtask(sleep(C), watch(O), 11).
goal(subtask(sleep(C), read(O), 12), t) :- goal(C, read(O), t), subtask(sleep(C), read(O), 12).
goal(subtask(sleep(C), touch(O), 13), t) :- goal(C, touch(O), t), subtask(sleep(C), touch(O), 13).
goal(subtask(sleep(C), switchon(O), 14), t) :- goal(C, switchon(O), t), subtask(sleep(C), switchon(O), 14).
goal(subtask(sleep(C), plugin(O), 15), t) :- goal(C, plugin(O), t), subtask(sleep(C), plugin(O), 15).
goal(subtask(sleep(C), wash(O), 16), t) :- goal(C, wash(O), t), subtask(sleep(C), wash(O), 16).
goal(subtask(sleep(C), cut(O), 17), t) :- goal(C, cut(O), t), subtask(sleep(C), cut(O), 17).
goal(subtask(sleep(C), eat(O), 18), t) :- goal(C, eat(O), t), subtask(sleep(C), eat(O), 18).
