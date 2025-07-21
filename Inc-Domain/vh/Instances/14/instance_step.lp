#program step(t).

goal(write__school_paper(C), t) :- subtask(write__school_paper(C)), subtask(write__school_paper(C), open(O1_1), 1), goal(subtask(write__school_paper(C), open(O1_1), 1), T0), T0 <= T1, time(T0), subtask(write__school_paper(C), read(O2_1), 2), goal(subtask(write__school_paper(C), read(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(write__school_paper(C), open(O), 1), t) :- goal(C, open(O), t), subtask(write__school_paper(C), open(O), 1).
goal(subtask(write__school_paper(C), read(O), 2), t) :- goal(C, read(O), t), subtask(write__school_paper(C), read(O), 2).
