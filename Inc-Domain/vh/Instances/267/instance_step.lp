#program step(t).

goal(pet_cat(C), t) :- subtask(pet_cat(C)), subtask(pet_cat(C), walk(O1_1), 1), goal(subtask(pet_cat(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(pet_cat(C), touch(O2_1), 2), goal(subtask(pet_cat(C), touch(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(pet_cat(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(pet_cat(C), walk(O), 1).
goal(subtask(pet_cat(C), touch(O), 2), t) :- goal(C, touch(O), t), subtask(pet_cat(C), touch(O), 2).
