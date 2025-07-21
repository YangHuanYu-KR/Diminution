#program step(t).

goal(push_in_desk_chair(C), t) :- subtask(push_in_desk_chair(C)), subtask(push_in_desk_chair(C), walk(O1_1), 1), goal(subtask(push_in_desk_chair(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(push_in_desk_chair(C), touch(O2_1), 2), goal(subtask(push_in_desk_chair(C), touch(O2_1), 2), T1), T1 <= T2, time(T1), subtask(push_in_desk_chair(C), putback(O3_1, O3_2), 3), goal(subtask(push_in_desk_chair(C), putback(O3_1, O3_2), 3), T2), T2 <= t, time(T2).

goal(subtask(push_in_desk_chair(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(push_in_desk_chair(C), walk(O), 1).
goal(subtask(push_in_desk_chair(C), touch(O), 2), t) :- goal(C, touch(O), t), subtask(push_in_desk_chair(C), touch(O), 2).
goal(subtask(push_in_desk_chair(C), putback(O1, O2), 3), t) :- goal(C, putback(O1, O2), t), subtask(push_in_desk_chair(C), putback(O1, O2), 3).
