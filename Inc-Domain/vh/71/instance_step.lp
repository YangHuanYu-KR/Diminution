#program step(t).

goal(clean_room(C), T0, t, 1) :- subtask(clean_room(C)), subtask(clean_room(C), walk(O1_1), 1), goal(subtask(clean_room(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(clean_room(C), plugin(O2_1), 2), goal(subtask(clean_room(C), plugin(O2_1), 2), T1), T1 <= T2, time(T1), subtask(clean_room(C), walk(O3_1), 3), goal(subtask(clean_room(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(clean_room(C), T3, t, 2) :- subtask(clean_room(C), grab(O4_1), 4), goal(subtask(clean_room(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(clean_room(C), find(O5_1), 5), goal(subtask(clean_room(C), find(O5_1), 5), T4), T4 <= T5, time(T4), subtask(clean_room(C), open(O6_1), 6), goal(subtask(clean_room(C), open(O6_1), 6), T5), T5 <= t, time(T5).
goal(clean_room(C), T0, t, 3) :- goal(clean_room(C), T0, T2, 1), goal(clean_room(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(clean_room(C), T6, t, 4) :- subtask(clean_room(C), pour(O7_1, O7_2), 7), goal(subtask(clean_room(C), pour(O7_1, O7_2), 7), T6), T6 <= T7, time(T6), subtask(clean_room(C), close(O8_1), 8), goal(subtask(clean_room(C), close(O8_1), 8), T7), T7 <= T8, time(T7), subtask(clean_room(C), walk(O9_1), 9), goal(subtask(clean_room(C), walk(O9_1), 9), T8), T8 <= t, time(T8).
goal(clean_room(C), T0, t, 5) :- goal(clean_room(C), T0, T5, 3), goal(clean_room(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(clean_room(C), T9, t, 6) :- subtask(clean_room(C), grab(O10_1), 10), goal(subtask(clean_room(C), grab(O10_1), 10), T9), T9 <= T10, time(T9), subtask(clean_room(C), find(O11_1), 11), goal(subtask(clean_room(C), find(O11_1), 11), T10), T10 <= T11, time(T10), subtask(clean_room(C), open(O12_1), 12), goal(subtask(clean_room(C), open(O12_1), 12), T11), T11 <= t, time(T11).
goal(clean_room(C), T0, t, 7) :- goal(clean_room(C), T0, T8, 5), goal(clean_room(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(clean_room(C), T12, t, 8) :- subtask(clean_room(C), pour(O13_1, O13_2), 13), goal(subtask(clean_room(C), pour(O13_1, O13_2), 13), T12), T12 <= T13, time(T12), subtask(clean_room(C), close(O14_1), 14), goal(subtask(clean_room(C), close(O14_1), 14), T13), T13 <= T14, time(T13), subtask(clean_room(C), walk(O15_1), 15), goal(subtask(clean_room(C), walk(O15_1), 15), T14), T14 <= t, time(T14).
goal(clean_room(C), T0, t, 9) :- goal(clean_room(C), T0, T11, 7), goal(clean_room(C), T12, T14, 8), time(T0), time(T11), time(T12), T11 <= T12, time(T14), T12 <= t.
goal(clean_room(C), T15, t, 10) :- subtask(clean_room(C), grab(O16_1), 16), goal(subtask(clean_room(C), grab(O16_1), 16), T15), T15 <= T16, time(T15), subtask(clean_room(C), putin(O17_1, O17_2), 17), goal(subtask(clean_room(C), putin(O17_1, O17_2), 17), T16), T16 <= T17, time(T16), subtask(clean_room(C), walk(O18_1), 18), goal(subtask(clean_room(C), walk(O18_1), 18), T17), T17 <= t, time(T17).
goal(clean_room(C), T0, t, 11) :- goal(clean_room(C), T0, T14, 9), goal(clean_room(C), T15, T17, 10), time(T0), time(T14), time(T15), T14 <= T15, time(T17), T15 <= t.
goal(clean_room(C), T18, t, 12) :- subtask(clean_room(C), grab(O19_1), 19), goal(subtask(clean_room(C), grab(O19_1), 19), T18), T18 <= T19, time(T18), subtask(clean_room(C), find(O20_1), 20), goal(subtask(clean_room(C), find(O20_1), 20), T19), T19 <= T20, time(T19), subtask(clean_room(C), putin(O21_1, O21_2), 21), goal(subtask(clean_room(C), putin(O21_1, O21_2), 21), T20), T20 <= t, time(T20).
goal(clean_room(C), T0, t, 13) :- goal(clean_room(C), T0, T17, 11), goal(clean_room(C), T18, T20, 12), time(T0), time(T17), time(T18), T17 <= T18, time(T20), T18 <= t.
goal(clean_room(C), T21, t, 14) :- subtask(clean_room(C), walk(O22_1), 22), goal(subtask(clean_room(C), walk(O22_1), 22), T21), T21 <= T22, time(T21), subtask(clean_room(C), lookat(O23_1), 23), goal(subtask(clean_room(C), lookat(O23_1), 23), T22), T22 <= T23, time(T22), subtask(clean_room(C), grab(O24_1), 24), goal(subtask(clean_room(C), grab(O24_1), 24), T23), T23 <= t, time(T23).
goal(clean_room(C), T0, t, 15) :- goal(clean_room(C), T0, T20, 13), goal(clean_room(C), T21, T23, 14), time(T0), time(T20), time(T21), T20 <= T21, time(T23), T21 <= t.
goal(clean_room(C), T24, t, 16) :- subtask(clean_room(C), putin(O25_1, O25_2), 25), goal(subtask(clean_room(C), putin(O25_1, O25_2), 25), T24), T24 <= t, time(T24).
goal(clean_room(C), t) :- goal(clean_room(C), T0, T23, 15), goal(clean_room(C), T24, t, 16), time(T0), time(T23), time(T24), T23 <= T24.

goal(subtask(clean_room(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(clean_room(C), walk(O), 1).
goal(subtask(clean_room(C), plugin(O), 2), t) :- goal(C, plugin(O), t), subtask(clean_room(C), plugin(O), 2).
goal(subtask(clean_room(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(clean_room(C), walk(O), 3).
goal(subtask(clean_room(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(clean_room(C), grab(O), 4).
goal(subtask(clean_room(C), find(O), 5), t) :- goal(C, find(O), t), subtask(clean_room(C), find(O), 5).
goal(subtask(clean_room(C), open(O), 6), t) :- goal(C, open(O), t), subtask(clean_room(C), open(O), 6).
goal(subtask(clean_room(C), pour(O1, O2), 7), t) :- goal(C, pour(O1, O2), t), subtask(clean_room(C), pour(O1, O2), 7).
goal(subtask(clean_room(C), close(O), 8), t) :- goal(C, close(O), t), subtask(clean_room(C), close(O), 8).
goal(subtask(clean_room(C), walk(O), 9), t) :- goal(C, walk(O), t), subtask(clean_room(C), walk(O), 9).
goal(subtask(clean_room(C), grab(O), 10), t) :- goal(C, grab(O), t), subtask(clean_room(C), grab(O), 10).
goal(subtask(clean_room(C), find(O), 11), t) :- goal(C, find(O), t), subtask(clean_room(C), find(O), 11).
goal(subtask(clean_room(C), open(O), 12), t) :- goal(C, open(O), t), subtask(clean_room(C), open(O), 12).
goal(subtask(clean_room(C), pour(O1, O2), 13), t) :- goal(C, pour(O1, O2), t), subtask(clean_room(C), pour(O1, O2), 13).
goal(subtask(clean_room(C), close(O), 14), t) :- goal(C, close(O), t), subtask(clean_room(C), close(O), 14).
goal(subtask(clean_room(C), walk(O), 15), t) :- goal(C, walk(O), t), subtask(clean_room(C), walk(O), 15).
goal(subtask(clean_room(C), grab(O), 16), t) :- goal(C, grab(O), t), subtask(clean_room(C), grab(O), 16).
goal(subtask(clean_room(C), putin(O1, O2), 17), t) :- goal(C, putin(O1, O2), t), subtask(clean_room(C), putin(O1, O2), 17).
goal(subtask(clean_room(C), walk(O), 18), t) :- goal(C, walk(O), t), subtask(clean_room(C), walk(O), 18).
goal(subtask(clean_room(C), grab(O), 19), t) :- goal(C, grab(O), t), subtask(clean_room(C), grab(O), 19).
goal(subtask(clean_room(C), find(O), 20), t) :- goal(C, find(O), t), subtask(clean_room(C), find(O), 20).
goal(subtask(clean_room(C), putin(O1, O2), 21), t) :- goal(C, putin(O1, O2), t), subtask(clean_room(C), putin(O1, O2), 21).
goal(subtask(clean_room(C), walk(O), 22), t) :- goal(C, walk(O), t), subtask(clean_room(C), walk(O), 22).
goal(subtask(clean_room(C), lookat(O), 23), t) :- goal(C, lookat(O), t), subtask(clean_room(C), lookat(O), 23).
goal(subtask(clean_room(C), grab(O), 24), t) :- goal(C, grab(O), t), subtask(clean_room(C), grab(O), 24).
goal(subtask(clean_room(C), putin(O1, O2), 25), t) :- goal(C, putin(O1, O2), t), subtask(clean_room(C), putin(O1, O2), 25).
