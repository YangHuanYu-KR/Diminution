#program step(t).

goal(put_umbrella_away(C), T0, t, 1) :- subtask(put_umbrella_away(C)), subtask(put_umbrella_away(C), walk(O1_1), 1), goal(subtask(put_umbrella_away(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(put_umbrella_away(C), grab(O2_1), 2), goal(subtask(put_umbrella_away(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(put_umbrella_away(C), walk(O3_1), 3), goal(subtask(put_umbrella_away(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(put_umbrella_away(C), T3, t, 2) :- subtask(put_umbrella_away(C), open(O4_1), 4), goal(subtask(put_umbrella_away(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(put_umbrella_away(C), putin(O5_1, O5_2), 5), goal(subtask(put_umbrella_away(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(put_umbrella_away(C), close(O6_1), 6), goal(subtask(put_umbrella_away(C), close(O6_1), 6), T5), T5 <= t, time(T5).
goal(put_umbrella_away(C), t) :- goal(put_umbrella_away(C), T0, T2, 1), goal(put_umbrella_away(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(put_umbrella_away(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(put_umbrella_away(C), walk(O), 1).
goal(subtask(put_umbrella_away(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(put_umbrella_away(C), grab(O), 2).
goal(subtask(put_umbrella_away(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(put_umbrella_away(C), walk(O), 3).
goal(subtask(put_umbrella_away(C), open(O), 4), t) :- goal(C, open(O), t), subtask(put_umbrella_away(C), open(O), 4).
goal(subtask(put_umbrella_away(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(put_umbrella_away(C), putin(O1, O2), 5).
goal(subtask(put_umbrella_away(C), close(O), 6), t) :- goal(C, close(O), t), subtask(put_umbrella_away(C), close(O), 6).
