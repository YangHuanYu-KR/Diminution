#program step(t).

goal(rearrange_photo_frames(C), T0, t, 1) :- subtask(rearrange_photo_frames(C)), subtask(rearrange_photo_frames(C), walk(O1_1), 1), goal(subtask(rearrange_photo_frames(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(rearrange_photo_frames(C), grab(O2_1), 2), goal(subtask(rearrange_photo_frames(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(rearrange_photo_frames(C), walk(O3_1), 3), goal(subtask(rearrange_photo_frames(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(rearrange_photo_frames(C), T3, t, 2) :- subtask(rearrange_photo_frames(C), putback(O4_1, O4_2), 4), goal(subtask(rearrange_photo_frames(C), putback(O4_1, O4_2), 4), T3), T3 <= T4, time(T3), subtask(rearrange_photo_frames(C), walk(O5_1), 5), goal(subtask(rearrange_photo_frames(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(rearrange_photo_frames(C), grab(O6_1), 6), goal(subtask(rearrange_photo_frames(C), grab(O6_1), 6), T5), T5 <= t, time(T5).
goal(rearrange_photo_frames(C), T0, t, 3) :- goal(rearrange_photo_frames(C), T0, T2, 1), goal(rearrange_photo_frames(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(rearrange_photo_frames(C), T6, t, 4) :- subtask(rearrange_photo_frames(C), walk(O7_1), 7), goal(subtask(rearrange_photo_frames(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(rearrange_photo_frames(C), putback(O8_1, O8_2), 8), goal(subtask(rearrange_photo_frames(C), putback(O8_1, O8_2), 8), T7), T7 <= t, time(T7).
goal(rearrange_photo_frames(C), t) :- goal(rearrange_photo_frames(C), T0, T5, 3), goal(rearrange_photo_frames(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(rearrange_photo_frames(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(rearrange_photo_frames(C), walk(O), 1).
goal(subtask(rearrange_photo_frames(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(rearrange_photo_frames(C), grab(O), 2).
goal(subtask(rearrange_photo_frames(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(rearrange_photo_frames(C), walk(O), 3).
goal(subtask(rearrange_photo_frames(C), putback(O1, O2), 4), t) :- goal(C, putback(O1, O2), t), subtask(rearrange_photo_frames(C), putback(O1, O2), 4).
goal(subtask(rearrange_photo_frames(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(rearrange_photo_frames(C), walk(O), 5).
goal(subtask(rearrange_photo_frames(C), grab(O), 6), t) :- goal(C, grab(O), t), subtask(rearrange_photo_frames(C), grab(O), 6).
goal(subtask(rearrange_photo_frames(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(rearrange_photo_frames(C), walk(O), 7).
goal(subtask(rearrange_photo_frames(C), putback(O1, O2), 8), t) :- goal(C, putback(O1, O2), t), subtask(rearrange_photo_frames(C), putback(O1, O2), 8).
