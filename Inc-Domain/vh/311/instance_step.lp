#program step(t).

goal(brush_teeth(C), T0, t, 1) :- subtask(brush_teeth(C)), subtask(brush_teeth(C), walk(O1_1), 1), goal(subtask(brush_teeth(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(brush_teeth(C), grab(O2_1), 2), goal(subtask(brush_teeth(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(brush_teeth(C), grab(O3_1), 3), goal(subtask(brush_teeth(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(brush_teeth(C), T3, t, 2) :- subtask(brush_teeth(C), walk(O4_1), 4), goal(subtask(brush_teeth(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(brush_teeth(C), open(O5_1), 5), goal(subtask(brush_teeth(C), open(O5_1), 5), T4), T4 <= T5, time(T4), subtask(brush_teeth(C), putin(O6_1, O6_2), 6), goal(subtask(brush_teeth(C), putin(O6_1, O6_2), 6), T5), T5 <= t, time(T5).
goal(brush_teeth(C), T0, t, 3) :- goal(brush_teeth(C), T0, T2, 1), goal(brush_teeth(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(brush_teeth(C), T6, t, 4) :- subtask(brush_teeth(C), close(O7_1), 7), goal(subtask(brush_teeth(C), close(O7_1), 7), T6), T6 <= T7, time(T6), subtask(brush_teeth(C), touch(O8_1), 8), goal(subtask(brush_teeth(C), touch(O8_1), 8), T7), T7 <= T8, time(T7), subtask(brush_teeth(C), wash(O9_1), 9), goal(subtask(brush_teeth(C), wash(O9_1), 9), T8), T8 <= t, time(T8).
goal(brush_teeth(C), T0, t, 5) :- goal(brush_teeth(C), T0, T5, 3), goal(brush_teeth(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(brush_teeth(C), T9, t, 6) :- subtask(brush_teeth(C), wash(O10_1), 10), goal(subtask(brush_teeth(C), wash(O10_1), 10), T9), T9 <= T10, time(T9), subtask(brush_teeth(C), putback(O11_1, O11_2), 11), goal(subtask(brush_teeth(C), putback(O11_1, O11_2), 11), T10), T10 <= t, time(T10).
goal(brush_teeth(C), t) :- goal(brush_teeth(C), T0, T8, 5), goal(brush_teeth(C), T9, t, 6), time(T0), time(T8), time(T9), T8 <= T9.

goal(subtask(brush_teeth(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(brush_teeth(C), walk(O), 1).
goal(subtask(brush_teeth(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(brush_teeth(C), grab(O), 2).
goal(subtask(brush_teeth(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(brush_teeth(C), grab(O), 3).
goal(subtask(brush_teeth(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(brush_teeth(C), walk(O), 4).
goal(subtask(brush_teeth(C), open(O), 5), t) :- goal(C, open(O), t), subtask(brush_teeth(C), open(O), 5).
goal(subtask(brush_teeth(C), putin(O1, O2), 6), t) :- goal(C, putin(O1, O2), t), subtask(brush_teeth(C), putin(O1, O2), 6).
goal(subtask(brush_teeth(C), close(O), 7), t) :- goal(C, close(O), t), subtask(brush_teeth(C), close(O), 7).
goal(subtask(brush_teeth(C), touch(O), 8), t) :- goal(C, touch(O), t), subtask(brush_teeth(C), touch(O), 8).
goal(subtask(brush_teeth(C), wash(O), 9), t) :- goal(C, wash(O), t), subtask(brush_teeth(C), wash(O), 9).
goal(subtask(brush_teeth(C), wash(O), 10), t) :- goal(C, wash(O), t), subtask(brush_teeth(C), wash(O), 10).
goal(subtask(brush_teeth(C), putback(O1, O2), 11), t) :- goal(C, putback(O1, O2), t), subtask(brush_teeth(C), putback(O1, O2), 11).
