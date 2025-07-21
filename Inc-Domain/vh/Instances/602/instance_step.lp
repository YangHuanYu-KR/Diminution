#program step(t).

goal(bring_me_red_cookbook(C), t) :- subtask(bring_me_red_cookbook(C)), subtask(bring_me_red_cookbook(C), walk(O1_1), 1), goal(subtask(bring_me_red_cookbook(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(bring_me_red_cookbook(C), grab(O2_1), 2), goal(subtask(bring_me_red_cookbook(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(bring_me_red_cookbook(C), find(O3_1), 3), goal(subtask(bring_me_red_cookbook(C), find(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(bring_me_red_cookbook(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(bring_me_red_cookbook(C), walk(O), 1).
goal(subtask(bring_me_red_cookbook(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(bring_me_red_cookbook(C), grab(O), 2).
goal(subtask(bring_me_red_cookbook(C), find(O), 3), t) :- goal(C, find(O), t), subtask(bring_me_red_cookbook(C), find(O), 3).
