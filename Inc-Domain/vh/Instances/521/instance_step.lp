#program step(t).

goal(settle_in(C), T0, t, 1) :- subtask(settle_in(C)), subtask(settle_in(C), walk(O1_1), 1), goal(subtask(settle_in(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(settle_in(C), grab(O2_1), 2), goal(subtask(settle_in(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(settle_in(C), find(O3_1), 3), goal(subtask(settle_in(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(settle_in(C), T3, t, 2) :- subtask(settle_in(C), open(O4_1), 4), goal(subtask(settle_in(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(settle_in(C), putin(O5_1, O5_2), 5), goal(subtask(settle_in(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(settle_in(C), close(O6_1), 6), goal(subtask(settle_in(C), close(O6_1), 6), T5), T5 <= t, time(T5).
goal(settle_in(C), T0, t, 3) :- goal(settle_in(C), T0, T2, 1), goal(settle_in(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(settle_in(C), T6, t, 4) :- subtask(settle_in(C), walk(O7_1), 7), goal(subtask(settle_in(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(settle_in(C), grab(O8_1), 8), goal(subtask(settle_in(C), grab(O8_1), 8), T7), T7 <= T8, time(T7), subtask(settle_in(C), find(O9_1), 9), goal(subtask(settle_in(C), find(O9_1), 9), T8), T8 <= t, time(T8).
goal(settle_in(C), T0, t, 5) :- goal(settle_in(C), T0, T5, 3), goal(settle_in(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(settle_in(C), T9, t, 6) :- subtask(settle_in(C), open(O10_1), 10), goal(subtask(settle_in(C), open(O10_1), 10), T9), T9 <= T10, time(T9), subtask(settle_in(C), pour(O11_1, O11_2), 11), goal(subtask(settle_in(C), pour(O11_1, O11_2), 11), T10), T10 <= T11, time(T10), subtask(settle_in(C), close(O12_1), 12), goal(subtask(settle_in(C), close(O12_1), 12), T11), T11 <= t, time(T11).
goal(settle_in(C), T0, t, 7) :- goal(settle_in(C), T0, T8, 5), goal(settle_in(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(settle_in(C), T12, t, 8) :- subtask(settle_in(C), walk(O13_1), 13), goal(subtask(settle_in(C), walk(O13_1), 13), T12), T12 <= T13, time(T12), subtask(settle_in(C), run(O14_1), 14), goal(subtask(settle_in(C), run(O14_1), 14), T13), T13 <= T14, time(T13), subtask(settle_in(C), sit(O15_1), 15), goal(subtask(settle_in(C), sit(O15_1), 15), T14), T14 <= t, time(T14).
goal(settle_in(C), T0, t, 9) :- goal(settle_in(C), T0, T11, 7), goal(settle_in(C), T12, T14, 8), time(T0), time(T11), time(T12), T11 <= T12, time(T14), T12 <= t.
goal(settle_in(C), T15, t, 10) :- subtask(settle_in(C), standup, 16), goal(subtask(settle_in(C), standup, 16), T15), T15 <= T16, time(T15), subtask(settle_in(C), lie(O17_1), 17), goal(subtask(settle_in(C), lie(O17_1), 17), T16), T16 <= T17, time(T16), subtask(settle_in(C), grab(O18_1), 18), goal(subtask(settle_in(C), grab(O18_1), 18), T17), T17 <= t, time(T17).
goal(settle_in(C), T0, t, 11) :- goal(settle_in(C), T0, T14, 9), goal(settle_in(C), T15, T17, 10), time(T0), time(T14), time(T15), T14 <= T15, time(T17), T15 <= t.
goal(settle_in(C), T18, t, 12) :- subtask(settle_in(C), open(O19_1), 19), goal(subtask(settle_in(C), open(O19_1), 19), T18), T18 <= T19, time(T18), subtask(settle_in(C), close(O20_1), 20), goal(subtask(settle_in(C), close(O20_1), 20), T19), T19 <= T20, time(T19), subtask(settle_in(C), drop(O21_1), 21), goal(subtask(settle_in(C), drop(O21_1), 21), T20), T20 <= t, time(T20).
goal(settle_in(C), T0, t, 13) :- goal(settle_in(C), T0, T17, 11), goal(settle_in(C), T18, T20, 12), time(T0), time(T17), time(T18), T17 <= T18, time(T20), T18 <= t.
goal(settle_in(C), T21, t, 14) :- subtask(settle_in(C), turnto(O22_1), 22), goal(subtask(settle_in(C), turnto(O22_1), 22), T21), T21 <= T22, time(T21), subtask(settle_in(C), lookat(O23_1), 23), goal(subtask(settle_in(C), lookat(O23_1), 23), T22), T22 <= T23, time(T22), subtask(settle_in(C), drink(O24_1), 24), goal(subtask(settle_in(C), drink(O24_1), 24), T23), T23 <= t, time(T23).
goal(settle_in(C), T0, t, 15) :- goal(settle_in(C), T0, T20, 13), goal(settle_in(C), T21, T23, 14), time(T0), time(T20), time(T21), T20 <= T21, time(T23), T21 <= t.
goal(settle_in(C), T24, t, 16) :- subtask(settle_in(C), watch(O25_1), 25), goal(subtask(settle_in(C), watch(O25_1), 25), T24), T24 <= T25, time(T24), subtask(settle_in(C), read(O26_1), 26), goal(subtask(settle_in(C), read(O26_1), 26), T25), T25 <= T26, time(T25), subtask(settle_in(C), touch(O27_1), 27), goal(subtask(settle_in(C), touch(O27_1), 27), T26), T26 <= t, time(T26).
goal(settle_in(C), T0, t, 17) :- goal(settle_in(C), T0, T23, 15), goal(settle_in(C), T24, T26, 16), time(T0), time(T23), time(T24), T23 <= T24, time(T26), T24 <= t.
goal(settle_in(C), T27, t, 18) :- subtask(settle_in(C), switchon(O28_1), 28), goal(subtask(settle_in(C), switchon(O28_1), 28), T27), T27 <= T28, time(T27), subtask(settle_in(C), switchoff(O29_1), 29), goal(subtask(settle_in(C), switchoff(O29_1), 29), T28), T28 <= T29, time(T28), subtask(settle_in(C), plugin(O30_1), 30), goal(subtask(settle_in(C), plugin(O30_1), 30), T29), T29 <= t, time(T29).
goal(settle_in(C), T0, t, 19) :- goal(settle_in(C), T0, T26, 17), goal(settle_in(C), T27, T29, 18), time(T0), time(T26), time(T27), T26 <= T27, time(T29), T27 <= t.
goal(settle_in(C), T30, t, 20) :- subtask(settle_in(C), plugout(O31_1), 31), goal(subtask(settle_in(C), plugout(O31_1), 31), T30), T30 <= T31, time(T30), subtask(settle_in(C), wash(O32_1), 32), goal(subtask(settle_in(C), wash(O32_1), 32), T31), T31 <= T32, time(T31), subtask(settle_in(C), cut(O33_1), 33), goal(subtask(settle_in(C), cut(O33_1), 33), T32), T32 <= t, time(T32).
goal(settle_in(C), T0, t, 21) :- goal(settle_in(C), T0, T29, 19), goal(settle_in(C), T30, T32, 20), time(T0), time(T29), time(T30), T29 <= T30, time(T32), T30 <= t.
goal(settle_in(C), T33, t, 22) :- subtask(settle_in(C), eat(O34_1), 34), goal(subtask(settle_in(C), eat(O34_1), 34), T33), T33 <= t, time(T33).
goal(settle_in(C), t) :- goal(settle_in(C), T0, T32, 21), goal(settle_in(C), T33, t, 22), time(T0), time(T32), time(T33), T32 <= T33.

goal(subtask(settle_in(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(settle_in(C), walk(O), 1).
goal(subtask(settle_in(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(settle_in(C), grab(O), 2).
goal(subtask(settle_in(C), find(O), 3), t) :- goal(C, find(O), t), subtask(settle_in(C), find(O), 3).
goal(subtask(settle_in(C), open(O), 4), t) :- goal(C, open(O), t), subtask(settle_in(C), open(O), 4).
goal(subtask(settle_in(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(settle_in(C), putin(O1, O2), 5).
goal(subtask(settle_in(C), close(O), 6), t) :- goal(C, close(O), t), subtask(settle_in(C), close(O), 6).
goal(subtask(settle_in(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(settle_in(C), walk(O), 7).
goal(subtask(settle_in(C), grab(O), 8), t) :- goal(C, grab(O), t), subtask(settle_in(C), grab(O), 8).
goal(subtask(settle_in(C), find(O), 9), t) :- goal(C, find(O), t), subtask(settle_in(C), find(O), 9).
goal(subtask(settle_in(C), open(O), 10), t) :- goal(C, open(O), t), subtask(settle_in(C), open(O), 10).
goal(subtask(settle_in(C), pour(O1, O2), 11), t) :- goal(C, pour(O1, O2), t), subtask(settle_in(C), pour(O1, O2), 11).
goal(subtask(settle_in(C), close(O), 12), t) :- goal(C, close(O), t), subtask(settle_in(C), close(O), 12).
goal(subtask(settle_in(C), walk(O), 13), t) :- goal(C, walk(O), t), subtask(settle_in(C), walk(O), 13).
goal(subtask(settle_in(C), run(O), 14), t) :- goal(C, run(O), t), subtask(settle_in(C), run(O), 14).
goal(subtask(settle_in(C), sit(O), 15), t) :- goal(C, sit(O), t), subtask(settle_in(C), sit(O), 15).
goal(subtask(settle_in(C), standup, 16), t) :- goal(C, standup, t), subtask(settle_in(C), standup, 16).
goal(subtask(settle_in(C), lie(O), 17), t) :- goal(C, lie(O), t), subtask(settle_in(C), lie(O), 17).
goal(subtask(settle_in(C), grab(O), 18), t) :- goal(C, grab(O), t), subtask(settle_in(C), grab(O), 18).
goal(subtask(settle_in(C), open(O), 19), t) :- goal(C, open(O), t), subtask(settle_in(C), open(O), 19).
goal(subtask(settle_in(C), close(O), 20), t) :- goal(C, close(O), t), subtask(settle_in(C), close(O), 20).
goal(subtask(settle_in(C), drop(O), 21), t) :- goal(C, drop(O), t), subtask(settle_in(C), drop(O), 21).
goal(subtask(settle_in(C), turnto(O), 22), t) :- goal(C, turnto(O), t), subtask(settle_in(C), turnto(O), 22).
goal(subtask(settle_in(C), lookat(O), 23), t) :- goal(C, lookat(O), t), subtask(settle_in(C), lookat(O), 23).
goal(subtask(settle_in(C), drink(O), 24), t) :- goal(C, drink(O), t), subtask(settle_in(C), drink(O), 24).
goal(subtask(settle_in(C), watch(O), 25), t) :- goal(C, watch(O), t), subtask(settle_in(C), watch(O), 25).
goal(subtask(settle_in(C), read(O), 26), t) :- goal(C, read(O), t), subtask(settle_in(C), read(O), 26).
goal(subtask(settle_in(C), touch(O), 27), t) :- goal(C, touch(O), t), subtask(settle_in(C), touch(O), 27).
goal(subtask(settle_in(C), switchon(O), 28), t) :- goal(C, switchon(O), t), subtask(settle_in(C), switchon(O), 28).
goal(subtask(settle_in(C), switchoff(O), 29), t) :- goal(C, switchoff(O), t), subtask(settle_in(C), switchoff(O), 29).
goal(subtask(settle_in(C), plugin(O), 30), t) :- goal(C, plugin(O), t), subtask(settle_in(C), plugin(O), 30).
goal(subtask(settle_in(C), plugout(O), 31), t) :- goal(C, plugout(O), t), subtask(settle_in(C), plugout(O), 31).
goal(subtask(settle_in(C), wash(O), 32), t) :- goal(C, wash(O), t), subtask(settle_in(C), wash(O), 32).
goal(subtask(settle_in(C), cut(O), 33), t) :- goal(C, cut(O), t), subtask(settle_in(C), cut(O), 33).
goal(subtask(settle_in(C), eat(O), 34), t) :- goal(C, eat(O), t), subtask(settle_in(C), eat(O), 34).
