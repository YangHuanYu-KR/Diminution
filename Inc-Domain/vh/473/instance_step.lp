#program step(t).

goal(draft_home(C), T0, t, 1) :- subtask(draft_home(C)), subtask(draft_home(C), walk(O1_1), 1), goal(subtask(draft_home(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(draft_home(C), grab(O2_1), 2), goal(subtask(draft_home(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(draft_home(C), grab(O3_1), 3), goal(subtask(draft_home(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(draft_home(C), T3, t, 2) :- subtask(draft_home(C), sit(O4_1), 4), goal(subtask(draft_home(C), sit(O4_1), 4), T3), T3 <= T4, time(T3), subtask(draft_home(C), touch(O5_1), 5), goal(subtask(draft_home(C), touch(O5_1), 5), T4), T4 <= T5, time(T4), subtask(draft_home(C), putback(O6_1, O6_2), 6), goal(subtask(draft_home(C), putback(O6_1, O6_2), 6), T5), T5 <= t, time(T5).
goal(draft_home(C), T0, t, 3) :- goal(draft_home(C), T0, T2, 1), goal(draft_home(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(draft_home(C), T6, t, 4) :- subtask(draft_home(C), standup, 7), goal(subtask(draft_home(C), standup, 7), T6), T6 <= T7, time(T6), subtask(draft_home(C), walk(O8_1), 8), goal(subtask(draft_home(C), walk(O8_1), 8), T7), T7 <= t, time(T7).
goal(draft_home(C), t) :- goal(draft_home(C), T0, T5, 3), goal(draft_home(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(draft_home(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(draft_home(C), walk(O), 1).
goal(subtask(draft_home(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(draft_home(C), grab(O), 2).
goal(subtask(draft_home(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(draft_home(C), grab(O), 3).
goal(subtask(draft_home(C), sit(O), 4), t) :- goal(C, sit(O), t), subtask(draft_home(C), sit(O), 4).
goal(subtask(draft_home(C), touch(O), 5), t) :- goal(C, touch(O), t), subtask(draft_home(C), touch(O), 5).
goal(subtask(draft_home(C), putback(O1, O2), 6), t) :- goal(C, putback(O1, O2), t), subtask(draft_home(C), putback(O1, O2), 6).
goal(subtask(draft_home(C), standup, 7), t) :- goal(C, standup, t), subtask(draft_home(C), standup, 7).
goal(subtask(draft_home(C), walk(O), 8), t) :- goal(C, walk(O), t), subtask(draft_home(C), walk(O), 8).
