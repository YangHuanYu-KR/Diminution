#program step(t).

goal(re_arrange_office(C), T0, t, 1) :- subtask(re_arrange_office(C)), subtask(re_arrange_office(C), walk(O1_1), 1), goal(subtask(re_arrange_office(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(re_arrange_office(C), lookat(O2_1), 2), goal(subtask(re_arrange_office(C), lookat(O2_1), 2), T1), T1 <= T2, time(T1), subtask(re_arrange_office(C), grab(O3_1), 3), goal(subtask(re_arrange_office(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(re_arrange_office(C), T3, t, 2) :- subtask(re_arrange_office(C), grab(O4_1), 4), goal(subtask(re_arrange_office(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(re_arrange_office(C), grab(O5_1), 5), goal(subtask(re_arrange_office(C), grab(O5_1), 5), T4), T4 <= T5, time(T4), subtask(re_arrange_office(C), grab(O6_1), 6), goal(subtask(re_arrange_office(C), grab(O6_1), 6), T5), T5 <= t, time(T5).
goal(re_arrange_office(C), T0, t, 3) :- goal(re_arrange_office(C), T0, T2, 1), goal(re_arrange_office(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(re_arrange_office(C), T6, t, 4) :- subtask(re_arrange_office(C), grab(O7_1), 7), goal(subtask(re_arrange_office(C), grab(O7_1), 7), T6), T6 <= T7, time(T6), subtask(re_arrange_office(C), putback(O8_1, O8_2), 8), goal(subtask(re_arrange_office(C), putback(O8_1, O8_2), 8), T7), T7 <= T8, time(T7), subtask(re_arrange_office(C), putback(O9_1, O9_2), 9), goal(subtask(re_arrange_office(C), putback(O9_1, O9_2), 9), T8), T8 <= t, time(T8).
goal(re_arrange_office(C), T0, t, 5) :- goal(re_arrange_office(C), T0, T5, 3), goal(re_arrange_office(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(re_arrange_office(C), T9, t, 6) :- subtask(re_arrange_office(C), putback(O10_1, O10_2), 10), goal(subtask(re_arrange_office(C), putback(O10_1, O10_2), 10), T9), T9 <= T10, time(T9), subtask(re_arrange_office(C), putback(O11_1, O11_2), 11), goal(subtask(re_arrange_office(C), putback(O11_1, O11_2), 11), T10), T10 <= T11, time(T10), subtask(re_arrange_office(C), putback(O12_1, O12_2), 12), goal(subtask(re_arrange_office(C), putback(O12_1, O12_2), 12), T11), T11 <= t, time(T11).
goal(re_arrange_office(C), T0, t, 7) :- goal(re_arrange_office(C), T0, T8, 5), goal(re_arrange_office(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(re_arrange_office(C), T12, t, 8) :- subtask(re_arrange_office(C), lookat(O13_1), 13), goal(subtask(re_arrange_office(C), lookat(O13_1), 13), T12), T12 <= T13, time(T12), subtask(re_arrange_office(C), grab(O14_1), 14), goal(subtask(re_arrange_office(C), grab(O14_1), 14), T13), T13 <= T14, time(T13), subtask(re_arrange_office(C), putback(O15_1, O15_2), 15), goal(subtask(re_arrange_office(C), putback(O15_1, O15_2), 15), T14), T14 <= t, time(T14).
goal(re_arrange_office(C), T0, t, 9) :- goal(re_arrange_office(C), T0, T11, 7), goal(re_arrange_office(C), T12, T14, 8), time(T0), time(T11), time(T12), T11 <= T12, time(T14), T12 <= t.
goal(re_arrange_office(C), T15, t, 10) :- subtask(re_arrange_office(C), lookat(O16_1), 16), goal(subtask(re_arrange_office(C), lookat(O16_1), 16), T15), T15 <= T16, time(T15), subtask(re_arrange_office(C), grab(O17_1), 17), goal(subtask(re_arrange_office(C), grab(O17_1), 17), T16), T16 <= T17, time(T16), subtask(re_arrange_office(C), putback(O18_1, O18_2), 18), goal(subtask(re_arrange_office(C), putback(O18_1, O18_2), 18), T17), T17 <= t, time(T17).
goal(re_arrange_office(C), T0, t, 11) :- goal(re_arrange_office(C), T0, T14, 9), goal(re_arrange_office(C), T15, T17, 10), time(T0), time(T14), time(T15), T14 <= T15, time(T17), T15 <= t.
goal(re_arrange_office(C), T18, t, 12) :- subtask(re_arrange_office(C), lookat(O19_1), 19), goal(subtask(re_arrange_office(C), lookat(O19_1), 19), T18), T18 <= T19, time(T18), subtask(re_arrange_office(C), grab(O20_1), 20), goal(subtask(re_arrange_office(C), grab(O20_1), 20), T19), T19 <= T20, time(T19), subtask(re_arrange_office(C), putback(O21_1, O21_2), 21), goal(subtask(re_arrange_office(C), putback(O21_1, O21_2), 21), T20), T20 <= t, time(T20).
goal(re_arrange_office(C), t) :- goal(re_arrange_office(C), T0, T17, 11), goal(re_arrange_office(C), T18, t, 12), time(T0), time(T17), time(T18), T17 <= T18.

goal(subtask(re_arrange_office(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(re_arrange_office(C), walk(O), 1).
goal(subtask(re_arrange_office(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(re_arrange_office(C), lookat(O), 2).
goal(subtask(re_arrange_office(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(re_arrange_office(C), grab(O), 3).
goal(subtask(re_arrange_office(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(re_arrange_office(C), grab(O), 4).
goal(subtask(re_arrange_office(C), grab(O), 5), t) :- goal(C, grab(O), t), subtask(re_arrange_office(C), grab(O), 5).
goal(subtask(re_arrange_office(C), grab(O), 6), t) :- goal(C, grab(O), t), subtask(re_arrange_office(C), grab(O), 6).
goal(subtask(re_arrange_office(C), grab(O), 7), t) :- goal(C, grab(O), t), subtask(re_arrange_office(C), grab(O), 7).
goal(subtask(re_arrange_office(C), putback(O1, O2), 8), t) :- goal(C, putback(O1, O2), t), subtask(re_arrange_office(C), putback(O1, O2), 8).
goal(subtask(re_arrange_office(C), putback(O1, O2), 9), t) :- goal(C, putback(O1, O2), t), subtask(re_arrange_office(C), putback(O1, O2), 9).
goal(subtask(re_arrange_office(C), putback(O1, O2), 10), t) :- goal(C, putback(O1, O2), t), subtask(re_arrange_office(C), putback(O1, O2), 10).
goal(subtask(re_arrange_office(C), putback(O1, O2), 11), t) :- goal(C, putback(O1, O2), t), subtask(re_arrange_office(C), putback(O1, O2), 11).
goal(subtask(re_arrange_office(C), putback(O1, O2), 12), t) :- goal(C, putback(O1, O2), t), subtask(re_arrange_office(C), putback(O1, O2), 12).
goal(subtask(re_arrange_office(C), lookat(O), 13), t) :- goal(C, lookat(O), t), subtask(re_arrange_office(C), lookat(O), 13).
goal(subtask(re_arrange_office(C), grab(O), 14), t) :- goal(C, grab(O), t), subtask(re_arrange_office(C), grab(O), 14).
goal(subtask(re_arrange_office(C), putback(O1, O2), 15), t) :- goal(C, putback(O1, O2), t), subtask(re_arrange_office(C), putback(O1, O2), 15).
goal(subtask(re_arrange_office(C), lookat(O), 16), t) :- goal(C, lookat(O), t), subtask(re_arrange_office(C), lookat(O), 16).
goal(subtask(re_arrange_office(C), grab(O), 17), t) :- goal(C, grab(O), t), subtask(re_arrange_office(C), grab(O), 17).
goal(subtask(re_arrange_office(C), putback(O1, O2), 18), t) :- goal(C, putback(O1, O2), t), subtask(re_arrange_office(C), putback(O1, O2), 18).
goal(subtask(re_arrange_office(C), lookat(O), 19), t) :- goal(C, lookat(O), t), subtask(re_arrange_office(C), lookat(O), 19).
goal(subtask(re_arrange_office(C), grab(O), 20), t) :- goal(C, grab(O), t), subtask(re_arrange_office(C), grab(O), 20).
goal(subtask(re_arrange_office(C), putback(O1, O2), 21), t) :- goal(C, putback(O1, O2), t), subtask(re_arrange_office(C), putback(O1, O2), 21).
