#program step(t).

goal(straighten_paintings_on_wall(C), t) :- subtask(straighten_paintings_on_wall(C)), subtask(straighten_paintings_on_wall(C), walk(O1_1), 1), goal(subtask(straighten_paintings_on_wall(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(straighten_paintings_on_wall(C), touch(O2_1), 2), goal(subtask(straighten_paintings_on_wall(C), touch(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(straighten_paintings_on_wall(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(straighten_paintings_on_wall(C), walk(O), 1).
goal(subtask(straighten_paintings_on_wall(C), touch(O), 2), t) :- goal(C, touch(O), t), subtask(straighten_paintings_on_wall(C), touch(O), 2).
