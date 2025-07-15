#program step(t).

goal(throw_away_newspaper(C), T0, t, 1) :- subtask(throw_away_newspaper(C)), subtask(throw_away_newspaper(C), walk(O1_1), 1), goal(subtask(throw_away_newspaper(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(throw_away_newspaper(C), grab(O2_1), 2), goal(subtask(throw_away_newspaper(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(throw_away_newspaper(C), walk(O3_1), 3), goal(subtask(throw_away_newspaper(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(throw_away_newspaper(C), T3, t, 2) :- subtask(throw_away_newspaper(C), drop(O4_1), 4), goal(subtask(throw_away_newspaper(C), drop(O4_1), 4), T3), T3 <= t, time(T3).
goal(throw_away_newspaper(C), t) :- goal(throw_away_newspaper(C), T0, T2, 1), goal(throw_away_newspaper(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(throw_away_newspaper(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(throw_away_newspaper(C), walk(O), 1).
goal(subtask(throw_away_newspaper(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(throw_away_newspaper(C), grab(O), 2).
goal(subtask(throw_away_newspaper(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(throw_away_newspaper(C), walk(O), 3).
goal(subtask(throw_away_newspaper(C), drop(O), 4), t) :- goal(C, drop(O), t), subtask(throw_away_newspaper(C), drop(O), 4).
