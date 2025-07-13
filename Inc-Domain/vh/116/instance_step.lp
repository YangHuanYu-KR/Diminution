#program step(t).

goal(prepare_dinner(C), T0, t, 1) :- subtask(prepare_dinner(C)), subtask(prepare_dinner(C), walk(O1_1), 1), goal(subtask(prepare_dinner(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(prepare_dinner(C), find(O2_1), 2), goal(subtask(prepare_dinner(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(prepare_dinner(C), grab(O3_1), 3), goal(subtask(prepare_dinner(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(prepare_dinner(C), T3, t, 2) :- subtask(prepare_dinner(C), walk(O4_1), 4), goal(subtask(prepare_dinner(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(prepare_dinner(C), find(O5_1), 5), goal(subtask(prepare_dinner(C), find(O5_1), 5), T4), T4 <= T5, time(T4), subtask(prepare_dinner(C), grab(O6_1), 6), goal(subtask(prepare_dinner(C), grab(O6_1), 6), T5), T5 <= t, time(T5).
goal(prepare_dinner(C), T0, t, 3) :- goal(prepare_dinner(C), T0, T2, 1), goal(prepare_dinner(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(prepare_dinner(C), T6, t, 4) :- subtask(prepare_dinner(C), walk(O7_1), 7), goal(subtask(prepare_dinner(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(prepare_dinner(C), find(O8_1), 8), goal(subtask(prepare_dinner(C), find(O8_1), 8), T7), T7 <= T8, time(T7), subtask(prepare_dinner(C), grab(O9_1), 9), goal(subtask(prepare_dinner(C), grab(O9_1), 9), T8), T8 <= t, time(T8).
goal(prepare_dinner(C), T0, t, 5) :- goal(prepare_dinner(C), T0, T5, 3), goal(prepare_dinner(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(prepare_dinner(C), T9, t, 6) :- subtask(prepare_dinner(C), walk(O10_1), 10), goal(subtask(prepare_dinner(C), walk(O10_1), 10), T9), T9 <= T10, time(T9), subtask(prepare_dinner(C), turnto(O11_1), 11), goal(subtask(prepare_dinner(C), turnto(O11_1), 11), T10), T10 <= T11, time(T10), subtask(prepare_dinner(C), putin(O12_1, O12_2), 12), goal(subtask(prepare_dinner(C), putin(O12_1, O12_2), 12), T11), T11 <= t, time(T11).
goal(prepare_dinner(C), T0, t, 7) :- goal(prepare_dinner(C), T0, T8, 5), goal(prepare_dinner(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(prepare_dinner(C), T12, t, 8) :- subtask(prepare_dinner(C), walk(O13_1), 13), goal(subtask(prepare_dinner(C), walk(O13_1), 13), T12), T12 <= T13, time(T12), subtask(prepare_dinner(C), grab(O14_1), 14), goal(subtask(prepare_dinner(C), grab(O14_1), 14), T13), T13 <= T14, time(T13), subtask(prepare_dinner(C), walk(O15_1), 15), goal(subtask(prepare_dinner(C), walk(O15_1), 15), T14), T14 <= t, time(T14).
goal(prepare_dinner(C), T0, t, 9) :- goal(prepare_dinner(C), T0, T11, 7), goal(prepare_dinner(C), T12, T14, 8), time(T0), time(T11), time(T12), T11 <= T12, time(T14), T12 <= t.
goal(prepare_dinner(C), T15, t, 10) :- subtask(prepare_dinner(C), putback(O16_1, O16_2), 16), goal(subtask(prepare_dinner(C), putback(O16_1, O16_2), 16), T15), T15 <= T16, time(T15), subtask(prepare_dinner(C), walk(O17_1), 17), goal(subtask(prepare_dinner(C), walk(O17_1), 17), T16), T16 <= T17, time(T16), subtask(prepare_dinner(C), find(O18_1), 18), goal(subtask(prepare_dinner(C), find(O18_1), 18), T17), T17 <= t, time(T17).
goal(prepare_dinner(C), T0, t, 11) :- goal(prepare_dinner(C), T0, T14, 9), goal(prepare_dinner(C), T15, T17, 10), time(T0), time(T14), time(T15), T14 <= T15, time(T17), T15 <= t.
goal(prepare_dinner(C), T18, t, 12) :- subtask(prepare_dinner(C), grab(O19_1), 19), goal(subtask(prepare_dinner(C), grab(O19_1), 19), T18), T18 <= T19, time(T18), subtask(prepare_dinner(C), putback(O20_1, O20_2), 20), goal(subtask(prepare_dinner(C), putback(O20_1, O20_2), 20), T19), T19 <= T20, time(T19), subtask(prepare_dinner(C), walk(O21_1), 21), goal(subtask(prepare_dinner(C), walk(O21_1), 21), T20), T20 <= t, time(T20).
goal(prepare_dinner(C), T0, t, 13) :- goal(prepare_dinner(C), T0, T17, 11), goal(prepare_dinner(C), T18, T20, 12), time(T0), time(T17), time(T18), T17 <= T18, time(T20), T18 <= t.
goal(prepare_dinner(C), T21, t, 14) :- subtask(prepare_dinner(C), grab(O22_1), 22), goal(subtask(prepare_dinner(C), grab(O22_1), 22), T21), T21 <= T22, time(T21), subtask(prepare_dinner(C), walk(O23_1), 23), goal(subtask(prepare_dinner(C), walk(O23_1), 23), T22), T22 <= T23, time(T22), subtask(prepare_dinner(C), find(O24_1), 24), goal(subtask(prepare_dinner(C), find(O24_1), 24), T23), T23 <= t, time(T23).
goal(prepare_dinner(C), T0, t, 15) :- goal(prepare_dinner(C), T0, T20, 13), goal(prepare_dinner(C), T21, T23, 14), time(T0), time(T20), time(T21), T20 <= T21, time(T23), T21 <= t.
goal(prepare_dinner(C), T24, t, 16) :- subtask(prepare_dinner(C), putin(O25_1, O25_2), 25), goal(subtask(prepare_dinner(C), putin(O25_1, O25_2), 25), T24), T24 <= T25, time(T24), subtask(prepare_dinner(C), walk(O26_1), 26), goal(subtask(prepare_dinner(C), walk(O26_1), 26), T25), T25 <= T26, time(T25), subtask(prepare_dinner(C), find(O27_1), 27), goal(subtask(prepare_dinner(C), find(O27_1), 27), T26), T26 <= t, time(T26).
goal(prepare_dinner(C), T0, t, 17) :- goal(prepare_dinner(C), T0, T23, 15), goal(prepare_dinner(C), T24, T26, 16), time(T0), time(T23), time(T24), T23 <= T24, time(T26), T24 <= t.
goal(prepare_dinner(C), T27, t, 18) :- subtask(prepare_dinner(C), grab(O28_1), 28), goal(subtask(prepare_dinner(C), grab(O28_1), 28), T27), T27 <= T28, time(T27), subtask(prepare_dinner(C), find(O29_1), 29), goal(subtask(prepare_dinner(C), find(O29_1), 29), T28), T28 <= T29, time(T28), subtask(prepare_dinner(C), grab(O30_1), 30), goal(subtask(prepare_dinner(C), grab(O30_1), 30), T29), T29 <= t, time(T29).
goal(prepare_dinner(C), T0, t, 19) :- goal(prepare_dinner(C), T0, T26, 17), goal(prepare_dinner(C), T27, T29, 18), time(T0), time(T26), time(T27), T26 <= T27, time(T29), T27 <= t.
goal(prepare_dinner(C), T30, t, 20) :- subtask(prepare_dinner(C), walk(O31_1), 31), goal(subtask(prepare_dinner(C), walk(O31_1), 31), T30), T30 <= T31, time(T30), subtask(prepare_dinner(C), pour(O32_1, O32_2), 32), goal(subtask(prepare_dinner(C), pour(O32_1, O32_2), 32), T31), T31 <= T32, time(T31), subtask(prepare_dinner(C), walk(O33_1), 33), goal(subtask(prepare_dinner(C), walk(O33_1), 33), T32), T32 <= t, time(T32).
goal(prepare_dinner(C), T0, t, 21) :- goal(prepare_dinner(C), T0, T29, 19), goal(prepare_dinner(C), T30, T32, 20), time(T0), time(T29), time(T30), T29 <= T30, time(T32), T30 <= t.
goal(prepare_dinner(C), T33, t, 22) :- subtask(prepare_dinner(C), open(O34_1), 34), goal(subtask(prepare_dinner(C), open(O34_1), 34), T33), T33 <= T34, time(T33), subtask(prepare_dinner(C), putin(O35_1, O35_2), 35), goal(subtask(prepare_dinner(C), putin(O35_1, O35_2), 35), T34), T34 <= T35, time(T34), subtask(prepare_dinner(C), close(O36_1), 36), goal(subtask(prepare_dinner(C), close(O36_1), 36), T35), T35 <= t, time(T35).
goal(prepare_dinner(C), T0, t, 23) :- goal(prepare_dinner(C), T0, T32, 21), goal(prepare_dinner(C), T33, T35, 22), time(T0), time(T32), time(T33), T32 <= T33, time(T35), T33 <= t.
goal(prepare_dinner(C), T36, t, 24) :- subtask(prepare_dinner(C), walk(O37_1), 37), goal(subtask(prepare_dinner(C), walk(O37_1), 37), T36), T36 <= T37, time(T36), subtask(prepare_dinner(C), switchon(O38_1), 38), goal(subtask(prepare_dinner(C), switchon(O38_1), 38), T37), T37 <= t, time(T37).
goal(prepare_dinner(C), t) :- goal(prepare_dinner(C), T0, T35, 23), goal(prepare_dinner(C), T36, t, 24), time(T0), time(T35), time(T36), T35 <= T36.

goal(subtask(prepare_dinner(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 1).
goal(subtask(prepare_dinner(C), find(O), 2), t) :- goal(C, find(O), t), subtask(prepare_dinner(C), find(O), 2).
goal(subtask(prepare_dinner(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(prepare_dinner(C), grab(O), 3).
goal(subtask(prepare_dinner(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 4).
goal(subtask(prepare_dinner(C), find(O), 5), t) :- goal(C, find(O), t), subtask(prepare_dinner(C), find(O), 5).
goal(subtask(prepare_dinner(C), grab(O), 6), t) :- goal(C, grab(O), t), subtask(prepare_dinner(C), grab(O), 6).
goal(subtask(prepare_dinner(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 7).
goal(subtask(prepare_dinner(C), find(O), 8), t) :- goal(C, find(O), t), subtask(prepare_dinner(C), find(O), 8).
goal(subtask(prepare_dinner(C), grab(O), 9), t) :- goal(C, grab(O), t), subtask(prepare_dinner(C), grab(O), 9).
goal(subtask(prepare_dinner(C), walk(O), 10), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 10).
goal(subtask(prepare_dinner(C), turnto(O), 11), t) :- goal(C, turnto(O), t), subtask(prepare_dinner(C), turnto(O), 11).
goal(subtask(prepare_dinner(C), putin(O1, O2), 12), t) :- goal(C, putin(O1, O2), t), subtask(prepare_dinner(C), putin(O1, O2), 12).
goal(subtask(prepare_dinner(C), walk(O), 13), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 13).
goal(subtask(prepare_dinner(C), grab(O), 14), t) :- goal(C, grab(O), t), subtask(prepare_dinner(C), grab(O), 14).
goal(subtask(prepare_dinner(C), walk(O), 15), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 15).
goal(subtask(prepare_dinner(C), putback(O1, O2), 16), t) :- goal(C, putback(O1, O2), t), subtask(prepare_dinner(C), putback(O1, O2), 16).
goal(subtask(prepare_dinner(C), walk(O), 17), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 17).
goal(subtask(prepare_dinner(C), find(O), 18), t) :- goal(C, find(O), t), subtask(prepare_dinner(C), find(O), 18).
goal(subtask(prepare_dinner(C), grab(O), 19), t) :- goal(C, grab(O), t), subtask(prepare_dinner(C), grab(O), 19).
goal(subtask(prepare_dinner(C), putback(O1, O2), 20), t) :- goal(C, putback(O1, O2), t), subtask(prepare_dinner(C), putback(O1, O2), 20).
goal(subtask(prepare_dinner(C), walk(O), 21), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 21).
goal(subtask(prepare_dinner(C), grab(O), 22), t) :- goal(C, grab(O), t), subtask(prepare_dinner(C), grab(O), 22).
goal(subtask(prepare_dinner(C), walk(O), 23), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 23).
goal(subtask(prepare_dinner(C), find(O), 24), t) :- goal(C, find(O), t), subtask(prepare_dinner(C), find(O), 24).
goal(subtask(prepare_dinner(C), putin(O1, O2), 25), t) :- goal(C, putin(O1, O2), t), subtask(prepare_dinner(C), putin(O1, O2), 25).
goal(subtask(prepare_dinner(C), walk(O), 26), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 26).
goal(subtask(prepare_dinner(C), find(O), 27), t) :- goal(C, find(O), t), subtask(prepare_dinner(C), find(O), 27).
goal(subtask(prepare_dinner(C), grab(O), 28), t) :- goal(C, grab(O), t), subtask(prepare_dinner(C), grab(O), 28).
goal(subtask(prepare_dinner(C), find(O), 29), t) :- goal(C, find(O), t), subtask(prepare_dinner(C), find(O), 29).
goal(subtask(prepare_dinner(C), grab(O), 30), t) :- goal(C, grab(O), t), subtask(prepare_dinner(C), grab(O), 30).
goal(subtask(prepare_dinner(C), walk(O), 31), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 31).
goal(subtask(prepare_dinner(C), pour(O1, O2), 32), t) :- goal(C, pour(O1, O2), t), subtask(prepare_dinner(C), pour(O1, O2), 32).
goal(subtask(prepare_dinner(C), walk(O), 33), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 33).
goal(subtask(prepare_dinner(C), open(O), 34), t) :- goal(C, open(O), t), subtask(prepare_dinner(C), open(O), 34).
goal(subtask(prepare_dinner(C), putin(O1, O2), 35), t) :- goal(C, putin(O1, O2), t), subtask(prepare_dinner(C), putin(O1, O2), 35).
goal(subtask(prepare_dinner(C), close(O), 36), t) :- goal(C, close(O), t), subtask(prepare_dinner(C), close(O), 36).
goal(subtask(prepare_dinner(C), walk(O), 37), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 37).
goal(subtask(prepare_dinner(C), switchon(O), 38), t) :- goal(C, switchon(O), t), subtask(prepare_dinner(C), switchon(O), 38).
