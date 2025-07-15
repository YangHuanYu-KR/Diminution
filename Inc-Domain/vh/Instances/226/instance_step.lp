#program step(t).

goal(keep_an_eye_on_stove_as_something_is_cooking(C), t) :- subtask(keep_an_eye_on_stove_as_something_is_cooking(C)), subtask(keep_an_eye_on_stove_as_something_is_cooking(C), walk(O1_1), 1), goal(subtask(keep_an_eye_on_stove_as_something_is_cooking(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(keep_an_eye_on_stove_as_something_is_cooking(C), find(O2_1), 2), goal(subtask(keep_an_eye_on_stove_as_something_is_cooking(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(keep_an_eye_on_stove_as_something_is_cooking(C), watch(O3_1), 3), goal(subtask(keep_an_eye_on_stove_as_something_is_cooking(C), watch(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(keep_an_eye_on_stove_as_something_is_cooking(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(keep_an_eye_on_stove_as_something_is_cooking(C), walk(O), 1).
goal(subtask(keep_an_eye_on_stove_as_something_is_cooking(C), find(O), 2), t) :- goal(C, find(O), t), subtask(keep_an_eye_on_stove_as_something_is_cooking(C), find(O), 2).
goal(subtask(keep_an_eye_on_stove_as_something_is_cooking(C), watch(O), 3), t) :- goal(C, watch(O), t), subtask(keep_an_eye_on_stove_as_something_is_cooking(C), watch(O), 3).
