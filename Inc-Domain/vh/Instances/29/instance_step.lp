#program step(t).

goal(pet_dog(C), t) :- subtask(pet_dog(C)), subtask(pet_dog(C), walk(O1_1), 1), goal(subtask(pet_dog(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(pet_dog(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(pet_dog(C), walk(O), 1).
