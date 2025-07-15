#program step(t).

goal(prepare_dinner(C), T0, t, 1) :- subtask(prepare_dinner(C)), subtask(prepare_dinner(C), walk(O1_1), 1), goal(subtask(prepare_dinner(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(prepare_dinner(C), open(O2_1), 2), goal(subtask(prepare_dinner(C), open(O2_1), 2), T1), T1 <= T2, time(T1), subtask(prepare_dinner(C), grab(O3_1), 3), goal(subtask(prepare_dinner(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(prepare_dinner(C), T3, t, 2) :- subtask(prepare_dinner(C), grab(O4_1), 4), goal(subtask(prepare_dinner(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(prepare_dinner(C), close(O5_1), 5), goal(subtask(prepare_dinner(C), close(O5_1), 5), T4), T4 <= T5, time(T4), subtask(prepare_dinner(C), walk(O6_1), 6), goal(subtask(prepare_dinner(C), walk(O6_1), 6), T5), T5 <= t, time(T5).
goal(prepare_dinner(C), T0, t, 3) :- goal(prepare_dinner(C), T0, T2, 1), goal(prepare_dinner(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(prepare_dinner(C), T6, t, 4) :- subtask(prepare_dinner(C), putin(O7_1, O7_2), 7), goal(subtask(prepare_dinner(C), putin(O7_1, O7_2), 7), T6), T6 <= T7, time(T6), subtask(prepare_dinner(C), grab(O8_1), 8), goal(subtask(prepare_dinner(C), grab(O8_1), 8), T7), T7 <= T8, time(T7), subtask(prepare_dinner(C), putin(O9_1, O9_2), 9), goal(subtask(prepare_dinner(C), putin(O9_1, O9_2), 9), T8), T8 <= t, time(T8).
goal(prepare_dinner(C), T0, t, 5) :- goal(prepare_dinner(C), T0, T5, 3), goal(prepare_dinner(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(prepare_dinner(C), T9, t, 6) :- subtask(prepare_dinner(C), walk(O10_1), 10), goal(subtask(prepare_dinner(C), walk(O10_1), 10), T9), T9 <= T10, time(T9), subtask(prepare_dinner(C), grab(O11_1), 11), goal(subtask(prepare_dinner(C), grab(O11_1), 11), T10), T10 <= T11, time(T10), subtask(prepare_dinner(C), cut(O12_1), 12), goal(subtask(prepare_dinner(C), cut(O12_1), 12), T11), T11 <= t, time(T11).
goal(prepare_dinner(C), T0, t, 7) :- goal(prepare_dinner(C), T0, T8, 5), goal(prepare_dinner(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(prepare_dinner(C), T12, t, 8) :- subtask(prepare_dinner(C), walk(O13_1), 13), goal(subtask(prepare_dinner(C), walk(O13_1), 13), T12), T12 <= T13, time(T12), subtask(prepare_dinner(C), switchon(O14_1), 14), goal(subtask(prepare_dinner(C), switchon(O14_1), 14), T13), T13 <= T14, time(T13), subtask(prepare_dinner(C), eat(O15_1), 15), goal(subtask(prepare_dinner(C), eat(O15_1), 15), T14), T14 <= t, time(T14).
goal(prepare_dinner(C), T0, t, 9) :- goal(prepare_dinner(C), T0, T11, 7), goal(prepare_dinner(C), T12, T14, 8), time(T0), time(T11), time(T12), T11 <= T12, time(T14), T12 <= t.
goal(prepare_dinner(C), T15, t, 10) :- subtask(prepare_dinner(C), walk(O16_1), 16), goal(subtask(prepare_dinner(C), walk(O16_1), 16), T15), T15 <= T16, time(T15), subtask(prepare_dinner(C), open(O17_1), 17), goal(subtask(prepare_dinner(C), open(O17_1), 17), T16), T16 <= T17, time(T16), subtask(prepare_dinner(C), grab(O18_1), 18), goal(subtask(prepare_dinner(C), grab(O18_1), 18), T17), T17 <= t, time(T17).
goal(prepare_dinner(C), T0, t, 11) :- goal(prepare_dinner(C), T0, T14, 9), goal(prepare_dinner(C), T15, T17, 10), time(T0), time(T14), time(T15), T14 <= T15, time(T17), T15 <= t.
goal(prepare_dinner(C), T18, t, 12) :- subtask(prepare_dinner(C), close(O19_1), 19), goal(subtask(prepare_dinner(C), close(O19_1), 19), T18), T18 <= T19, time(T18), subtask(prepare_dinner(C), putin(O20_1, O20_2), 20), goal(subtask(prepare_dinner(C), putin(O20_1, O20_2), 20), T19), T19 <= T20, time(T19), subtask(prepare_dinner(C), putin(O21_1, O21_2), 21), goal(subtask(prepare_dinner(C), putin(O21_1, O21_2), 21), T20), T20 <= t, time(T20).
goal(prepare_dinner(C), T0, t, 13) :- goal(prepare_dinner(C), T0, T17, 11), goal(prepare_dinner(C), T18, T20, 12), time(T0), time(T17), time(T18), T17 <= T18, time(T20), T18 <= t.
goal(prepare_dinner(C), T21, t, 14) :- subtask(prepare_dinner(C), walk(O22_1), 22), goal(subtask(prepare_dinner(C), walk(O22_1), 22), T21), T21 <= T22, time(T21), subtask(prepare_dinner(C), putin(O23_1, O23_2), 23), goal(subtask(prepare_dinner(C), putin(O23_1, O23_2), 23), T22), T22 <= T23, time(T22), subtask(prepare_dinner(C), switchoff(O24_1), 24), goal(subtask(prepare_dinner(C), switchoff(O24_1), 24), T23), T23 <= t, time(T23).
goal(prepare_dinner(C), t) :- goal(prepare_dinner(C), T0, T20, 13), goal(prepare_dinner(C), T21, t, 14), time(T0), time(T20), time(T21), T20 <= T21.

goal(subtask(prepare_dinner(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 1).
goal(subtask(prepare_dinner(C), open(O), 2), t) :- goal(C, open(O), t), subtask(prepare_dinner(C), open(O), 2).
goal(subtask(prepare_dinner(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(prepare_dinner(C), grab(O), 3).
goal(subtask(prepare_dinner(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(prepare_dinner(C), grab(O), 4).
goal(subtask(prepare_dinner(C), close(O), 5), t) :- goal(C, close(O), t), subtask(prepare_dinner(C), close(O), 5).
goal(subtask(prepare_dinner(C), walk(O), 6), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 6).
goal(subtask(prepare_dinner(C), putin(O1, O2), 7), t) :- goal(C, putin(O1, O2), t), subtask(prepare_dinner(C), putin(O1, O2), 7).
goal(subtask(prepare_dinner(C), grab(O), 8), t) :- goal(C, grab(O), t), subtask(prepare_dinner(C), grab(O), 8).
goal(subtask(prepare_dinner(C), putin(O1, O2), 9), t) :- goal(C, putin(O1, O2), t), subtask(prepare_dinner(C), putin(O1, O2), 9).
goal(subtask(prepare_dinner(C), walk(O), 10), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 10).
goal(subtask(prepare_dinner(C), grab(O), 11), t) :- goal(C, grab(O), t), subtask(prepare_dinner(C), grab(O), 11).
goal(subtask(prepare_dinner(C), cut(O), 12), t) :- goal(C, cut(O), t), subtask(prepare_dinner(C), cut(O), 12).
goal(subtask(prepare_dinner(C), walk(O), 13), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 13).
goal(subtask(prepare_dinner(C), switchon(O), 14), t) :- goal(C, switchon(O), t), subtask(prepare_dinner(C), switchon(O), 14).
goal(subtask(prepare_dinner(C), eat(O), 15), t) :- goal(C, eat(O), t), subtask(prepare_dinner(C), eat(O), 15).
goal(subtask(prepare_dinner(C), walk(O), 16), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 16).
goal(subtask(prepare_dinner(C), open(O), 17), t) :- goal(C, open(O), t), subtask(prepare_dinner(C), open(O), 17).
goal(subtask(prepare_dinner(C), grab(O), 18), t) :- goal(C, grab(O), t), subtask(prepare_dinner(C), grab(O), 18).
goal(subtask(prepare_dinner(C), close(O), 19), t) :- goal(C, close(O), t), subtask(prepare_dinner(C), close(O), 19).
goal(subtask(prepare_dinner(C), putin(O1, O2), 20), t) :- goal(C, putin(O1, O2), t), subtask(prepare_dinner(C), putin(O1, O2), 20).
goal(subtask(prepare_dinner(C), putin(O1, O2), 21), t) :- goal(C, putin(O1, O2), t), subtask(prepare_dinner(C), putin(O1, O2), 21).
goal(subtask(prepare_dinner(C), walk(O), 22), t) :- goal(C, walk(O), t), subtask(prepare_dinner(C), walk(O), 22).
goal(subtask(prepare_dinner(C), putin(O1, O2), 23), t) :- goal(C, putin(O1, O2), t), subtask(prepare_dinner(C), putin(O1, O2), 23).
goal(subtask(prepare_dinner(C), switchoff(O), 24), t) :- goal(C, switchoff(O), t), subtask(prepare_dinner(C), switchoff(O), 24).
