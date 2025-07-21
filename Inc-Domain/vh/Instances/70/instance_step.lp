#program step(t).

goal(have_conversation_with_boyfriend(C), t) :- subtask(have_conversation_with_boyfriend(C)), subtask(have_conversation_with_boyfriend(C), walk(O1_1), 1), goal(subtask(have_conversation_with_boyfriend(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(have_conversation_with_boyfriend(C), walk(O2_1), 2), goal(subtask(have_conversation_with_boyfriend(C), walk(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(have_conversation_with_boyfriend(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(have_conversation_with_boyfriend(C), walk(O), 1).
goal(subtask(have_conversation_with_boyfriend(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(have_conversation_with_boyfriend(C), walk(O), 2).
