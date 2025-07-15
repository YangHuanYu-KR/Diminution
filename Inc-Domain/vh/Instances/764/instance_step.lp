#program step(t).

goal(keep_an_eye_on_stove_as_something_is_cooking(C), t) :- subtask(keep_an_eye_on_stove_as_something_is_cooking(C)), subtask(keep_an_eye_on_stove_as_something_is_cooking(C), cut(O1_1), 1), goal(subtask(keep_an_eye_on_stove_as_something_is_cooking(C), cut(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(keep_an_eye_on_stove_as_something_is_cooking(C), cut(O), 1), t) :- goal(C, cut(O), t), subtask(keep_an_eye_on_stove_as_something_is_cooking(C), cut(O), 1).
