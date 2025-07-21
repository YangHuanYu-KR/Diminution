#program step(t).

goal(throw_away_newspaper(C), t) :- subtask(throw_away_newspaper(C)), subtask(throw_away_newspaper(C), walk(O1_1), 1), goal(subtask(throw_away_newspaper(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(throw_away_newspaper(C), switchon(O2_1), 2), goal(subtask(throw_away_newspaper(C), switchon(O2_1), 2), T1), T1 <= T2, time(T1), subtask(throw_away_newspaper(C), putin(O3_1, O3_2), 3), goal(subtask(throw_away_newspaper(C), putin(O3_1, O3_2), 3), T2), T2 <= t, time(T2).

goal(subtask(throw_away_newspaper(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(throw_away_newspaper(C), walk(O), 1).
goal(subtask(throw_away_newspaper(C), switchon(O), 2), t) :- goal(C, switchon(O), t), subtask(throw_away_newspaper(C), switchon(O), 2).
goal(subtask(throw_away_newspaper(C), putin(O1, O2), 3), t) :- goal(C, putin(O1, O2), t), subtask(throw_away_newspaper(C), putin(O1, O2), 3).
