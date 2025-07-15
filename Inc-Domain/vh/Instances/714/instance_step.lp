#program step(t).

goal(write_story(C), T0, t, 1) :- subtask(write_story(C)), subtask(write_story(C), walk(O1_1), 1), goal(subtask(write_story(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(write_story(C), standup, 2), goal(subtask(write_story(C), standup, 2), T1), T1 <= T2, time(T1), subtask(write_story(C), sit(O3_1), 3), goal(subtask(write_story(C), sit(O3_1), 3), T2), T2 <= t, time(T2).
goal(write_story(C), T3, t, 2) :- subtask(write_story(C), lie(O4_1), 4), goal(subtask(write_story(C), lie(O4_1), 4), T3), T3 <= T4, time(T3), subtask(write_story(C), grab(O5_1), 5), goal(subtask(write_story(C), grab(O5_1), 5), T4), T4 <= T5, time(T4), subtask(write_story(C), open(O6_1), 6), goal(subtask(write_story(C), open(O6_1), 6), T5), T5 <= t, time(T5).
goal(write_story(C), T0, t, 3) :- goal(write_story(C), T0, T2, 1), goal(write_story(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(write_story(C), T6, t, 4) :- subtask(write_story(C), close(O7_1), 7), goal(subtask(write_story(C), close(O7_1), 7), T6), T6 <= T7, time(T6), subtask(write_story(C), drop(O8_1), 8), goal(subtask(write_story(C), drop(O8_1), 8), T7), T7 <= T8, time(T7), subtask(write_story(C), turnto(O9_1), 9), goal(subtask(write_story(C), turnto(O9_1), 9), T8), T8 <= t, time(T8).
goal(write_story(C), T0, t, 5) :- goal(write_story(C), T0, T5, 3), goal(write_story(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(write_story(C), T9, t, 6) :- subtask(write_story(C), lookat(O10_1), 10), goal(subtask(write_story(C), lookat(O10_1), 10), T9), T9 <= T10, time(T9), subtask(write_story(C), drink(O11_1), 11), goal(subtask(write_story(C), drink(O11_1), 11), T10), T10 <= T11, time(T10), subtask(write_story(C), watch(O12_1), 12), goal(subtask(write_story(C), watch(O12_1), 12), T11), T11 <= t, time(T11).
goal(write_story(C), T0, t, 7) :- goal(write_story(C), T0, T8, 5), goal(write_story(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(write_story(C), T12, t, 8) :- subtask(write_story(C), read(O13_1), 13), goal(subtask(write_story(C), read(O13_1), 13), T12), T12 <= T13, time(T12), subtask(write_story(C), touch(O14_1), 14), goal(subtask(write_story(C), touch(O14_1), 14), T13), T13 <= T14, time(T13), subtask(write_story(C), switchon(O15_1), 15), goal(subtask(write_story(C), switchon(O15_1), 15), T14), T14 <= t, time(T14).
goal(write_story(C), T0, t, 9) :- goal(write_story(C), T0, T11, 7), goal(write_story(C), T12, T14, 8), time(T0), time(T11), time(T12), T11 <= T12, time(T14), T12 <= t.
goal(write_story(C), T15, t, 10) :- subtask(write_story(C), switchoff(O16_1), 16), goal(subtask(write_story(C), switchoff(O16_1), 16), T15), T15 <= T16, time(T15), subtask(write_story(C), plugin(O17_1), 17), goal(subtask(write_story(C), plugin(O17_1), 17), T16), T16 <= T17, time(T16), subtask(write_story(C), plugout(O18_1), 18), goal(subtask(write_story(C), plugout(O18_1), 18), T17), T17 <= t, time(T17).
goal(write_story(C), T0, t, 11) :- goal(write_story(C), T0, T14, 9), goal(write_story(C), T15, T17, 10), time(T0), time(T14), time(T15), T14 <= T15, time(T17), T15 <= t.
goal(write_story(C), T18, t, 12) :- subtask(write_story(C), wash(O19_1), 19), goal(subtask(write_story(C), wash(O19_1), 19), T18), T18 <= T19, time(T18), subtask(write_story(C), cut(O20_1), 20), goal(subtask(write_story(C), cut(O20_1), 20), T19), T19 <= T20, time(T19), subtask(write_story(C), eat(O21_1), 21), goal(subtask(write_story(C), eat(O21_1), 21), T20), T20 <= t, time(T20).
goal(write_story(C), t) :- goal(write_story(C), T0, T17, 11), goal(write_story(C), T18, t, 12), time(T0), time(T17), time(T18), T17 <= T18.

goal(subtask(write_story(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(write_story(C), walk(O), 1).
goal(subtask(write_story(C), standup, 2), t) :- goal(C, standup, t), subtask(write_story(C), standup, 2).
goal(subtask(write_story(C), sit(O), 3), t) :- goal(C, sit(O), t), subtask(write_story(C), sit(O), 3).
goal(subtask(write_story(C), lie(O), 4), t) :- goal(C, lie(O), t), subtask(write_story(C), lie(O), 4).
goal(subtask(write_story(C), grab(O), 5), t) :- goal(C, grab(O), t), subtask(write_story(C), grab(O), 5).
goal(subtask(write_story(C), open(O), 6), t) :- goal(C, open(O), t), subtask(write_story(C), open(O), 6).
goal(subtask(write_story(C), close(O), 7), t) :- goal(C, close(O), t), subtask(write_story(C), close(O), 7).
goal(subtask(write_story(C), drop(O), 8), t) :- goal(C, drop(O), t), subtask(write_story(C), drop(O), 8).
goal(subtask(write_story(C), turnto(O), 9), t) :- goal(C, turnto(O), t), subtask(write_story(C), turnto(O), 9).
goal(subtask(write_story(C), lookat(O), 10), t) :- goal(C, lookat(O), t), subtask(write_story(C), lookat(O), 10).
goal(subtask(write_story(C), drink(O), 11), t) :- goal(C, drink(O), t), subtask(write_story(C), drink(O), 11).
goal(subtask(write_story(C), watch(O), 12), t) :- goal(C, watch(O), t), subtask(write_story(C), watch(O), 12).
goal(subtask(write_story(C), read(O), 13), t) :- goal(C, read(O), t), subtask(write_story(C), read(O), 13).
goal(subtask(write_story(C), touch(O), 14), t) :- goal(C, touch(O), t), subtask(write_story(C), touch(O), 14).
goal(subtask(write_story(C), switchon(O), 15), t) :- goal(C, switchon(O), t), subtask(write_story(C), switchon(O), 15).
goal(subtask(write_story(C), switchoff(O), 16), t) :- goal(C, switchoff(O), t), subtask(write_story(C), switchoff(O), 16).
goal(subtask(write_story(C), plugin(O), 17), t) :- goal(C, plugin(O), t), subtask(write_story(C), plugin(O), 17).
goal(subtask(write_story(C), plugout(O), 18), t) :- goal(C, plugout(O), t), subtask(write_story(C), plugout(O), 18).
goal(subtask(write_story(C), wash(O), 19), t) :- goal(C, wash(O), t), subtask(write_story(C), wash(O), 19).
goal(subtask(write_story(C), cut(O), 20), t) :- goal(C, cut(O), t), subtask(write_story(C), cut(O), 20).
goal(subtask(write_story(C), eat(O), 21), t) :- goal(C, eat(O), t), subtask(write_story(C), eat(O), 21).
