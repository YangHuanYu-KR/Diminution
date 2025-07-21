#program step(t).

goal(put_on_your_shoes(C), T0, t, 1) :- subtask(put_on_your_shoes(C)), subtask(put_on_your_shoes(C), walk(O1_1), 1), goal(subtask(put_on_your_shoes(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(put_on_your_shoes(C), grab(O2_1), 2), goal(subtask(put_on_your_shoes(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(put_on_your_shoes(C), walk(O3_1), 3), goal(subtask(put_on_your_shoes(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(put_on_your_shoes(C), T3, t, 2) :- subtask(put_on_your_shoes(C), putin(O4_1, O4_2), 4), goal(subtask(put_on_your_shoes(C), putin(O4_1, O4_2), 4), T3), T3 <= T4, time(T3), subtask(put_on_your_shoes(C), standup, 5), goal(subtask(put_on_your_shoes(C), standup, 5), T4), T4 <= t, time(T4).
goal(put_on_your_shoes(C), t) :- goal(put_on_your_shoes(C), T0, T2, 1), goal(put_on_your_shoes(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(put_on_your_shoes(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(put_on_your_shoes(C), walk(O), 1).
goal(subtask(put_on_your_shoes(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(put_on_your_shoes(C), grab(O), 2).
goal(subtask(put_on_your_shoes(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(put_on_your_shoes(C), walk(O), 3).
goal(subtask(put_on_your_shoes(C), putin(O1, O2), 4), t) :- goal(C, putin(O1, O2), t), subtask(put_on_your_shoes(C), putin(O1, O2), 4).
goal(subtask(put_on_your_shoes(C), standup, 5), t) :- goal(C, standup, t), subtask(put_on_your_shoes(C), standup, 5).
