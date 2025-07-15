#program step(t).

goal(write__school_paper(C), T0, t, 1) :- subtask(write__school_paper(C)), subtask(write__school_paper(C), walk(O1_1), 1), goal(subtask(write__school_paper(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(write__school_paper(C), sit(O2_1), 2), goal(subtask(write__school_paper(C), sit(O2_1), 2), T1), T1 <= T2, time(T1), subtask(write__school_paper(C), grab(O3_1), 3), goal(subtask(write__school_paper(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(write__school_paper(C), T3, t, 2) :- subtask(write__school_paper(C), grab(O4_1), 4), goal(subtask(write__school_paper(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(write__school_paper(C), touch(O5_1), 5), goal(subtask(write__school_paper(C), touch(O5_1), 5), T4), T4 <= T5, time(T4), subtask(write__school_paper(C), lookat(O6_1), 6), goal(subtask(write__school_paper(C), lookat(O6_1), 6), T5), T5 <= t, time(T5).
goal(write__school_paper(C), t) :- goal(write__school_paper(C), T0, T2, 1), goal(write__school_paper(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(write__school_paper(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(write__school_paper(C), walk(O), 1).
goal(subtask(write__school_paper(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(write__school_paper(C), sit(O), 2).
goal(subtask(write__school_paper(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(write__school_paper(C), grab(O), 3).
goal(subtask(write__school_paper(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(write__school_paper(C), grab(O), 4).
goal(subtask(write__school_paper(C), touch(O), 5), t) :- goal(C, touch(O), t), subtask(write__school_paper(C), touch(O), 5).
goal(subtask(write__school_paper(C), lookat(O), 6), t) :- goal(C, lookat(O), t), subtask(write__school_paper(C), lookat(O), 6).
