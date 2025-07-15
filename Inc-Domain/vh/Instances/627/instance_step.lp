#program step(t).

goal(push_in_desk_chair(C), T0, t, 1) :- subtask(push_in_desk_chair(C)), subtask(push_in_desk_chair(C), walk(O1_1), 1), goal(subtask(push_in_desk_chair(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(push_in_desk_chair(C), walk(O2_1), 2), goal(subtask(push_in_desk_chair(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(push_in_desk_chair(C), walk(O3_1), 3), goal(subtask(push_in_desk_chair(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(push_in_desk_chair(C), T3, t, 2) :- subtask(push_in_desk_chair(C), walk(O4_1), 4), goal(subtask(push_in_desk_chair(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(push_in_desk_chair(C), find(O5_1), 5), goal(subtask(push_in_desk_chair(C), find(O5_1), 5), T4), T4 <= T5, time(T4), subtask(push_in_desk_chair(C), open(O6_1), 6), goal(subtask(push_in_desk_chair(C), open(O6_1), 6), T5), T5 <= t, time(T5).
goal(push_in_desk_chair(C), T0, t, 3) :- goal(push_in_desk_chair(C), T0, T2, 1), goal(push_in_desk_chair(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(push_in_desk_chair(C), T6, t, 4) :- subtask(push_in_desk_chair(C), putin(O7_1, O7_2), 7), goal(subtask(push_in_desk_chair(C), putin(O7_1, O7_2), 7), T6), T6 <= T7, time(T6), subtask(push_in_desk_chair(C), close(O8_1), 8), goal(subtask(push_in_desk_chair(C), close(O8_1), 8), T7), T7 <= T8, time(T7), subtask(push_in_desk_chair(C), walk(O9_1), 9), goal(subtask(push_in_desk_chair(C), walk(O9_1), 9), T8), T8 <= t, time(T8).
goal(push_in_desk_chair(C), T0, t, 5) :- goal(push_in_desk_chair(C), T0, T5, 3), goal(push_in_desk_chair(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(push_in_desk_chair(C), T9, t, 6) :- subtask(push_in_desk_chair(C), walk(O10_1), 10), goal(subtask(push_in_desk_chair(C), walk(O10_1), 10), T9), T9 <= T10, time(T9), subtask(push_in_desk_chair(C), switchon(O11_1), 11), goal(subtask(push_in_desk_chair(C), switchon(O11_1), 11), T10), T10 <= t, time(T10).
goal(push_in_desk_chair(C), t) :- goal(push_in_desk_chair(C), T0, T8, 5), goal(push_in_desk_chair(C), T9, t, 6), time(T0), time(T8), time(T9), T8 <= T9.

goal(subtask(push_in_desk_chair(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(push_in_desk_chair(C), walk(O), 1).
goal(subtask(push_in_desk_chair(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(push_in_desk_chair(C), walk(O), 2).
goal(subtask(push_in_desk_chair(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(push_in_desk_chair(C), walk(O), 3).
goal(subtask(push_in_desk_chair(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(push_in_desk_chair(C), walk(O), 4).
goal(subtask(push_in_desk_chair(C), find(O), 5), t) :- goal(C, find(O), t), subtask(push_in_desk_chair(C), find(O), 5).
goal(subtask(push_in_desk_chair(C), open(O), 6), t) :- goal(C, open(O), t), subtask(push_in_desk_chair(C), open(O), 6).
goal(subtask(push_in_desk_chair(C), putin(O1, O2), 7), t) :- goal(C, putin(O1, O2), t), subtask(push_in_desk_chair(C), putin(O1, O2), 7).
goal(subtask(push_in_desk_chair(C), close(O), 8), t) :- goal(C, close(O), t), subtask(push_in_desk_chair(C), close(O), 8).
goal(subtask(push_in_desk_chair(C), walk(O), 9), t) :- goal(C, walk(O), t), subtask(push_in_desk_chair(C), walk(O), 9).
goal(subtask(push_in_desk_chair(C), walk(O), 10), t) :- goal(C, walk(O), t), subtask(push_in_desk_chair(C), walk(O), 10).
goal(subtask(push_in_desk_chair(C), switchon(O), 11), t) :- goal(C, switchon(O), t), subtask(push_in_desk_chair(C), switchon(O), 11).
