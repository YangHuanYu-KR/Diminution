#program step(t).

goal(watch_movie(C), T0, t, 1) :- subtask(watch_movie(C)), subtask(watch_movie(C), walk(O1_1), 1), goal(subtask(watch_movie(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(watch_movie(C), walk(O2_1), 2), goal(subtask(watch_movie(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(watch_movie(C), walk(O3_1), 3), goal(subtask(watch_movie(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(watch_movie(C), T3, t, 2) :- subtask(watch_movie(C), walk(O4_1), 4), goal(subtask(watch_movie(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(watch_movie(C), walk(O5_1), 5), goal(subtask(watch_movie(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(watch_movie(C), walk(O6_1), 6), goal(subtask(watch_movie(C), walk(O6_1), 6), T5), T5 <= t, time(T5).
goal(watch_movie(C), T0, t, 3) :- goal(watch_movie(C), T0, T2, 1), goal(watch_movie(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(watch_movie(C), T6, t, 4) :- subtask(watch_movie(C), walk(O7_1), 7), goal(subtask(watch_movie(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(watch_movie(C), walk(O8_1), 8), goal(subtask(watch_movie(C), walk(O8_1), 8), T7), T7 <= T8, time(T7), subtask(watch_movie(C), walk(O9_1), 9), goal(subtask(watch_movie(C), walk(O9_1), 9), T8), T8 <= t, time(T8).
goal(watch_movie(C), T0, t, 5) :- goal(watch_movie(C), T0, T5, 3), goal(watch_movie(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(watch_movie(C), T9, t, 6) :- subtask(watch_movie(C), walk(O10_1), 10), goal(subtask(watch_movie(C), walk(O10_1), 10), T9), T9 <= T10, time(T9), subtask(watch_movie(C), walk(O11_1), 11), goal(subtask(watch_movie(C), walk(O11_1), 11), T10), T10 <= T11, time(T10), subtask(watch_movie(C), walk(O12_1), 12), goal(subtask(watch_movie(C), walk(O12_1), 12), T11), T11 <= t, time(T11).
goal(watch_movie(C), T0, t, 7) :- goal(watch_movie(C), T0, T8, 5), goal(watch_movie(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(watch_movie(C), T12, t, 8) :- subtask(watch_movie(C), walk(O13_1), 13), goal(subtask(watch_movie(C), walk(O13_1), 13), T12), T12 <= T13, time(T12), subtask(watch_movie(C), walk(O14_1), 14), goal(subtask(watch_movie(C), walk(O14_1), 14), T13), T13 <= T14, time(T13), subtask(watch_movie(C), walk(O15_1), 15), goal(subtask(watch_movie(C), walk(O15_1), 15), T14), T14 <= t, time(T14).
goal(watch_movie(C), T0, t, 9) :- goal(watch_movie(C), T0, T11, 7), goal(watch_movie(C), T12, T14, 8), time(T0), time(T11), time(T12), T11 <= T12, time(T14), T12 <= t.
goal(watch_movie(C), T15, t, 10) :- subtask(watch_movie(C), walk(O16_1), 16), goal(subtask(watch_movie(C), walk(O16_1), 16), T15), T15 <= T16, time(T15), subtask(watch_movie(C), walk(O17_1), 17), goal(subtask(watch_movie(C), walk(O17_1), 17), T16), T16 <= T17, time(T16), subtask(watch_movie(C), walk(O18_1), 18), goal(subtask(watch_movie(C), walk(O18_1), 18), T17), T17 <= t, time(T17).
goal(watch_movie(C), T0, t, 11) :- goal(watch_movie(C), T0, T14, 9), goal(watch_movie(C), T15, T17, 10), time(T0), time(T14), time(T15), T14 <= T15, time(T17), T15 <= t.
goal(watch_movie(C), T18, t, 12) :- subtask(watch_movie(C), walk(O19_1), 19), goal(subtask(watch_movie(C), walk(O19_1), 19), T18), T18 <= T19, time(T18), subtask(watch_movie(C), walk(O20_1), 20), goal(subtask(watch_movie(C), walk(O20_1), 20), T19), T19 <= T20, time(T19), subtask(watch_movie(C), walk(O21_1), 21), goal(subtask(watch_movie(C), walk(O21_1), 21), T20), T20 <= t, time(T20).
goal(watch_movie(C), T0, t, 13) :- goal(watch_movie(C), T0, T17, 11), goal(watch_movie(C), T18, T20, 12), time(T0), time(T17), time(T18), T17 <= T18, time(T20), T18 <= t.
goal(watch_movie(C), T21, t, 14) :- subtask(watch_movie(C), walk(O22_1), 22), goal(subtask(watch_movie(C), walk(O22_1), 22), T21), T21 <= T22, time(T21), subtask(watch_movie(C), walk(O23_1), 23), goal(subtask(watch_movie(C), walk(O23_1), 23), T22), T22 <= T23, time(T22), subtask(watch_movie(C), walk(O24_1), 24), goal(subtask(watch_movie(C), walk(O24_1), 24), T23), T23 <= t, time(T23).
goal(watch_movie(C), T0, t, 15) :- goal(watch_movie(C), T0, T20, 13), goal(watch_movie(C), T21, T23, 14), time(T0), time(T20), time(T21), T20 <= T21, time(T23), T21 <= t.
goal(watch_movie(C), T24, t, 16) :- subtask(watch_movie(C), walk(O25_1), 25), goal(subtask(watch_movie(C), walk(O25_1), 25), T24), T24 <= T25, time(T24), subtask(watch_movie(C), walk(O26_1), 26), goal(subtask(watch_movie(C), walk(O26_1), 26), T25), T25 <= T26, time(T25), subtask(watch_movie(C), walk(O27_1), 27), goal(subtask(watch_movie(C), walk(O27_1), 27), T26), T26 <= t, time(T26).
goal(watch_movie(C), T0, t, 17) :- goal(watch_movie(C), T0, T23, 15), goal(watch_movie(C), T24, T26, 16), time(T0), time(T23), time(T24), T23 <= T24, time(T26), T24 <= t.
goal(watch_movie(C), T27, t, 18) :- subtask(watch_movie(C), walk(O28_1), 28), goal(subtask(watch_movie(C), walk(O28_1), 28), T27), T27 <= T28, time(T27), subtask(watch_movie(C), walk(O29_1), 29), goal(subtask(watch_movie(C), walk(O29_1), 29), T28), T28 <= T29, time(T28), subtask(watch_movie(C), walk(O30_1), 30), goal(subtask(watch_movie(C), walk(O30_1), 30), T29), T29 <= t, time(T29).
goal(watch_movie(C), T0, t, 19) :- goal(watch_movie(C), T0, T26, 17), goal(watch_movie(C), T27, T29, 18), time(T0), time(T26), time(T27), T26 <= T27, time(T29), T27 <= t.
goal(watch_movie(C), T30, t, 20) :- subtask(watch_movie(C), walk(O31_1), 31), goal(subtask(watch_movie(C), walk(O31_1), 31), T30), T30 <= T31, time(T30), subtask(watch_movie(C), walk(O32_1), 32), goal(subtask(watch_movie(C), walk(O32_1), 32), T31), T31 <= T32, time(T31), subtask(watch_movie(C), walk(O33_1), 33), goal(subtask(watch_movie(C), walk(O33_1), 33), T32), T32 <= t, time(T32).
goal(watch_movie(C), T0, t, 21) :- goal(watch_movie(C), T0, T29, 19), goal(watch_movie(C), T30, T32, 20), time(T0), time(T29), time(T30), T29 <= T30, time(T32), T30 <= t.
goal(watch_movie(C), T33, t, 22) :- subtask(watch_movie(C), walk(O34_1), 34), goal(subtask(watch_movie(C), walk(O34_1), 34), T33), T33 <= T34, time(T33), subtask(watch_movie(C), walk(O35_1), 35), goal(subtask(watch_movie(C), walk(O35_1), 35), T34), T34 <= T35, time(T34), subtask(watch_movie(C), walk(O36_1), 36), goal(subtask(watch_movie(C), walk(O36_1), 36), T35), T35 <= t, time(T35).
goal(watch_movie(C), T0, t, 23) :- goal(watch_movie(C), T0, T32, 21), goal(watch_movie(C), T33, T35, 22), time(T0), time(T32), time(T33), T32 <= T33, time(T35), T33 <= t.
goal(watch_movie(C), T36, t, 24) :- subtask(watch_movie(C), walk(O37_1), 37), goal(subtask(watch_movie(C), walk(O37_1), 37), T36), T36 <= T37, time(T36), subtask(watch_movie(C), walk(O38_1), 38), goal(subtask(watch_movie(C), walk(O38_1), 38), T37), T37 <= T38, time(T37), subtask(watch_movie(C), walk(O39_1), 39), goal(subtask(watch_movie(C), walk(O39_1), 39), T38), T38 <= t, time(T38).
goal(watch_movie(C), T0, t, 25) :- goal(watch_movie(C), T0, T35, 23), goal(watch_movie(C), T36, T38, 24), time(T0), time(T35), time(T36), T35 <= T36, time(T38), T36 <= t.
goal(watch_movie(C), T39, t, 26) :- subtask(watch_movie(C), walk(O40_1), 40), goal(subtask(watch_movie(C), walk(O40_1), 40), T39), T39 <= T40, time(T39), subtask(watch_movie(C), walk(O41_1), 41), goal(subtask(watch_movie(C), walk(O41_1), 41), T40), T40 <= T41, time(T40), subtask(watch_movie(C), walk(O42_1), 42), goal(subtask(watch_movie(C), walk(O42_1), 42), T41), T41 <= t, time(T41).
goal(watch_movie(C), T0, t, 27) :- goal(watch_movie(C), T0, T38, 25), goal(watch_movie(C), T39, T41, 26), time(T0), time(T38), time(T39), T38 <= T39, time(T41), T39 <= t.
goal(watch_movie(C), T42, t, 28) :- subtask(watch_movie(C), walk(O43_1), 43), goal(subtask(watch_movie(C), walk(O43_1), 43), T42), T42 <= T43, time(T42), subtask(watch_movie(C), walk(O44_1), 44), goal(subtask(watch_movie(C), walk(O44_1), 44), T43), T43 <= T44, time(T43), subtask(watch_movie(C), walk(O45_1), 45), goal(subtask(watch_movie(C), walk(O45_1), 45), T44), T44 <= t, time(T44).
goal(watch_movie(C), T0, t, 29) :- goal(watch_movie(C), T0, T41, 27), goal(watch_movie(C), T42, T44, 28), time(T0), time(T41), time(T42), T41 <= T42, time(T44), T42 <= t.
goal(watch_movie(C), T45, t, 30) :- subtask(watch_movie(C), walk(O46_1), 46), goal(subtask(watch_movie(C), walk(O46_1), 46), T45), T45 <= T46, time(T45), subtask(watch_movie(C), walk(O47_1), 47), goal(subtask(watch_movie(C), walk(O47_1), 47), T46), T46 <= t, time(T46).
goal(watch_movie(C), t) :- goal(watch_movie(C), T0, T44, 29), goal(watch_movie(C), T45, t, 30), time(T0), time(T44), time(T45), T44 <= T45.

goal(subtask(watch_movie(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 1).
goal(subtask(watch_movie(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 2).
goal(subtask(watch_movie(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 3).
goal(subtask(watch_movie(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 4).
goal(subtask(watch_movie(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 5).
goal(subtask(watch_movie(C), walk(O), 6), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 6).
goal(subtask(watch_movie(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 7).
goal(subtask(watch_movie(C), walk(O), 8), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 8).
goal(subtask(watch_movie(C), walk(O), 9), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 9).
goal(subtask(watch_movie(C), walk(O), 10), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 10).
goal(subtask(watch_movie(C), walk(O), 11), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 11).
goal(subtask(watch_movie(C), walk(O), 12), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 12).
goal(subtask(watch_movie(C), walk(O), 13), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 13).
goal(subtask(watch_movie(C), walk(O), 14), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 14).
goal(subtask(watch_movie(C), walk(O), 15), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 15).
goal(subtask(watch_movie(C), walk(O), 16), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 16).
goal(subtask(watch_movie(C), walk(O), 17), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 17).
goal(subtask(watch_movie(C), walk(O), 18), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 18).
goal(subtask(watch_movie(C), walk(O), 19), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 19).
goal(subtask(watch_movie(C), walk(O), 20), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 20).
goal(subtask(watch_movie(C), walk(O), 21), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 21).
goal(subtask(watch_movie(C), walk(O), 22), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 22).
goal(subtask(watch_movie(C), walk(O), 23), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 23).
goal(subtask(watch_movie(C), walk(O), 24), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 24).
goal(subtask(watch_movie(C), walk(O), 25), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 25).
goal(subtask(watch_movie(C), walk(O), 26), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 26).
goal(subtask(watch_movie(C), walk(O), 27), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 27).
goal(subtask(watch_movie(C), walk(O), 28), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 28).
goal(subtask(watch_movie(C), walk(O), 29), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 29).
goal(subtask(watch_movie(C), walk(O), 30), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 30).
goal(subtask(watch_movie(C), walk(O), 31), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 31).
goal(subtask(watch_movie(C), walk(O), 32), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 32).
goal(subtask(watch_movie(C), walk(O), 33), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 33).
goal(subtask(watch_movie(C), walk(O), 34), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 34).
goal(subtask(watch_movie(C), walk(O), 35), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 35).
goal(subtask(watch_movie(C), walk(O), 36), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 36).
goal(subtask(watch_movie(C), walk(O), 37), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 37).
goal(subtask(watch_movie(C), walk(O), 38), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 38).
goal(subtask(watch_movie(C), walk(O), 39), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 39).
goal(subtask(watch_movie(C), walk(O), 40), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 40).
goal(subtask(watch_movie(C), walk(O), 41), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 41).
goal(subtask(watch_movie(C), walk(O), 42), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 42).
goal(subtask(watch_movie(C), walk(O), 43), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 43).
goal(subtask(watch_movie(C), walk(O), 44), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 44).
goal(subtask(watch_movie(C), walk(O), 45), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 45).
goal(subtask(watch_movie(C), walk(O), 46), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 46).
goal(subtask(watch_movie(C), walk(O), 47), t) :- goal(C, walk(O), t), subtask(watch_movie(C), walk(O), 47).
