#program step(t).

goal(walk_to_room(C), T0, t, 1) :- subtask(walk_to_room(C)), subtask(walk_to_room(C), find(O1_1), 1), goal(subtask(walk_to_room(C), find(O1_1), 1), T0), T0 <= T1, time(T0), subtask(walk_to_room(C), open(O2_1), 2), goal(subtask(walk_to_room(C), open(O2_1), 2), T1), T1 <= T2, time(T1), subtask(walk_to_room(C), find(O3_1), 3), goal(subtask(walk_to_room(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(walk_to_room(C), T3, t, 2) :- subtask(walk_to_room(C), open(O4_1), 4), goal(subtask(walk_to_room(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(walk_to_room(C), walk(O5_1), 5), goal(subtask(walk_to_room(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(walk_to_room(C), run(O6_1), 6), goal(subtask(walk_to_room(C), run(O6_1), 6), T5), T5 <= t, time(T5).
goal(walk_to_room(C), T0, t, 3) :- goal(walk_to_room(C), T0, T2, 1), goal(walk_to_room(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(walk_to_room(C), T6, t, 4) :- subtask(walk_to_room(C), sit(O7_1), 7), goal(subtask(walk_to_room(C), sit(O7_1), 7), T6), T6 <= T7, time(T6), subtask(walk_to_room(C), standup, 8), goal(subtask(walk_to_room(C), standup, 8), T7), T7 <= T8, time(T7), subtask(walk_to_room(C), lie(O9_1), 9), goal(subtask(walk_to_room(C), lie(O9_1), 9), T8), T8 <= t, time(T8).
goal(walk_to_room(C), T0, t, 5) :- goal(walk_to_room(C), T0, T5, 3), goal(walk_to_room(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(walk_to_room(C), T9, t, 6) :- subtask(walk_to_room(C), grab(O10_1), 10), goal(subtask(walk_to_room(C), grab(O10_1), 10), T9), T9 <= T10, time(T9), subtask(walk_to_room(C), open(O11_1), 11), goal(subtask(walk_to_room(C), open(O11_1), 11), T10), T10 <= T11, time(T10), subtask(walk_to_room(C), close(O12_1), 12), goal(subtask(walk_to_room(C), close(O12_1), 12), T11), T11 <= t, time(T11).
goal(walk_to_room(C), T0, t, 7) :- goal(walk_to_room(C), T0, T8, 5), goal(walk_to_room(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(walk_to_room(C), T12, t, 8) :- subtask(walk_to_room(C), drop(O13_1), 13), goal(subtask(walk_to_room(C), drop(O13_1), 13), T12), T12 <= T13, time(T12), subtask(walk_to_room(C), turnto(O14_1), 14), goal(subtask(walk_to_room(C), turnto(O14_1), 14), T13), T13 <= T14, time(T13), subtask(walk_to_room(C), lookat(O15_1), 15), goal(subtask(walk_to_room(C), lookat(O15_1), 15), T14), T14 <= t, time(T14).
goal(walk_to_room(C), T0, t, 9) :- goal(walk_to_room(C), T0, T11, 7), goal(walk_to_room(C), T12, T14, 8), time(T0), time(T11), time(T12), T11 <= T12, time(T14), T12 <= t.
goal(walk_to_room(C), T15, t, 10) :- subtask(walk_to_room(C), drink(O16_1), 16), goal(subtask(walk_to_room(C), drink(O16_1), 16), T15), T15 <= T16, time(T15), subtask(walk_to_room(C), watch(O17_1), 17), goal(subtask(walk_to_room(C), watch(O17_1), 17), T16), T16 <= T17, time(T16), subtask(walk_to_room(C), read(O18_1), 18), goal(subtask(walk_to_room(C), read(O18_1), 18), T17), T17 <= t, time(T17).
goal(walk_to_room(C), T0, t, 11) :- goal(walk_to_room(C), T0, T14, 9), goal(walk_to_room(C), T15, T17, 10), time(T0), time(T14), time(T15), T14 <= T15, time(T17), T15 <= t.
goal(walk_to_room(C), T18, t, 12) :- subtask(walk_to_room(C), touch(O19_1), 19), goal(subtask(walk_to_room(C), touch(O19_1), 19), T18), T18 <= T19, time(T18), subtask(walk_to_room(C), switchon(O20_1), 20), goal(subtask(walk_to_room(C), switchon(O20_1), 20), T19), T19 <= T20, time(T19), subtask(walk_to_room(C), switchoff(O21_1), 21), goal(subtask(walk_to_room(C), switchoff(O21_1), 21), T20), T20 <= t, time(T20).
goal(walk_to_room(C), T0, t, 13) :- goal(walk_to_room(C), T0, T17, 11), goal(walk_to_room(C), T18, T20, 12), time(T0), time(T17), time(T18), T17 <= T18, time(T20), T18 <= t.
goal(walk_to_room(C), T21, t, 14) :- subtask(walk_to_room(C), plugin(O22_1), 22), goal(subtask(walk_to_room(C), plugin(O22_1), 22), T21), T21 <= T22, time(T21), subtask(walk_to_room(C), plugout(O23_1), 23), goal(subtask(walk_to_room(C), plugout(O23_1), 23), T22), T22 <= T23, time(T22), subtask(walk_to_room(C), wash(O24_1), 24), goal(subtask(walk_to_room(C), wash(O24_1), 24), T23), T23 <= t, time(T23).
goal(walk_to_room(C), T0, t, 15) :- goal(walk_to_room(C), T0, T20, 13), goal(walk_to_room(C), T21, T23, 14), time(T0), time(T20), time(T21), T20 <= T21, time(T23), T21 <= t.
goal(walk_to_room(C), T24, t, 16) :- subtask(walk_to_room(C), cut(O25_1), 25), goal(subtask(walk_to_room(C), cut(O25_1), 25), T24), T24 <= T25, time(T24), subtask(walk_to_room(C), eat(O26_1), 26), goal(subtask(walk_to_room(C), eat(O26_1), 26), T25), T25 <= t, time(T25).
goal(walk_to_room(C), t) :- goal(walk_to_room(C), T0, T23, 15), goal(walk_to_room(C), T24, t, 16), time(T0), time(T23), time(T24), T23 <= T24.

goal(subtask(walk_to_room(C), find(O), 1), t) :- goal(C, find(O), t), subtask(walk_to_room(C), find(O), 1).
goal(subtask(walk_to_room(C), open(O), 2), t) :- goal(C, open(O), t), subtask(walk_to_room(C), open(O), 2).
goal(subtask(walk_to_room(C), find(O), 3), t) :- goal(C, find(O), t), subtask(walk_to_room(C), find(O), 3).
goal(subtask(walk_to_room(C), open(O), 4), t) :- goal(C, open(O), t), subtask(walk_to_room(C), open(O), 4).
goal(subtask(walk_to_room(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(walk_to_room(C), walk(O), 5).
goal(subtask(walk_to_room(C), run(O), 6), t) :- goal(C, run(O), t), subtask(walk_to_room(C), run(O), 6).
goal(subtask(walk_to_room(C), sit(O), 7), t) :- goal(C, sit(O), t), subtask(walk_to_room(C), sit(O), 7).
goal(subtask(walk_to_room(C), standup, 8), t) :- goal(C, standup, t), subtask(walk_to_room(C), standup, 8).
goal(subtask(walk_to_room(C), lie(O), 9), t) :- goal(C, lie(O), t), subtask(walk_to_room(C), lie(O), 9).
goal(subtask(walk_to_room(C), grab(O), 10), t) :- goal(C, grab(O), t), subtask(walk_to_room(C), grab(O), 10).
goal(subtask(walk_to_room(C), open(O), 11), t) :- goal(C, open(O), t), subtask(walk_to_room(C), open(O), 11).
goal(subtask(walk_to_room(C), close(O), 12), t) :- goal(C, close(O), t), subtask(walk_to_room(C), close(O), 12).
goal(subtask(walk_to_room(C), drop(O), 13), t) :- goal(C, drop(O), t), subtask(walk_to_room(C), drop(O), 13).
goal(subtask(walk_to_room(C), turnto(O), 14), t) :- goal(C, turnto(O), t), subtask(walk_to_room(C), turnto(O), 14).
goal(subtask(walk_to_room(C), lookat(O), 15), t) :- goal(C, lookat(O), t), subtask(walk_to_room(C), lookat(O), 15).
goal(subtask(walk_to_room(C), drink(O), 16), t) :- goal(C, drink(O), t), subtask(walk_to_room(C), drink(O), 16).
goal(subtask(walk_to_room(C), watch(O), 17), t) :- goal(C, watch(O), t), subtask(walk_to_room(C), watch(O), 17).
goal(subtask(walk_to_room(C), read(O), 18), t) :- goal(C, read(O), t), subtask(walk_to_room(C), read(O), 18).
goal(subtask(walk_to_room(C), touch(O), 19), t) :- goal(C, touch(O), t), subtask(walk_to_room(C), touch(O), 19).
goal(subtask(walk_to_room(C), switchon(O), 20), t) :- goal(C, switchon(O), t), subtask(walk_to_room(C), switchon(O), 20).
goal(subtask(walk_to_room(C), switchoff(O), 21), t) :- goal(C, switchoff(O), t), subtask(walk_to_room(C), switchoff(O), 21).
goal(subtask(walk_to_room(C), plugin(O), 22), t) :- goal(C, plugin(O), t), subtask(walk_to_room(C), plugin(O), 22).
goal(subtask(walk_to_room(C), plugout(O), 23), t) :- goal(C, plugout(O), t), subtask(walk_to_room(C), plugout(O), 23).
goal(subtask(walk_to_room(C), wash(O), 24), t) :- goal(C, wash(O), t), subtask(walk_to_room(C), wash(O), 24).
goal(subtask(walk_to_room(C), cut(O), 25), t) :- goal(C, cut(O), t), subtask(walk_to_room(C), cut(O), 25).
goal(subtask(walk_to_room(C), eat(O), 26), t) :- goal(C, eat(O), t), subtask(walk_to_room(C), eat(O), 26).
