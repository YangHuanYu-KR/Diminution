#program step(t).

goal(have_conversation_with_boyfriend(C), T0, t, 1) :- subtask(have_conversation_with_boyfriend(C)), subtask(have_conversation_with_boyfriend(C), walk(O1_1), 1), goal(subtask(have_conversation_with_boyfriend(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(have_conversation_with_boyfriend(C), sit(O2_1), 2), goal(subtask(have_conversation_with_boyfriend(C), sit(O2_1), 2), T1), T1 <= T2, time(T1), subtask(have_conversation_with_boyfriend(C), turnto(O3_1), 3), goal(subtask(have_conversation_with_boyfriend(C), turnto(O3_1), 3), T2), T2 <= t, time(T2).
goal(have_conversation_with_boyfriend(C), T3, t, 2) :- subtask(have_conversation_with_boyfriend(C), drink(O4_1), 4), goal(subtask(have_conversation_with_boyfriend(C), drink(O4_1), 4), T3), T3 <= t, time(T3).
goal(have_conversation_with_boyfriend(C), t) :- goal(have_conversation_with_boyfriend(C), T0, T2, 1), goal(have_conversation_with_boyfriend(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(have_conversation_with_boyfriend(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(have_conversation_with_boyfriend(C), walk(O), 1).
goal(subtask(have_conversation_with_boyfriend(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(have_conversation_with_boyfriend(C), sit(O), 2).
goal(subtask(have_conversation_with_boyfriend(C), turnto(O), 3), t) :- goal(C, turnto(O), t), subtask(have_conversation_with_boyfriend(C), turnto(O), 3).
goal(subtask(have_conversation_with_boyfriend(C), drink(O), 4), t) :- goal(C, drink(O), t), subtask(have_conversation_with_boyfriend(C), drink(O), 4).
