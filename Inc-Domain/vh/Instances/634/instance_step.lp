#program step(t).

goal(deficate(C), T0, t, 1) :- subtask(deficate(C)), subtask(deficate(C), walk(O1_1), 1), goal(subtask(deficate(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(deficate(C), grab(O2_1), 2), goal(subtask(deficate(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(deficate(C), find(O3_1), 3), goal(subtask(deficate(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(deficate(C), T3, t, 2) :- subtask(deficate(C), open(O4_1), 4), goal(subtask(deficate(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(deficate(C), putin(O5_1, O5_2), 5), goal(subtask(deficate(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(deficate(C), close(O6_1), 6), goal(subtask(deficate(C), close(O6_1), 6), T5), T5 <= t, time(T5).
goal(deficate(C), T0, t, 3) :- goal(deficate(C), T0, T2, 1), goal(deficate(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(deficate(C), T6, t, 4) :- subtask(deficate(C), walk(O7_1), 7), goal(subtask(deficate(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(deficate(C), walk(O8_1), 8), goal(subtask(deficate(C), walk(O8_1), 8), T7), T7 <= T8, time(T7), subtask(deficate(C), walk(O9_1), 9), goal(subtask(deficate(C), walk(O9_1), 9), T8), T8 <= t, time(T8).
goal(deficate(C), T0, t, 5) :- goal(deficate(C), T0, T5, 3), goal(deficate(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(deficate(C), T9, t, 6) :- subtask(deficate(C), walk(O10_1), 10), goal(subtask(deficate(C), walk(O10_1), 10), T9), T9 <= T10, time(T9), subtask(deficate(C), switchon(O11_1), 11), goal(subtask(deficate(C), switchon(O11_1), 11), T10), T10 <= T11, time(T10), subtask(deficate(C), walk(O12_1), 12), goal(subtask(deficate(C), walk(O12_1), 12), T11), T11 <= t, time(T11).
goal(deficate(C), T0, t, 7) :- goal(deficate(C), T0, T8, 5), goal(deficate(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(deficate(C), T12, t, 8) :- subtask(deficate(C), walk(O13_1), 13), goal(subtask(deficate(C), walk(O13_1), 13), T12), T12 <= T13, time(T12), subtask(deficate(C), sit(O14_1), 14), goal(subtask(deficate(C), sit(O14_1), 14), T13), T13 <= T14, time(T13), subtask(deficate(C), drop(O15_1), 15), goal(subtask(deficate(C), drop(O15_1), 15), T14), T14 <= t, time(T14).
goal(deficate(C), T0, t, 9) :- goal(deficate(C), T0, T11, 7), goal(deficate(C), T12, T14, 8), time(T0), time(T11), time(T12), T11 <= T12, time(T14), T12 <= t.
goal(deficate(C), T15, t, 10) :- subtask(deficate(C), wash(O16_1), 16), goal(subtask(deficate(C), wash(O16_1), 16), T15), T15 <= T16, time(T15), subtask(deficate(C), standup, 17), goal(subtask(deficate(C), standup, 17), T16), T16 <= T17, time(T16), subtask(deficate(C), walk(O18_1), 18), goal(subtask(deficate(C), walk(O18_1), 18), T17), T17 <= t, time(T17).
goal(deficate(C), T0, t, 11) :- goal(deficate(C), T0, T14, 9), goal(deficate(C), T15, T17, 10), time(T0), time(T14), time(T15), T14 <= T15, time(T17), T15 <= t.
goal(deficate(C), T18, t, 12) :- subtask(deficate(C), walk(O19_1), 19), goal(subtask(deficate(C), walk(O19_1), 19), T18), T18 <= T19, time(T18), subtask(deficate(C), wash(O20_1), 20), goal(subtask(deficate(C), wash(O20_1), 20), T19), T19 <= T20, time(T19), subtask(deficate(C), drink(O21_1), 21), goal(subtask(deficate(C), drink(O21_1), 21), T20), T20 <= t, time(T20).
goal(deficate(C), T0, t, 13) :- goal(deficate(C), T0, T17, 11), goal(deficate(C), T18, T20, 12), time(T0), time(T17), time(T18), T17 <= T18, time(T20), T18 <= t.
goal(deficate(C), T21, t, 14) :- subtask(deficate(C), walk(O22_1), 22), goal(subtask(deficate(C), walk(O22_1), 22), T21), T21 <= T22, time(T21), subtask(deficate(C), walk(O23_1), 23), goal(subtask(deficate(C), walk(O23_1), 23), T22), T22 <= T23, time(T22), subtask(deficate(C), drop(O24_1), 24), goal(subtask(deficate(C), drop(O24_1), 24), T23), T23 <= t, time(T23).
goal(deficate(C), T0, t, 15) :- goal(deficate(C), T0, T20, 13), goal(deficate(C), T21, T23, 14), time(T0), time(T20), time(T21), T20 <= T21, time(T23), T21 <= t.
goal(deficate(C), T24, t, 16) :- subtask(deficate(C), walk(O25_1), 25), goal(subtask(deficate(C), walk(O25_1), 25), T24), T24 <= T25, time(T24), subtask(deficate(C), walk(O26_1), 26), goal(subtask(deficate(C), walk(O26_1), 26), T25), T25 <= T26, time(T25), subtask(deficate(C), open(O27_1), 27), goal(subtask(deficate(C), open(O27_1), 27), T26), T26 <= t, time(T26).
goal(deficate(C), T0, t, 17) :- goal(deficate(C), T0, T23, 15), goal(deficate(C), T24, T26, 16), time(T0), time(T23), time(T24), T23 <= T24, time(T26), T24 <= t.
goal(deficate(C), T27, t, 18) :- subtask(deficate(C), walk(O28_1), 28), goal(subtask(deficate(C), walk(O28_1), 28), T27), T27 <= T28, time(T27), subtask(deficate(C), walk(O29_1), 29), goal(subtask(deficate(C), walk(O29_1), 29), T28), T28 <= T29, time(T28), subtask(deficate(C), walk(O30_1), 30), goal(subtask(deficate(C), walk(O30_1), 30), T29), T29 <= t, time(T29).
goal(deficate(C), T0, t, 19) :- goal(deficate(C), T0, T26, 17), goal(deficate(C), T27, T29, 18), time(T0), time(T26), time(T27), T26 <= T27, time(T29), T27 <= t.
goal(deficate(C), T30, t, 20) :- subtask(deficate(C), sit(O31_1), 31), goal(subtask(deficate(C), sit(O31_1), 31), T30), T30 <= T31, time(T30), subtask(deficate(C), eat(O32_1), 32), goal(subtask(deficate(C), eat(O32_1), 32), T31), T31 <= T32, time(T31), subtask(deficate(C), walk(O33_1), 33), goal(subtask(deficate(C), walk(O33_1), 33), T32), T32 <= t, time(T32).
goal(deficate(C), T0, t, 21) :- goal(deficate(C), T0, T29, 19), goal(deficate(C), T30, T32, 20), time(T0), time(T29), time(T30), T29 <= T30, time(T32), T30 <= t.
goal(deficate(C), T33, t, 22) :- subtask(deficate(C), walk(O34_1), 34), goal(subtask(deficate(C), walk(O34_1), 34), T33), T33 <= T34, time(T33), subtask(deficate(C), sit(O35_1), 35), goal(subtask(deficate(C), sit(O35_1), 35), T34), T34 <= T35, time(T34), subtask(deficate(C), drop(O36_1), 36), goal(subtask(deficate(C), drop(O36_1), 36), T35), T35 <= t, time(T35).
goal(deficate(C), T0, t, 23) :- goal(deficate(C), T0, T32, 21), goal(deficate(C), T33, T35, 22), time(T0), time(T32), time(T33), T32 <= T33, time(T35), T33 <= t.
goal(deficate(C), T36, t, 24) :- subtask(deficate(C), wash(O37_1), 37), goal(subtask(deficate(C), wash(O37_1), 37), T36), T36 <= T37, time(T36), subtask(deficate(C), standup, 38), goal(subtask(deficate(C), standup, 38), T37), T37 <= T38, time(T37), subtask(deficate(C), walk(O39_1), 39), goal(subtask(deficate(C), walk(O39_1), 39), T38), T38 <= t, time(T38).
goal(deficate(C), T0, t, 25) :- goal(deficate(C), T0, T35, 23), goal(deficate(C), T36, T38, 24), time(T0), time(T35), time(T36), T35 <= T36, time(T38), T36 <= t.
goal(deficate(C), T39, t, 26) :- subtask(deficate(C), walk(O40_1), 40), goal(subtask(deficate(C), walk(O40_1), 40), T39), T39 <= T40, time(T39), subtask(deficate(C), wash(O41_1), 41), goal(subtask(deficate(C), wash(O41_1), 41), T40), T40 <= T41, time(T40), subtask(deficate(C), drink(O42_1), 42), goal(subtask(deficate(C), drink(O42_1), 42), T41), T41 <= t, time(T41).
goal(deficate(C), T0, t, 27) :- goal(deficate(C), T0, T38, 25), goal(deficate(C), T39, T41, 26), time(T0), time(T38), time(T39), T38 <= T39, time(T41), T39 <= t.
goal(deficate(C), T42, t, 28) :- subtask(deficate(C), walk(O43_1), 43), goal(subtask(deficate(C), walk(O43_1), 43), T42), T42 <= T43, time(T42), subtask(deficate(C), walk(O44_1), 44), goal(subtask(deficate(C), walk(O44_1), 44), T43), T43 <= T44, time(T43), subtask(deficate(C), drop(O45_1), 45), goal(subtask(deficate(C), drop(O45_1), 45), T44), T44 <= t, time(T44).
goal(deficate(C), T0, t, 29) :- goal(deficate(C), T0, T41, 27), goal(deficate(C), T42, T44, 28), time(T0), time(T41), time(T42), T41 <= T42, time(T44), T42 <= t.
goal(deficate(C), T45, t, 30) :- subtask(deficate(C), walk(O46_1), 46), goal(subtask(deficate(C), walk(O46_1), 46), T45), T45 <= T46, time(T45), subtask(deficate(C), walk(O47_1), 47), goal(subtask(deficate(C), walk(O47_1), 47), T46), T46 <= T47, time(T46), subtask(deficate(C), open(O48_1), 48), goal(subtask(deficate(C), open(O48_1), 48), T47), T47 <= t, time(T47).
goal(deficate(C), T0, t, 31) :- goal(deficate(C), T0, T44, 29), goal(deficate(C), T45, T47, 30), time(T0), time(T44), time(T45), T44 <= T45, time(T47), T45 <= t.
goal(deficate(C), T48, t, 32) :- subtask(deficate(C), walk(O49_1), 49), goal(subtask(deficate(C), walk(O49_1), 49), T48), T48 <= T49, time(T48), subtask(deficate(C), walk(O50_1), 50), goal(subtask(deficate(C), walk(O50_1), 50), T49), T49 <= T50, time(T49), subtask(deficate(C), walk(O51_1), 51), goal(subtask(deficate(C), walk(O51_1), 51), T50), T50 <= t, time(T50).
goal(deficate(C), T0, t, 33) :- goal(deficate(C), T0, T47, 31), goal(deficate(C), T48, T50, 32), time(T0), time(T47), time(T48), T47 <= T48, time(T50), T48 <= t.
goal(deficate(C), T51, t, 34) :- subtask(deficate(C), sit(O52_1), 52), goal(subtask(deficate(C), sit(O52_1), 52), T51), T51 <= T52, time(T51), subtask(deficate(C), eat(O53_1), 53), goal(subtask(deficate(C), eat(O53_1), 53), T52), T52 <= T53, time(T52), subtask(deficate(C), walk(O54_1), 54), goal(subtask(deficate(C), walk(O54_1), 54), T53), T53 <= t, time(T53).
goal(deficate(C), T0, t, 35) :- goal(deficate(C), T0, T50, 33), goal(deficate(C), T51, T53, 34), time(T0), time(T50), time(T51), T50 <= T51, time(T53), T51 <= t.
goal(deficate(C), T54, t, 36) :- subtask(deficate(C), walk(O55_1), 55), goal(subtask(deficate(C), walk(O55_1), 55), T54), T54 <= T55, time(T54), subtask(deficate(C), drop(O56_1), 56), goal(subtask(deficate(C), drop(O56_1), 56), T55), T55 <= T56, time(T55), subtask(deficate(C), walk(O57_1), 57), goal(subtask(deficate(C), walk(O57_1), 57), T56), T56 <= t, time(T56).
goal(deficate(C), T0, t, 37) :- goal(deficate(C), T0, T53, 35), goal(deficate(C), T54, T56, 36), time(T0), time(T53), time(T54), T53 <= T54, time(T56), T54 <= t.
goal(deficate(C), T57, t, 38) :- subtask(deficate(C), walk(O58_1), 58), goal(subtask(deficate(C), walk(O58_1), 58), T57), T57 <= T58, time(T57), subtask(deficate(C), wash(O59_1), 59), goal(subtask(deficate(C), wash(O59_1), 59), T58), T58 <= T59, time(T58), subtask(deficate(C), drink(O60_1), 60), goal(subtask(deficate(C), drink(O60_1), 60), T59), T59 <= t, time(T59).
goal(deficate(C), T0, t, 39) :- goal(deficate(C), T0, T56, 37), goal(deficate(C), T57, T59, 38), time(T0), time(T56), time(T57), T56 <= T57, time(T59), T57 <= t.
goal(deficate(C), T60, t, 40) :- subtask(deficate(C), walk(O61_1), 61), goal(subtask(deficate(C), walk(O61_1), 61), T60), T60 <= T61, time(T60), subtask(deficate(C), walk(O62_1), 62), goal(subtask(deficate(C), walk(O62_1), 62), T61), T61 <= T62, time(T61), subtask(deficate(C), open(O63_1), 63), goal(subtask(deficate(C), open(O63_1), 63), T62), T62 <= t, time(T62).
goal(deficate(C), T0, t, 41) :- goal(deficate(C), T0, T59, 39), goal(deficate(C), T60, T62, 40), time(T0), time(T59), time(T60), T59 <= T60, time(T62), T60 <= t.
goal(deficate(C), T63, t, 42) :- subtask(deficate(C), walk(O64_1), 64), goal(subtask(deficate(C), walk(O64_1), 64), T63), T63 <= T64, time(T63), subtask(deficate(C), walk(O65_1), 65), goal(subtask(deficate(C), walk(O65_1), 65), T64), T64 <= T65, time(T64), subtask(deficate(C), walk(O66_1), 66), goal(subtask(deficate(C), walk(O66_1), 66), T65), T65 <= t, time(T65).
goal(deficate(C), T0, t, 43) :- goal(deficate(C), T0, T62, 41), goal(deficate(C), T63, T65, 42), time(T0), time(T62), time(T63), T62 <= T63, time(T65), T63 <= t.
goal(deficate(C), T66, t, 44) :- subtask(deficate(C), sit(O67_1), 67), goal(subtask(deficate(C), sit(O67_1), 67), T66), T66 <= T67, time(T66), subtask(deficate(C), eat(O68_1), 68), goal(subtask(deficate(C), eat(O68_1), 68), T67), T67 <= T68, time(T67), subtask(deficate(C), walk(O69_1), 69), goal(subtask(deficate(C), walk(O69_1), 69), T68), T68 <= t, time(T68).
goal(deficate(C), T0, t, 45) :- goal(deficate(C), T0, T65, 43), goal(deficate(C), T66, T68, 44), time(T0), time(T65), time(T66), T65 <= T66, time(T68), T66 <= t.
goal(deficate(C), T69, t, 46) :- subtask(deficate(C), walk(O70_1), 70), goal(subtask(deficate(C), walk(O70_1), 70), T69), T69 <= T70, time(T69), subtask(deficate(C), walk(O71_1), 71), goal(subtask(deficate(C), walk(O71_1), 71), T70), T70 <= T71, time(T70), subtask(deficate(C), sit(O72_1), 72), goal(subtask(deficate(C), sit(O72_1), 72), T71), T71 <= t, time(T71).
goal(deficate(C), T0, t, 47) :- goal(deficate(C), T0, T68, 45), goal(deficate(C), T69, T71, 46), time(T0), time(T68), time(T69), T68 <= T69, time(T71), T69 <= t.
goal(deficate(C), T72, t, 48) :- subtask(deficate(C), eat(O73_1), 73), goal(subtask(deficate(C), eat(O73_1), 73), T72), T72 <= T73, time(T72), subtask(deficate(C), walk(O74_1), 74), goal(subtask(deficate(C), walk(O74_1), 74), T73), T73 <= T74, time(T73), subtask(deficate(C), walk(O75_1), 75), goal(subtask(deficate(C), walk(O75_1), 75), T74), T74 <= t, time(T74).
goal(deficate(C), T0, t, 49) :- goal(deficate(C), T0, T71, 47), goal(deficate(C), T72, T74, 48), time(T0), time(T71), time(T72), T71 <= T72, time(T74), T72 <= t.
goal(deficate(C), T75, t, 50) :- subtask(deficate(C), sit(O76_1), 76), goal(subtask(deficate(C), sit(O76_1), 76), T75), T75 <= T76, time(T75), subtask(deficate(C), eat(O77_1), 77), goal(subtask(deficate(C), eat(O77_1), 77), T76), T76 <= T77, time(T76), subtask(deficate(C), walk(O78_1), 78), goal(subtask(deficate(C), walk(O78_1), 78), T77), T77 <= t, time(T77).
goal(deficate(C), T0, t, 51) :- goal(deficate(C), T0, T74, 49), goal(deficate(C), T75, T77, 50), time(T0), time(T74), time(T75), T74 <= T75, time(T77), T75 <= t.
goal(deficate(C), T78, t, 52) :- subtask(deficate(C), sit(O79_1), 79), goal(subtask(deficate(C), sit(O79_1), 79), T78), T78 <= T79, time(T78), subtask(deficate(C), eat(O80_1), 80), goal(subtask(deficate(C), eat(O80_1), 80), T79), T79 <= T80, time(T79), subtask(deficate(C), walk(O81_1), 81), goal(subtask(deficate(C), walk(O81_1), 81), T80), T80 <= t, time(T80).
goal(deficate(C), T0, t, 53) :- goal(deficate(C), T0, T77, 51), goal(deficate(C), T78, T80, 52), time(T0), time(T77), time(T78), T77 <= T78, time(T80), T78 <= t.
goal(deficate(C), T81, t, 54) :- subtask(deficate(C), walk(O82_1), 82), goal(subtask(deficate(C), walk(O82_1), 82), T81), T81 <= T82, time(T81), subtask(deficate(C), drink(O83_1), 83), goal(subtask(deficate(C), drink(O83_1), 83), T82), T82 <= T83, time(T82), subtask(deficate(C), walk(O84_1), 84), goal(subtask(deficate(C), walk(O84_1), 84), T83), T83 <= t, time(T83).
goal(deficate(C), T0, t, 55) :- goal(deficate(C), T0, T80, 53), goal(deficate(C), T81, T83, 54), time(T0), time(T80), time(T81), T80 <= T81, time(T83), T81 <= t.
goal(deficate(C), T84, t, 56) :- subtask(deficate(C), walk(O85_1), 85), goal(subtask(deficate(C), walk(O85_1), 85), T84), T84 <= T85, time(T84), subtask(deficate(C), drop(O86_1), 86), goal(subtask(deficate(C), drop(O86_1), 86), T85), T85 <= T86, time(T85), subtask(deficate(C), walk(O87_1), 87), goal(subtask(deficate(C), walk(O87_1), 87), T86), T86 <= t, time(T86).
goal(deficate(C), T0, t, 57) :- goal(deficate(C), T0, T83, 55), goal(deficate(C), T84, T86, 56), time(T0), time(T83), time(T84), T83 <= T84, time(T86), T84 <= t.
goal(deficate(C), T87, t, 58) :- subtask(deficate(C), walk(O88_1), 88), goal(subtask(deficate(C), walk(O88_1), 88), T87), T87 <= T88, time(T87), subtask(deficate(C), sit(O89_1), 89), goal(subtask(deficate(C), sit(O89_1), 89), T88), T88 <= T89, time(T88), subtask(deficate(C), drop(O90_1), 90), goal(subtask(deficate(C), drop(O90_1), 90), T89), T89 <= t, time(T89).
goal(deficate(C), T0, t, 59) :- goal(deficate(C), T0, T86, 57), goal(deficate(C), T87, T89, 58), time(T0), time(T86), time(T87), T86 <= T87, time(T89), T87 <= t.
goal(deficate(C), T90, t, 60) :- subtask(deficate(C), wash(O91_1), 91), goal(subtask(deficate(C), wash(O91_1), 91), T90), T90 <= T91, time(T90), subtask(deficate(C), standup, 92), goal(subtask(deficate(C), standup, 92), T91), T91 <= T92, time(T91), subtask(deficate(C), walk(O93_1), 93), goal(subtask(deficate(C), walk(O93_1), 93), T92), T92 <= t, time(T92).
goal(deficate(C), T0, t, 61) :- goal(deficate(C), T0, T89, 59), goal(deficate(C), T90, T92, 60), time(T0), time(T89), time(T90), T89 <= T90, time(T92), T90 <= t.
goal(deficate(C), T93, t, 62) :- subtask(deficate(C), walk(O94_1), 94), goal(subtask(deficate(C), walk(O94_1), 94), T93), T93 <= T94, time(T93), subtask(deficate(C), wash(O95_1), 95), goal(subtask(deficate(C), wash(O95_1), 95), T94), T94 <= T95, time(T94), subtask(deficate(C), drink(O96_1), 96), goal(subtask(deficate(C), drink(O96_1), 96), T95), T95 <= t, time(T95).
goal(deficate(C), T0, t, 63) :- goal(deficate(C), T0, T92, 61), goal(deficate(C), T93, T95, 62), time(T0), time(T92), time(T93), T92 <= T93, time(T95), T93 <= t.
goal(deficate(C), T96, t, 64) :- subtask(deficate(C), walk(O97_1), 97), goal(subtask(deficate(C), walk(O97_1), 97), T96), T96 <= T97, time(T96), subtask(deficate(C), walk(O98_1), 98), goal(subtask(deficate(C), walk(O98_1), 98), T97), T97 <= T98, time(T97), subtask(deficate(C), drop(O99_1), 99), goal(subtask(deficate(C), drop(O99_1), 99), T98), T98 <= t, time(T98).
goal(deficate(C), T0, t, 65) :- goal(deficate(C), T0, T95, 63), goal(deficate(C), T96, T98, 64), time(T0), time(T95), time(T96), T95 <= T96, time(T98), T96 <= t.
goal(deficate(C), T99, t, 66) :- subtask(deficate(C), walk(O100_1), 100), goal(subtask(deficate(C), walk(O100_1), 100), T99), T99 <= T100, time(T99), subtask(deficate(C), walk(O101_1), 101), goal(subtask(deficate(C), walk(O101_1), 101), T100), T100 <= T101, time(T100), subtask(deficate(C), open(O102_1), 102), goal(subtask(deficate(C), open(O102_1), 102), T101), T101 <= t, time(T101).
goal(deficate(C), T0, t, 67) :- goal(deficate(C), T0, T98, 65), goal(deficate(C), T99, T101, 66), time(T0), time(T98), time(T99), T98 <= T99, time(T101), T99 <= t.
goal(deficate(C), T102, t, 68) :- subtask(deficate(C), walk(O103_1), 103), goal(subtask(deficate(C), walk(O103_1), 103), T102), T102 <= T103, time(T102), subtask(deficate(C), walk(O104_1), 104), goal(subtask(deficate(C), walk(O104_1), 104), T103), T103 <= T104, time(T103), subtask(deficate(C), walk(O105_1), 105), goal(subtask(deficate(C), walk(O105_1), 105), T104), T104 <= t, time(T104).
goal(deficate(C), T0, t, 69) :- goal(deficate(C), T0, T101, 67), goal(deficate(C), T102, T104, 68), time(T0), time(T101), time(T102), T101 <= T102, time(T104), T102 <= t.
goal(deficate(C), T105, t, 70) :- subtask(deficate(C), sit(O106_1), 106), goal(subtask(deficate(C), sit(O106_1), 106), T105), T105 <= T106, time(T105), subtask(deficate(C), eat(O107_1), 107), goal(subtask(deficate(C), eat(O107_1), 107), T106), T106 <= T107, time(T106), subtask(deficate(C), walk(O108_1), 108), goal(subtask(deficate(C), walk(O108_1), 108), T107), T107 <= t, time(T107).
goal(deficate(C), T0, t, 71) :- goal(deficate(C), T0, T104, 69), goal(deficate(C), T105, T107, 70), time(T0), time(T104), time(T105), T104 <= T105, time(T107), T105 <= t.
goal(deficate(C), T108, t, 72) :- subtask(deficate(C), walk(O109_1), 109), goal(subtask(deficate(C), walk(O109_1), 109), T108), T108 <= T109, time(T108), subtask(deficate(C), sit(O110_1), 110), goal(subtask(deficate(C), sit(O110_1), 110), T109), T109 <= T110, time(T109), subtask(deficate(C), drop(O111_1), 111), goal(subtask(deficate(C), drop(O111_1), 111), T110), T110 <= t, time(T110).
goal(deficate(C), T0, t, 73) :- goal(deficate(C), T0, T107, 71), goal(deficate(C), T108, T110, 72), time(T0), time(T107), time(T108), T107 <= T108, time(T110), T108 <= t.
goal(deficate(C), T111, t, 74) :- subtask(deficate(C), wash(O112_1), 112), goal(subtask(deficate(C), wash(O112_1), 112), T111), T111 <= T112, time(T111), subtask(deficate(C), standup, 113), goal(subtask(deficate(C), standup, 113), T112), T112 <= T113, time(T112), subtask(deficate(C), walk(O114_1), 114), goal(subtask(deficate(C), walk(O114_1), 114), T113), T113 <= t, time(T113).
goal(deficate(C), T0, t, 75) :- goal(deficate(C), T0, T110, 73), goal(deficate(C), T111, T113, 74), time(T0), time(T110), time(T111), T110 <= T111, time(T113), T111 <= t.
goal(deficate(C), T114, t, 76) :- subtask(deficate(C), walk(O115_1), 115), goal(subtask(deficate(C), walk(O115_1), 115), T114), T114 <= T115, time(T114), subtask(deficate(C), wash(O116_1), 116), goal(subtask(deficate(C), wash(O116_1), 116), T115), T115 <= T116, time(T115), subtask(deficate(C), drink(O117_1), 117), goal(subtask(deficate(C), drink(O117_1), 117), T116), T116 <= t, time(T116).
goal(deficate(C), T0, t, 77) :- goal(deficate(C), T0, T113, 75), goal(deficate(C), T114, T116, 76), time(T0), time(T113), time(T114), T113 <= T114, time(T116), T114 <= t.
goal(deficate(C), T117, t, 78) :- subtask(deficate(C), walk(O118_1), 118), goal(subtask(deficate(C), walk(O118_1), 118), T117), T117 <= T118, time(T117), subtask(deficate(C), walk(O119_1), 119), goal(subtask(deficate(C), walk(O119_1), 119), T118), T118 <= T119, time(T118), subtask(deficate(C), drop(O120_1), 120), goal(subtask(deficate(C), drop(O120_1), 120), T119), T119 <= t, time(T119).
goal(deficate(C), T0, t, 79) :- goal(deficate(C), T0, T116, 77), goal(deficate(C), T117, T119, 78), time(T0), time(T116), time(T117), T116 <= T117, time(T119), T117 <= t.
goal(deficate(C), T120, t, 80) :- subtask(deficate(C), walk(O121_1), 121), goal(subtask(deficate(C), walk(O121_1), 121), T120), T120 <= T121, time(T120), subtask(deficate(C), walk(O122_1), 122), goal(subtask(deficate(C), walk(O122_1), 122), T121), T121 <= T122, time(T121), subtask(deficate(C), open(O123_1), 123), goal(subtask(deficate(C), open(O123_1), 123), T122), T122 <= t, time(T122).
goal(deficate(C), T0, t, 81) :- goal(deficate(C), T0, T119, 79), goal(deficate(C), T120, T122, 80), time(T0), time(T119), time(T120), T119 <= T120, time(T122), T120 <= t.
goal(deficate(C), T123, t, 82) :- subtask(deficate(C), walk(O124_1), 124), goal(subtask(deficate(C), walk(O124_1), 124), T123), T123 <= T124, time(T123), subtask(deficate(C), walk(O125_1), 125), goal(subtask(deficate(C), walk(O125_1), 125), T124), T124 <= T125, time(T124), subtask(deficate(C), walk(O126_1), 126), goal(subtask(deficate(C), walk(O126_1), 126), T125), T125 <= t, time(T125).
goal(deficate(C), T0, t, 83) :- goal(deficate(C), T0, T122, 81), goal(deficate(C), T123, T125, 82), time(T0), time(T122), time(T123), T122 <= T123, time(T125), T123 <= t.
goal(deficate(C), T126, t, 84) :- subtask(deficate(C), sit(O127_1), 127), goal(subtask(deficate(C), sit(O127_1), 127), T126), T126 <= T127, time(T126), subtask(deficate(C), eat(O128_1), 128), goal(subtask(deficate(C), eat(O128_1), 128), T127), T127 <= T128, time(T127), subtask(deficate(C), walk(O129_1), 129), goal(subtask(deficate(C), walk(O129_1), 129), T128), T128 <= t, time(T128).
goal(deficate(C), T0, t, 85) :- goal(deficate(C), T0, T125, 83), goal(deficate(C), T126, T128, 84), time(T0), time(T125), time(T126), T125 <= T126, time(T128), T126 <= t.
goal(deficate(C), T129, t, 86) :- subtask(deficate(C), walk(O130_1), 130), goal(subtask(deficate(C), walk(O130_1), 130), T129), T129 <= T130, time(T129), subtask(deficate(C), drop(O131_1), 131), goal(subtask(deficate(C), drop(O131_1), 131), T130), T130 <= T131, time(T130), subtask(deficate(C), walk(O132_1), 132), goal(subtask(deficate(C), walk(O132_1), 132), T131), T131 <= t, time(T131).
goal(deficate(C), T0, t, 87) :- goal(deficate(C), T0, T128, 85), goal(deficate(C), T129, T131, 86), time(T0), time(T128), time(T129), T128 <= T129, time(T131), T129 <= t.
goal(deficate(C), T132, t, 88) :- subtask(deficate(C), walk(O133_1), 133), goal(subtask(deficate(C), walk(O133_1), 133), T132), T132 <= T133, time(T132), subtask(deficate(C), wash(O134_1), 134), goal(subtask(deficate(C), wash(O134_1), 134), T133), T133 <= T134, time(T133), subtask(deficate(C), drink(O135_1), 135), goal(subtask(deficate(C), drink(O135_1), 135), T134), T134 <= t, time(T134).
goal(deficate(C), T0, t, 89) :- goal(deficate(C), T0, T131, 87), goal(deficate(C), T132, T134, 88), time(T0), time(T131), time(T132), T131 <= T132, time(T134), T132 <= t.
goal(deficate(C), T135, t, 90) :- subtask(deficate(C), walk(O136_1), 136), goal(subtask(deficate(C), walk(O136_1), 136), T135), T135 <= T136, time(T135), subtask(deficate(C), walk(O137_1), 137), goal(subtask(deficate(C), walk(O137_1), 137), T136), T136 <= T137, time(T136), subtask(deficate(C), open(O138_1), 138), goal(subtask(deficate(C), open(O138_1), 138), T137), T137 <= t, time(T137).
goal(deficate(C), T0, t, 91) :- goal(deficate(C), T0, T134, 89), goal(deficate(C), T135, T137, 90), time(T0), time(T134), time(T135), T134 <= T135, time(T137), T135 <= t.
goal(deficate(C), T138, t, 92) :- subtask(deficate(C), walk(O139_1), 139), goal(subtask(deficate(C), walk(O139_1), 139), T138), T138 <= T139, time(T138), subtask(deficate(C), walk(O140_1), 140), goal(subtask(deficate(C), walk(O140_1), 140), T139), T139 <= T140, time(T139), subtask(deficate(C), walk(O141_1), 141), goal(subtask(deficate(C), walk(O141_1), 141), T140), T140 <= t, time(T140).
goal(deficate(C), T0, t, 93) :- goal(deficate(C), T0, T137, 91), goal(deficate(C), T138, T140, 92), time(T0), time(T137), time(T138), T137 <= T138, time(T140), T138 <= t.
goal(deficate(C), T141, t, 94) :- subtask(deficate(C), sit(O142_1), 142), goal(subtask(deficate(C), sit(O142_1), 142), T141), T141 <= T142, time(T141), subtask(deficate(C), eat(O143_1), 143), goal(subtask(deficate(C), eat(O143_1), 143), T142), T142 <= T143, time(T142), subtask(deficate(C), walk(O144_1), 144), goal(subtask(deficate(C), walk(O144_1), 144), T143), T143 <= t, time(T143).
goal(deficate(C), T0, t, 95) :- goal(deficate(C), T0, T140, 93), goal(deficate(C), T141, T143, 94), time(T0), time(T140), time(T141), T140 <= T141, time(T143), T141 <= t.
goal(deficate(C), T144, t, 96) :- subtask(deficate(C), walk(O145_1), 145), goal(subtask(deficate(C), walk(O145_1), 145), T144), T144 <= T145, time(T144), subtask(deficate(C), walk(O146_1), 146), goal(subtask(deficate(C), walk(O146_1), 146), T145), T145 <= T146, time(T145), subtask(deficate(C), sit(O147_1), 147), goal(subtask(deficate(C), sit(O147_1), 147), T146), T146 <= t, time(T146).
goal(deficate(C), T0, t, 97) :- goal(deficate(C), T0, T143, 95), goal(deficate(C), T144, T146, 96), time(T0), time(T143), time(T144), T143 <= T144, time(T146), T144 <= t.
goal(deficate(C), T147, t, 98) :- subtask(deficate(C), eat(O148_1), 148), goal(subtask(deficate(C), eat(O148_1), 148), T147), T147 <= T148, time(T147), subtask(deficate(C), walk(O149_1), 149), goal(subtask(deficate(C), walk(O149_1), 149), T148), T148 <= T149, time(T148), subtask(deficate(C), walk(O150_1), 150), goal(subtask(deficate(C), walk(O150_1), 150), T149), T149 <= t, time(T149).
goal(deficate(C), T0, t, 99) :- goal(deficate(C), T0, T146, 97), goal(deficate(C), T147, T149, 98), time(T0), time(T146), time(T147), T146 <= T147, time(T149), T147 <= t.
goal(deficate(C), T150, t, 100) :- subtask(deficate(C), sit(O151_1), 151), goal(subtask(deficate(C), sit(O151_1), 151), T150), T150 <= T151, time(T150), subtask(deficate(C), eat(O152_1), 152), goal(subtask(deficate(C), eat(O152_1), 152), T151), T151 <= T152, time(T151), subtask(deficate(C), walk(O153_1), 153), goal(subtask(deficate(C), walk(O153_1), 153), T152), T152 <= t, time(T152).
goal(deficate(C), T0, t, 101) :- goal(deficate(C), T0, T149, 99), goal(deficate(C), T150, T152, 100), time(T0), time(T149), time(T150), T149 <= T150, time(T152), T150 <= t.
goal(deficate(C), T153, t, 102) :- subtask(deficate(C), sit(O154_1), 154), goal(subtask(deficate(C), sit(O154_1), 154), T153), T153 <= T154, time(T153), subtask(deficate(C), eat(O155_1), 155), goal(subtask(deficate(C), eat(O155_1), 155), T154), T154 <= T155, time(T154), subtask(deficate(C), walk(O156_1), 156), goal(subtask(deficate(C), walk(O156_1), 156), T155), T155 <= t, time(T155).
goal(deficate(C), T0, t, 103) :- goal(deficate(C), T0, T152, 101), goal(deficate(C), T153, T155, 102), time(T0), time(T152), time(T153), T152 <= T153, time(T155), T153 <= t.
goal(deficate(C), T156, t, 104) :- subtask(deficate(C), walk(O157_1), 157), goal(subtask(deficate(C), walk(O157_1), 157), T156), T156 <= T157, time(T156), subtask(deficate(C), drink(O158_1), 158), goal(subtask(deficate(C), drink(O158_1), 158), T157), T157 <= T158, time(T157), subtask(deficate(C), walk(O159_1), 159), goal(subtask(deficate(C), walk(O159_1), 159), T158), T158 <= t, time(T158).
goal(deficate(C), T0, t, 105) :- goal(deficate(C), T0, T155, 103), goal(deficate(C), T156, T158, 104), time(T0), time(T155), time(T156), T155 <= T156, time(T158), T156 <= t.
goal(deficate(C), T159, t, 106) :- subtask(deficate(C), walk(O160_1), 160), goal(subtask(deficate(C), walk(O160_1), 160), T159), T159 <= T160, time(T159), subtask(deficate(C), drop(O161_1), 161), goal(subtask(deficate(C), drop(O161_1), 161), T160), T160 <= T161, time(T160), subtask(deficate(C), walk(O162_1), 162), goal(subtask(deficate(C), walk(O162_1), 162), T161), T161 <= t, time(T161).
goal(deficate(C), T0, t, 107) :- goal(deficate(C), T0, T158, 105), goal(deficate(C), T159, T161, 106), time(T0), time(T158), time(T159), T158 <= T159, time(T161), T159 <= t.
goal(deficate(C), T162, t, 108) :- subtask(deficate(C), walk(O163_1), 163), goal(subtask(deficate(C), walk(O163_1), 163), T162), T162 <= T163, time(T162), subtask(deficate(C), sit(O164_1), 164), goal(subtask(deficate(C), sit(O164_1), 164), T163), T163 <= T164, time(T163), subtask(deficate(C), drop(O165_1), 165), goal(subtask(deficate(C), drop(O165_1), 165), T164), T164 <= t, time(T164).
goal(deficate(C), T0, t, 109) :- goal(deficate(C), T0, T161, 107), goal(deficate(C), T162, T164, 108), time(T0), time(T161), time(T162), T161 <= T162, time(T164), T162 <= t.
goal(deficate(C), T165, t, 110) :- subtask(deficate(C), wash(O166_1), 166), goal(subtask(deficate(C), wash(O166_1), 166), T165), T165 <= T166, time(T165), subtask(deficate(C), standup, 167), goal(subtask(deficate(C), standup, 167), T166), T166 <= T167, time(T166), subtask(deficate(C), walk(O168_1), 168), goal(subtask(deficate(C), walk(O168_1), 168), T167), T167 <= t, time(T167).
goal(deficate(C), T0, t, 111) :- goal(deficate(C), T0, T164, 109), goal(deficate(C), T165, T167, 110), time(T0), time(T164), time(T165), T164 <= T165, time(T167), T165 <= t.
goal(deficate(C), T168, t, 112) :- subtask(deficate(C), walk(O169_1), 169), goal(subtask(deficate(C), walk(O169_1), 169), T168), T168 <= T169, time(T168), subtask(deficate(C), wash(O170_1), 170), goal(subtask(deficate(C), wash(O170_1), 170), T169), T169 <= T170, time(T169), subtask(deficate(C), drink(O171_1), 171), goal(subtask(deficate(C), drink(O171_1), 171), T170), T170 <= t, time(T170).
goal(deficate(C), T0, t, 113) :- goal(deficate(C), T0, T167, 111), goal(deficate(C), T168, T170, 112), time(T0), time(T167), time(T168), T167 <= T168, time(T170), T168 <= t.
goal(deficate(C), T171, t, 114) :- subtask(deficate(C), walk(O172_1), 172), goal(subtask(deficate(C), walk(O172_1), 172), T171), T171 <= T172, time(T171), subtask(deficate(C), walk(O173_1), 173), goal(subtask(deficate(C), walk(O173_1), 173), T172), T172 <= T173, time(T172), subtask(deficate(C), drop(O174_1), 174), goal(subtask(deficate(C), drop(O174_1), 174), T173), T173 <= t, time(T173).
goal(deficate(C), T0, t, 115) :- goal(deficate(C), T0, T170, 113), goal(deficate(C), T171, T173, 114), time(T0), time(T170), time(T171), T170 <= T171, time(T173), T171 <= t.
goal(deficate(C), T174, t, 116) :- subtask(deficate(C), walk(O175_1), 175), goal(subtask(deficate(C), walk(O175_1), 175), T174), T174 <= T175, time(T174), subtask(deficate(C), walk(O176_1), 176), goal(subtask(deficate(C), walk(O176_1), 176), T175), T175 <= T176, time(T175), subtask(deficate(C), open(O177_1), 177), goal(subtask(deficate(C), open(O177_1), 177), T176), T176 <= t, time(T176).
goal(deficate(C), T0, t, 117) :- goal(deficate(C), T0, T173, 115), goal(deficate(C), T174, T176, 116), time(T0), time(T173), time(T174), T173 <= T174, time(T176), T174 <= t.
goal(deficate(C), T177, t, 118) :- subtask(deficate(C), walk(O178_1), 178), goal(subtask(deficate(C), walk(O178_1), 178), T177), T177 <= T178, time(T177), subtask(deficate(C), walk(O179_1), 179), goal(subtask(deficate(C), walk(O179_1), 179), T178), T178 <= T179, time(T178), subtask(deficate(C), walk(O180_1), 180), goal(subtask(deficate(C), walk(O180_1), 180), T179), T179 <= t, time(T179).
goal(deficate(C), T0, t, 119) :- goal(deficate(C), T0, T176, 117), goal(deficate(C), T177, T179, 118), time(T0), time(T176), time(T177), T176 <= T177, time(T179), T177 <= t.
goal(deficate(C), T180, t, 120) :- subtask(deficate(C), sit(O181_1), 181), goal(subtask(deficate(C), sit(O181_1), 181), T180), T180 <= T181, time(T180), subtask(deficate(C), eat(O182_1), 182), goal(subtask(deficate(C), eat(O182_1), 182), T181), T181 <= T182, time(T181), subtask(deficate(C), walk(O183_1), 183), goal(subtask(deficate(C), walk(O183_1), 183), T182), T182 <= t, time(T182).
goal(deficate(C), T0, t, 121) :- goal(deficate(C), T0, T179, 119), goal(deficate(C), T180, T182, 120), time(T0), time(T179), time(T180), T179 <= T180, time(T182), T180 <= t.
goal(deficate(C), T183, t, 122) :- subtask(deficate(C), walk(O184_1), 184), goal(subtask(deficate(C), walk(O184_1), 184), T183), T183 <= T184, time(T183), subtask(deficate(C), sit(O185_1), 185), goal(subtask(deficate(C), sit(O185_1), 185), T184), T184 <= T185, time(T184), subtask(deficate(C), drop(O186_1), 186), goal(subtask(deficate(C), drop(O186_1), 186), T185), T185 <= t, time(T185).
goal(deficate(C), T0, t, 123) :- goal(deficate(C), T0, T182, 121), goal(deficate(C), T183, T185, 122), time(T0), time(T182), time(T183), T182 <= T183, time(T185), T183 <= t.
goal(deficate(C), T186, t, 124) :- subtask(deficate(C), wash(O187_1), 187), goal(subtask(deficate(C), wash(O187_1), 187), T186), T186 <= T187, time(T186), subtask(deficate(C), standup, 188), goal(subtask(deficate(C), standup, 188), T187), T187 <= T188, time(T187), subtask(deficate(C), walk(O189_1), 189), goal(subtask(deficate(C), walk(O189_1), 189), T188), T188 <= t, time(T188).
goal(deficate(C), T0, t, 125) :- goal(deficate(C), T0, T185, 123), goal(deficate(C), T186, T188, 124), time(T0), time(T185), time(T186), T185 <= T186, time(T188), T186 <= t.
goal(deficate(C), T189, t, 126) :- subtask(deficate(C), walk(O190_1), 190), goal(subtask(deficate(C), walk(O190_1), 190), T189), T189 <= T190, time(T189), subtask(deficate(C), wash(O191_1), 191), goal(subtask(deficate(C), wash(O191_1), 191), T190), T190 <= T191, time(T190), subtask(deficate(C), drink(O192_1), 192), goal(subtask(deficate(C), drink(O192_1), 192), T191), T191 <= t, time(T191).
goal(deficate(C), T0, t, 127) :- goal(deficate(C), T0, T188, 125), goal(deficate(C), T189, T191, 126), time(T0), time(T188), time(T189), T188 <= T189, time(T191), T189 <= t.
goal(deficate(C), T192, t, 128) :- subtask(deficate(C), walk(O193_1), 193), goal(subtask(deficate(C), walk(O193_1), 193), T192), T192 <= T193, time(T192), subtask(deficate(C), walk(O194_1), 194), goal(subtask(deficate(C), walk(O194_1), 194), T193), T193 <= T194, time(T193), subtask(deficate(C), drop(O195_1), 195), goal(subtask(deficate(C), drop(O195_1), 195), T194), T194 <= t, time(T194).
goal(deficate(C), T0, t, 129) :- goal(deficate(C), T0, T191, 127), goal(deficate(C), T192, T194, 128), time(T0), time(T191), time(T192), T191 <= T192, time(T194), T192 <= t.
goal(deficate(C), T195, t, 130) :- subtask(deficate(C), walk(O196_1), 196), goal(subtask(deficate(C), walk(O196_1), 196), T195), T195 <= T196, time(T195), subtask(deficate(C), walk(O197_1), 197), goal(subtask(deficate(C), walk(O197_1), 197), T196), T196 <= T197, time(T196), subtask(deficate(C), open(O198_1), 198), goal(subtask(deficate(C), open(O198_1), 198), T197), T197 <= t, time(T197).
goal(deficate(C), T0, t, 131) :- goal(deficate(C), T0, T194, 129), goal(deficate(C), T195, T197, 130), time(T0), time(T194), time(T195), T194 <= T195, time(T197), T195 <= t.
goal(deficate(C), T198, t, 132) :- subtask(deficate(C), walk(O199_1), 199), goal(subtask(deficate(C), walk(O199_1), 199), T198), T198 <= T199, time(T198), subtask(deficate(C), walk(O200_1), 200), goal(subtask(deficate(C), walk(O200_1), 200), T199), T199 <= T200, time(T199), subtask(deficate(C), walk(O201_1), 201), goal(subtask(deficate(C), walk(O201_1), 201), T200), T200 <= t, time(T200).
goal(deficate(C), T0, t, 133) :- goal(deficate(C), T0, T197, 131), goal(deficate(C), T198, T200, 132), time(T0), time(T197), time(T198), T197 <= T198, time(T200), T198 <= t.
goal(deficate(C), T201, t, 134) :- subtask(deficate(C), sit(O202_1), 202), goal(subtask(deficate(C), sit(O202_1), 202), T201), T201 <= T202, time(T201), subtask(deficate(C), eat(O203_1), 203), goal(subtask(deficate(C), eat(O203_1), 203), T202), T202 <= T203, time(T202), subtask(deficate(C), walk(O204_1), 204), goal(subtask(deficate(C), walk(O204_1), 204), T203), T203 <= t, time(T203).
goal(deficate(C), T0, t, 135) :- goal(deficate(C), T0, T200, 133), goal(deficate(C), T201, T203, 134), time(T0), time(T200), time(T201), T200 <= T201, time(T203), T201 <= t.
goal(deficate(C), T204, t, 136) :- subtask(deficate(C), walk(O205_1), 205), goal(subtask(deficate(C), walk(O205_1), 205), T204), T204 <= T205, time(T204), subtask(deficate(C), drop(O206_1), 206), goal(subtask(deficate(C), drop(O206_1), 206), T205), T205 <= T206, time(T205), subtask(deficate(C), walk(O207_1), 207), goal(subtask(deficate(C), walk(O207_1), 207), T206), T206 <= t, time(T206).
goal(deficate(C), T0, t, 137) :- goal(deficate(C), T0, T203, 135), goal(deficate(C), T204, T206, 136), time(T0), time(T203), time(T204), T203 <= T204, time(T206), T204 <= t.
goal(deficate(C), T207, t, 138) :- subtask(deficate(C), walk(O208_1), 208), goal(subtask(deficate(C), walk(O208_1), 208), T207), T207 <= T208, time(T207), subtask(deficate(C), wash(O209_1), 209), goal(subtask(deficate(C), wash(O209_1), 209), T208), T208 <= T209, time(T208), subtask(deficate(C), drink(O210_1), 210), goal(subtask(deficate(C), drink(O210_1), 210), T209), T209 <= t, time(T209).
goal(deficate(C), T0, t, 139) :- goal(deficate(C), T0, T206, 137), goal(deficate(C), T207, T209, 138), time(T0), time(T206), time(T207), T206 <= T207, time(T209), T207 <= t.
goal(deficate(C), T210, t, 140) :- subtask(deficate(C), walk(O211_1), 211), goal(subtask(deficate(C), walk(O211_1), 211), T210), T210 <= T211, time(T210), subtask(deficate(C), walk(O212_1), 212), goal(subtask(deficate(C), walk(O212_1), 212), T211), T211 <= T212, time(T211), subtask(deficate(C), open(O213_1), 213), goal(subtask(deficate(C), open(O213_1), 213), T212), T212 <= t, time(T212).
goal(deficate(C), T0, t, 141) :- goal(deficate(C), T0, T209, 139), goal(deficate(C), T210, T212, 140), time(T0), time(T209), time(T210), T209 <= T210, time(T212), T210 <= t.
goal(deficate(C), T213, t, 142) :- subtask(deficate(C), walk(O214_1), 214), goal(subtask(deficate(C), walk(O214_1), 214), T213), T213 <= T214, time(T213), subtask(deficate(C), walk(O215_1), 215), goal(subtask(deficate(C), walk(O215_1), 215), T214), T214 <= T215, time(T214), subtask(deficate(C), walk(O216_1), 216), goal(subtask(deficate(C), walk(O216_1), 216), T215), T215 <= t, time(T215).
goal(deficate(C), T0, t, 143) :- goal(deficate(C), T0, T212, 141), goal(deficate(C), T213, T215, 142), time(T0), time(T212), time(T213), T212 <= T213, time(T215), T213 <= t.
goal(deficate(C), T216, t, 144) :- subtask(deficate(C), sit(O217_1), 217), goal(subtask(deficate(C), sit(O217_1), 217), T216), T216 <= T217, time(T216), subtask(deficate(C), eat(O218_1), 218), goal(subtask(deficate(C), eat(O218_1), 218), T217), T217 <= T218, time(T217), subtask(deficate(C), walk(O219_1), 219), goal(subtask(deficate(C), walk(O219_1), 219), T218), T218 <= t, time(T218).
goal(deficate(C), T0, t, 145) :- goal(deficate(C), T0, T215, 143), goal(deficate(C), T216, T218, 144), time(T0), time(T215), time(T216), T215 <= T216, time(T218), T216 <= t.
goal(deficate(C), T219, t, 146) :- subtask(deficate(C), walk(O220_1), 220), goal(subtask(deficate(C), walk(O220_1), 220), T219), T219 <= T220, time(T219), subtask(deficate(C), walk(O221_1), 221), goal(subtask(deficate(C), walk(O221_1), 221), T220), T220 <= T221, time(T220), subtask(deficate(C), sit(O222_1), 222), goal(subtask(deficate(C), sit(O222_1), 222), T221), T221 <= t, time(T221).
goal(deficate(C), T0, t, 147) :- goal(deficate(C), T0, T218, 145), goal(deficate(C), T219, T221, 146), time(T0), time(T218), time(T219), T218 <= T219, time(T221), T219 <= t.
goal(deficate(C), T222, t, 148) :- subtask(deficate(C), eat(O223_1), 223), goal(subtask(deficate(C), eat(O223_1), 223), T222), T222 <= T223, time(T222), subtask(deficate(C), walk(O224_1), 224), goal(subtask(deficate(C), walk(O224_1), 224), T223), T223 <= T224, time(T223), subtask(deficate(C), walk(O225_1), 225), goal(subtask(deficate(C), walk(O225_1), 225), T224), T224 <= t, time(T224).
goal(deficate(C), T0, t, 149) :- goal(deficate(C), T0, T221, 147), goal(deficate(C), T222, T224, 148), time(T0), time(T221), time(T222), T221 <= T222, time(T224), T222 <= t.
goal(deficate(C), T225, t, 150) :- subtask(deficate(C), sit(O226_1), 226), goal(subtask(deficate(C), sit(O226_1), 226), T225), T225 <= T226, time(T225), subtask(deficate(C), eat(O227_1), 227), goal(subtask(deficate(C), eat(O227_1), 227), T226), T226 <= T227, time(T226), subtask(deficate(C), walk(O228_1), 228), goal(subtask(deficate(C), walk(O228_1), 228), T227), T227 <= t, time(T227).
goal(deficate(C), T0, t, 151) :- goal(deficate(C), T0, T224, 149), goal(deficate(C), T225, T227, 150), time(T0), time(T224), time(T225), T224 <= T225, time(T227), T225 <= t.
goal(deficate(C), T228, t, 152) :- subtask(deficate(C), sit(O229_1), 229), goal(subtask(deficate(C), sit(O229_1), 229), T228), T228 <= T229, time(T228), subtask(deficate(C), eat(O230_1), 230), goal(subtask(deficate(C), eat(O230_1), 230), T229), T229 <= T230, time(T229), subtask(deficate(C), walk(O231_1), 231), goal(subtask(deficate(C), walk(O231_1), 231), T230), T230 <= t, time(T230).
goal(deficate(C), T0, t, 153) :- goal(deficate(C), T0, T227, 151), goal(deficate(C), T228, T230, 152), time(T0), time(T227), time(T228), T227 <= T228, time(T230), T228 <= t.
goal(deficate(C), T231, t, 154) :- subtask(deficate(C), walk(O232_1), 232), goal(subtask(deficate(C), walk(O232_1), 232), T231), T231 <= T232, time(T231), subtask(deficate(C), drink(O233_1), 233), goal(subtask(deficate(C), drink(O233_1), 233), T232), T232 <= T233, time(T232), subtask(deficate(C), walk(O234_1), 234), goal(subtask(deficate(C), walk(O234_1), 234), T233), T233 <= t, time(T233).
goal(deficate(C), T0, t, 155) :- goal(deficate(C), T0, T230, 153), goal(deficate(C), T231, T233, 154), time(T0), time(T230), time(T231), T230 <= T231, time(T233), T231 <= t.
goal(deficate(C), T234, t, 156) :- subtask(deficate(C), walk(O235_1), 235), goal(subtask(deficate(C), walk(O235_1), 235), T234), T234 <= T235, time(T234), subtask(deficate(C), drop(O236_1), 236), goal(subtask(deficate(C), drop(O236_1), 236), T235), T235 <= T236, time(T235), subtask(deficate(C), walk(O237_1), 237), goal(subtask(deficate(C), walk(O237_1), 237), T236), T236 <= t, time(T236).
goal(deficate(C), T0, t, 157) :- goal(deficate(C), T0, T233, 155), goal(deficate(C), T234, T236, 156), time(T0), time(T233), time(T234), T233 <= T234, time(T236), T234 <= t.
goal(deficate(C), T237, t, 158) :- subtask(deficate(C), walk(O238_1), 238), goal(subtask(deficate(C), walk(O238_1), 238), T237), T237 <= T238, time(T237), subtask(deficate(C), sit(O239_1), 239), goal(subtask(deficate(C), sit(O239_1), 239), T238), T238 <= T239, time(T238), subtask(deficate(C), drop(O240_1), 240), goal(subtask(deficate(C), drop(O240_1), 240), T239), T239 <= t, time(T239).
goal(deficate(C), T0, t, 159) :- goal(deficate(C), T0, T236, 157), goal(deficate(C), T237, T239, 158), time(T0), time(T236), time(T237), T236 <= T237, time(T239), T237 <= t.
goal(deficate(C), T240, t, 160) :- subtask(deficate(C), wash(O241_1), 241), goal(subtask(deficate(C), wash(O241_1), 241), T240), T240 <= T241, time(T240), subtask(deficate(C), standup, 242), goal(subtask(deficate(C), standup, 242), T241), T241 <= T242, time(T241), subtask(deficate(C), walk(O243_1), 243), goal(subtask(deficate(C), walk(O243_1), 243), T242), T242 <= t, time(T242).
goal(deficate(C), T0, t, 161) :- goal(deficate(C), T0, T239, 159), goal(deficate(C), T240, T242, 160), time(T0), time(T239), time(T240), T239 <= T240, time(T242), T240 <= t.
goal(deficate(C), T243, t, 162) :- subtask(deficate(C), walk(O244_1), 244), goal(subtask(deficate(C), walk(O244_1), 244), T243), T243 <= T244, time(T243), subtask(deficate(C), wash(O245_1), 245), goal(subtask(deficate(C), wash(O245_1), 245), T244), T244 <= T245, time(T244), subtask(deficate(C), drink(O246_1), 246), goal(subtask(deficate(C), drink(O246_1), 246), T245), T245 <= t, time(T245).
goal(deficate(C), T0, t, 163) :- goal(deficate(C), T0, T242, 161), goal(deficate(C), T243, T245, 162), time(T0), time(T242), time(T243), T242 <= T243, time(T245), T243 <= t.
goal(deficate(C), T246, t, 164) :- subtask(deficate(C), walk(O247_1), 247), goal(subtask(deficate(C), walk(O247_1), 247), T246), T246 <= T247, time(T246), subtask(deficate(C), walk(O248_1), 248), goal(subtask(deficate(C), walk(O248_1), 248), T247), T247 <= T248, time(T247), subtask(deficate(C), drop(O249_1), 249), goal(subtask(deficate(C), drop(O249_1), 249), T248), T248 <= t, time(T248).
goal(deficate(C), T0, t, 165) :- goal(deficate(C), T0, T245, 163), goal(deficate(C), T246, T248, 164), time(T0), time(T245), time(T246), T245 <= T246, time(T248), T246 <= t.
goal(deficate(C), T249, t, 166) :- subtask(deficate(C), walk(O250_1), 250), goal(subtask(deficate(C), walk(O250_1), 250), T249), T249 <= T250, time(T249), subtask(deficate(C), walk(O251_1), 251), goal(subtask(deficate(C), walk(O251_1), 251), T250), T250 <= T251, time(T250), subtask(deficate(C), open(O252_1), 252), goal(subtask(deficate(C), open(O252_1), 252), T251), T251 <= t, time(T251).
goal(deficate(C), T0, t, 167) :- goal(deficate(C), T0, T248, 165), goal(deficate(C), T249, T251, 166), time(T0), time(T248), time(T249), T248 <= T249, time(T251), T249 <= t.
goal(deficate(C), T252, t, 168) :- subtask(deficate(C), walk(O253_1), 253), goal(subtask(deficate(C), walk(O253_1), 253), T252), T252 <= T253, time(T252), subtask(deficate(C), walk(O254_1), 254), goal(subtask(deficate(C), walk(O254_1), 254), T253), T253 <= T254, time(T253), subtask(deficate(C), walk(O255_1), 255), goal(subtask(deficate(C), walk(O255_1), 255), T254), T254 <= t, time(T254).
goal(deficate(C), T0, t, 169) :- goal(deficate(C), T0, T251, 167), goal(deficate(C), T252, T254, 168), time(T0), time(T251), time(T252), T251 <= T252, time(T254), T252 <= t.
goal(deficate(C), T255, t, 170) :- subtask(deficate(C), sit(O256_1), 256), goal(subtask(deficate(C), sit(O256_1), 256), T255), T255 <= T256, time(T255), subtask(deficate(C), eat(O257_1), 257), goal(subtask(deficate(C), eat(O257_1), 257), T256), T256 <= T257, time(T256), subtask(deficate(C), walk(O258_1), 258), goal(subtask(deficate(C), walk(O258_1), 258), T257), T257 <= t, time(T257).
goal(deficate(C), T0, t, 171) :- goal(deficate(C), T0, T254, 169), goal(deficate(C), T255, T257, 170), time(T0), time(T254), time(T255), T254 <= T255, time(T257), T255 <= t.
goal(deficate(C), T258, t, 172) :- subtask(deficate(C), walk(O259_1), 259), goal(subtask(deficate(C), walk(O259_1), 259), T258), T258 <= T259, time(T258), subtask(deficate(C), sit(O260_1), 260), goal(subtask(deficate(C), sit(O260_1), 260), T259), T259 <= T260, time(T259), subtask(deficate(C), drop(O261_1), 261), goal(subtask(deficate(C), drop(O261_1), 261), T260), T260 <= t, time(T260).
goal(deficate(C), T0, t, 173) :- goal(deficate(C), T0, T257, 171), goal(deficate(C), T258, T260, 172), time(T0), time(T257), time(T258), T257 <= T258, time(T260), T258 <= t.
goal(deficate(C), T261, t, 174) :- subtask(deficate(C), wash(O262_1), 262), goal(subtask(deficate(C), wash(O262_1), 262), T261), T261 <= t, time(T261).
goal(deficate(C), t) :- goal(deficate(C), T0, T260, 173), goal(deficate(C), T261, t, 174), time(T0), time(T260), time(T261), T260 <= T261.

goal(subtask(deficate(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 1).
goal(subtask(deficate(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(deficate(C), grab(O), 2).
goal(subtask(deficate(C), find(O), 3), t) :- goal(C, find(O), t), subtask(deficate(C), find(O), 3).
goal(subtask(deficate(C), open(O), 4), t) :- goal(C, open(O), t), subtask(deficate(C), open(O), 4).
goal(subtask(deficate(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(deficate(C), putin(O1, O2), 5).
goal(subtask(deficate(C), close(O), 6), t) :- goal(C, close(O), t), subtask(deficate(C), close(O), 6).
goal(subtask(deficate(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 7).
goal(subtask(deficate(C), walk(O), 8), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 8).
goal(subtask(deficate(C), walk(O), 9), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 9).
goal(subtask(deficate(C), walk(O), 10), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 10).
goal(subtask(deficate(C), switchon(O), 11), t) :- goal(C, switchon(O), t), subtask(deficate(C), switchon(O), 11).
goal(subtask(deficate(C), walk(O), 12), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 12).
goal(subtask(deficate(C), walk(O), 13), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 13).
goal(subtask(deficate(C), sit(O), 14), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 14).
goal(subtask(deficate(C), drop(O), 15), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 15).
goal(subtask(deficate(C), wash(O), 16), t) :- goal(C, wash(O), t), subtask(deficate(C), wash(O), 16).
goal(subtask(deficate(C), standup, 17), t) :- goal(C, standup, t), subtask(deficate(C), standup, 17).
goal(subtask(deficate(C), walk(O), 18), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 18).
goal(subtask(deficate(C), walk(O), 19), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 19).
goal(subtask(deficate(C), wash(O), 20), t) :- goal(C, wash(O), t), subtask(deficate(C), wash(O), 20).
goal(subtask(deficate(C), drink(O), 21), t) :- goal(C, drink(O), t), subtask(deficate(C), drink(O), 21).
goal(subtask(deficate(C), walk(O), 22), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 22).
goal(subtask(deficate(C), walk(O), 23), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 23).
goal(subtask(deficate(C), drop(O), 24), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 24).
goal(subtask(deficate(C), walk(O), 25), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 25).
goal(subtask(deficate(C), walk(O), 26), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 26).
goal(subtask(deficate(C), open(O), 27), t) :- goal(C, open(O), t), subtask(deficate(C), open(O), 27).
goal(subtask(deficate(C), walk(O), 28), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 28).
goal(subtask(deficate(C), walk(O), 29), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 29).
goal(subtask(deficate(C), walk(O), 30), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 30).
goal(subtask(deficate(C), sit(O), 31), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 31).
goal(subtask(deficate(C), eat(O), 32), t) :- goal(C, eat(O), t), subtask(deficate(C), eat(O), 32).
goal(subtask(deficate(C), walk(O), 33), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 33).
goal(subtask(deficate(C), walk(O), 34), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 34).
goal(subtask(deficate(C), sit(O), 35), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 35).
goal(subtask(deficate(C), drop(O), 36), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 36).
goal(subtask(deficate(C), wash(O), 37), t) :- goal(C, wash(O), t), subtask(deficate(C), wash(O), 37).
goal(subtask(deficate(C), standup, 38), t) :- goal(C, standup, t), subtask(deficate(C), standup, 38).
goal(subtask(deficate(C), walk(O), 39), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 39).
goal(subtask(deficate(C), walk(O), 40), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 40).
goal(subtask(deficate(C), wash(O), 41), t) :- goal(C, wash(O), t), subtask(deficate(C), wash(O), 41).
goal(subtask(deficate(C), drink(O), 42), t) :- goal(C, drink(O), t), subtask(deficate(C), drink(O), 42).
goal(subtask(deficate(C), walk(O), 43), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 43).
goal(subtask(deficate(C), walk(O), 44), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 44).
goal(subtask(deficate(C), drop(O), 45), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 45).
goal(subtask(deficate(C), walk(O), 46), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 46).
goal(subtask(deficate(C), walk(O), 47), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 47).
goal(subtask(deficate(C), open(O), 48), t) :- goal(C, open(O), t), subtask(deficate(C), open(O), 48).
goal(subtask(deficate(C), walk(O), 49), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 49).
goal(subtask(deficate(C), walk(O), 50), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 50).
goal(subtask(deficate(C), walk(O), 51), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 51).
goal(subtask(deficate(C), sit(O), 52), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 52).
goal(subtask(deficate(C), eat(O), 53), t) :- goal(C, eat(O), t), subtask(deficate(C), eat(O), 53).
goal(subtask(deficate(C), walk(O), 54), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 54).
goal(subtask(deficate(C), walk(O), 55), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 55).
goal(subtask(deficate(C), drop(O), 56), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 56).
goal(subtask(deficate(C), walk(O), 57), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 57).
goal(subtask(deficate(C), walk(O), 58), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 58).
goal(subtask(deficate(C), wash(O), 59), t) :- goal(C, wash(O), t), subtask(deficate(C), wash(O), 59).
goal(subtask(deficate(C), drink(O), 60), t) :- goal(C, drink(O), t), subtask(deficate(C), drink(O), 60).
goal(subtask(deficate(C), walk(O), 61), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 61).
goal(subtask(deficate(C), walk(O), 62), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 62).
goal(subtask(deficate(C), open(O), 63), t) :- goal(C, open(O), t), subtask(deficate(C), open(O), 63).
goal(subtask(deficate(C), walk(O), 64), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 64).
goal(subtask(deficate(C), walk(O), 65), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 65).
goal(subtask(deficate(C), walk(O), 66), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 66).
goal(subtask(deficate(C), sit(O), 67), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 67).
goal(subtask(deficate(C), eat(O), 68), t) :- goal(C, eat(O), t), subtask(deficate(C), eat(O), 68).
goal(subtask(deficate(C), walk(O), 69), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 69).
goal(subtask(deficate(C), walk(O), 70), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 70).
goal(subtask(deficate(C), walk(O), 71), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 71).
goal(subtask(deficate(C), sit(O), 72), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 72).
goal(subtask(deficate(C), eat(O), 73), t) :- goal(C, eat(O), t), subtask(deficate(C), eat(O), 73).
goal(subtask(deficate(C), walk(O), 74), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 74).
goal(subtask(deficate(C), walk(O), 75), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 75).
goal(subtask(deficate(C), sit(O), 76), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 76).
goal(subtask(deficate(C), eat(O), 77), t) :- goal(C, eat(O), t), subtask(deficate(C), eat(O), 77).
goal(subtask(deficate(C), walk(O), 78), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 78).
goal(subtask(deficate(C), sit(O), 79), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 79).
goal(subtask(deficate(C), eat(O), 80), t) :- goal(C, eat(O), t), subtask(deficate(C), eat(O), 80).
goal(subtask(deficate(C), walk(O), 81), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 81).
goal(subtask(deficate(C), walk(O), 82), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 82).
goal(subtask(deficate(C), drink(O), 83), t) :- goal(C, drink(O), t), subtask(deficate(C), drink(O), 83).
goal(subtask(deficate(C), walk(O), 84), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 84).
goal(subtask(deficate(C), walk(O), 85), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 85).
goal(subtask(deficate(C), drop(O), 86), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 86).
goal(subtask(deficate(C), walk(O), 87), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 87).
goal(subtask(deficate(C), walk(O), 88), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 88).
goal(subtask(deficate(C), sit(O), 89), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 89).
goal(subtask(deficate(C), drop(O), 90), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 90).
goal(subtask(deficate(C), wash(O), 91), t) :- goal(C, wash(O), t), subtask(deficate(C), wash(O), 91).
goal(subtask(deficate(C), standup, 92), t) :- goal(C, standup, t), subtask(deficate(C), standup, 92).
goal(subtask(deficate(C), walk(O), 93), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 93).
goal(subtask(deficate(C), walk(O), 94), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 94).
goal(subtask(deficate(C), wash(O), 95), t) :- goal(C, wash(O), t), subtask(deficate(C), wash(O), 95).
goal(subtask(deficate(C), drink(O), 96), t) :- goal(C, drink(O), t), subtask(deficate(C), drink(O), 96).
goal(subtask(deficate(C), walk(O), 97), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 97).
goal(subtask(deficate(C), walk(O), 98), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 98).
goal(subtask(deficate(C), drop(O), 99), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 99).
goal(subtask(deficate(C), walk(O), 100), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 100).
goal(subtask(deficate(C), walk(O), 101), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 101).
goal(subtask(deficate(C), open(O), 102), t) :- goal(C, open(O), t), subtask(deficate(C), open(O), 102).
goal(subtask(deficate(C), walk(O), 103), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 103).
goal(subtask(deficate(C), walk(O), 104), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 104).
goal(subtask(deficate(C), walk(O), 105), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 105).
goal(subtask(deficate(C), sit(O), 106), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 106).
goal(subtask(deficate(C), eat(O), 107), t) :- goal(C, eat(O), t), subtask(deficate(C), eat(O), 107).
goal(subtask(deficate(C), walk(O), 108), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 108).
goal(subtask(deficate(C), walk(O), 109), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 109).
goal(subtask(deficate(C), sit(O), 110), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 110).
goal(subtask(deficate(C), drop(O), 111), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 111).
goal(subtask(deficate(C), wash(O), 112), t) :- goal(C, wash(O), t), subtask(deficate(C), wash(O), 112).
goal(subtask(deficate(C), standup, 113), t) :- goal(C, standup, t), subtask(deficate(C), standup, 113).
goal(subtask(deficate(C), walk(O), 114), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 114).
goal(subtask(deficate(C), walk(O), 115), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 115).
goal(subtask(deficate(C), wash(O), 116), t) :- goal(C, wash(O), t), subtask(deficate(C), wash(O), 116).
goal(subtask(deficate(C), drink(O), 117), t) :- goal(C, drink(O), t), subtask(deficate(C), drink(O), 117).
goal(subtask(deficate(C), walk(O), 118), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 118).
goal(subtask(deficate(C), walk(O), 119), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 119).
goal(subtask(deficate(C), drop(O), 120), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 120).
goal(subtask(deficate(C), walk(O), 121), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 121).
goal(subtask(deficate(C), walk(O), 122), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 122).
goal(subtask(deficate(C), open(O), 123), t) :- goal(C, open(O), t), subtask(deficate(C), open(O), 123).
goal(subtask(deficate(C), walk(O), 124), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 124).
goal(subtask(deficate(C), walk(O), 125), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 125).
goal(subtask(deficate(C), walk(O), 126), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 126).
goal(subtask(deficate(C), sit(O), 127), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 127).
goal(subtask(deficate(C), eat(O), 128), t) :- goal(C, eat(O), t), subtask(deficate(C), eat(O), 128).
goal(subtask(deficate(C), walk(O), 129), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 129).
goal(subtask(deficate(C), walk(O), 130), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 130).
goal(subtask(deficate(C), drop(O), 131), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 131).
goal(subtask(deficate(C), walk(O), 132), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 132).
goal(subtask(deficate(C), walk(O), 133), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 133).
goal(subtask(deficate(C), wash(O), 134), t) :- goal(C, wash(O), t), subtask(deficate(C), wash(O), 134).
goal(subtask(deficate(C), drink(O), 135), t) :- goal(C, drink(O), t), subtask(deficate(C), drink(O), 135).
goal(subtask(deficate(C), walk(O), 136), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 136).
goal(subtask(deficate(C), walk(O), 137), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 137).
goal(subtask(deficate(C), open(O), 138), t) :- goal(C, open(O), t), subtask(deficate(C), open(O), 138).
goal(subtask(deficate(C), walk(O), 139), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 139).
goal(subtask(deficate(C), walk(O), 140), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 140).
goal(subtask(deficate(C), walk(O), 141), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 141).
goal(subtask(deficate(C), sit(O), 142), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 142).
goal(subtask(deficate(C), eat(O), 143), t) :- goal(C, eat(O), t), subtask(deficate(C), eat(O), 143).
goal(subtask(deficate(C), walk(O), 144), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 144).
goal(subtask(deficate(C), walk(O), 145), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 145).
goal(subtask(deficate(C), walk(O), 146), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 146).
goal(subtask(deficate(C), sit(O), 147), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 147).
goal(subtask(deficate(C), eat(O), 148), t) :- goal(C, eat(O), t), subtask(deficate(C), eat(O), 148).
goal(subtask(deficate(C), walk(O), 149), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 149).
goal(subtask(deficate(C), walk(O), 150), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 150).
goal(subtask(deficate(C), sit(O), 151), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 151).
goal(subtask(deficate(C), eat(O), 152), t) :- goal(C, eat(O), t), subtask(deficate(C), eat(O), 152).
goal(subtask(deficate(C), walk(O), 153), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 153).
goal(subtask(deficate(C), sit(O), 154), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 154).
goal(subtask(deficate(C), eat(O), 155), t) :- goal(C, eat(O), t), subtask(deficate(C), eat(O), 155).
goal(subtask(deficate(C), walk(O), 156), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 156).
goal(subtask(deficate(C), walk(O), 157), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 157).
goal(subtask(deficate(C), drink(O), 158), t) :- goal(C, drink(O), t), subtask(deficate(C), drink(O), 158).
goal(subtask(deficate(C), walk(O), 159), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 159).
goal(subtask(deficate(C), walk(O), 160), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 160).
goal(subtask(deficate(C), drop(O), 161), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 161).
goal(subtask(deficate(C), walk(O), 162), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 162).
goal(subtask(deficate(C), walk(O), 163), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 163).
goal(subtask(deficate(C), sit(O), 164), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 164).
goal(subtask(deficate(C), drop(O), 165), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 165).
goal(subtask(deficate(C), wash(O), 166), t) :- goal(C, wash(O), t), subtask(deficate(C), wash(O), 166).
goal(subtask(deficate(C), standup, 167), t) :- goal(C, standup, t), subtask(deficate(C), standup, 167).
goal(subtask(deficate(C), walk(O), 168), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 168).
goal(subtask(deficate(C), walk(O), 169), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 169).
goal(subtask(deficate(C), wash(O), 170), t) :- goal(C, wash(O), t), subtask(deficate(C), wash(O), 170).
goal(subtask(deficate(C), drink(O), 171), t) :- goal(C, drink(O), t), subtask(deficate(C), drink(O), 171).
goal(subtask(deficate(C), walk(O), 172), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 172).
goal(subtask(deficate(C), walk(O), 173), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 173).
goal(subtask(deficate(C), drop(O), 174), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 174).
goal(subtask(deficate(C), walk(O), 175), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 175).
goal(subtask(deficate(C), walk(O), 176), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 176).
goal(subtask(deficate(C), open(O), 177), t) :- goal(C, open(O), t), subtask(deficate(C), open(O), 177).
goal(subtask(deficate(C), walk(O), 178), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 178).
goal(subtask(deficate(C), walk(O), 179), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 179).
goal(subtask(deficate(C), walk(O), 180), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 180).
goal(subtask(deficate(C), sit(O), 181), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 181).
goal(subtask(deficate(C), eat(O), 182), t) :- goal(C, eat(O), t), subtask(deficate(C), eat(O), 182).
goal(subtask(deficate(C), walk(O), 183), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 183).
goal(subtask(deficate(C), walk(O), 184), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 184).
goal(subtask(deficate(C), sit(O), 185), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 185).
goal(subtask(deficate(C), drop(O), 186), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 186).
goal(subtask(deficate(C), wash(O), 187), t) :- goal(C, wash(O), t), subtask(deficate(C), wash(O), 187).
goal(subtask(deficate(C), standup, 188), t) :- goal(C, standup, t), subtask(deficate(C), standup, 188).
goal(subtask(deficate(C), walk(O), 189), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 189).
goal(subtask(deficate(C), walk(O), 190), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 190).
goal(subtask(deficate(C), wash(O), 191), t) :- goal(C, wash(O), t), subtask(deficate(C), wash(O), 191).
goal(subtask(deficate(C), drink(O), 192), t) :- goal(C, drink(O), t), subtask(deficate(C), drink(O), 192).
goal(subtask(deficate(C), walk(O), 193), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 193).
goal(subtask(deficate(C), walk(O), 194), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 194).
goal(subtask(deficate(C), drop(O), 195), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 195).
goal(subtask(deficate(C), walk(O), 196), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 196).
goal(subtask(deficate(C), walk(O), 197), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 197).
goal(subtask(deficate(C), open(O), 198), t) :- goal(C, open(O), t), subtask(deficate(C), open(O), 198).
goal(subtask(deficate(C), walk(O), 199), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 199).
goal(subtask(deficate(C), walk(O), 200), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 200).
goal(subtask(deficate(C), walk(O), 201), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 201).
goal(subtask(deficate(C), sit(O), 202), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 202).
goal(subtask(deficate(C), eat(O), 203), t) :- goal(C, eat(O), t), subtask(deficate(C), eat(O), 203).
goal(subtask(deficate(C), walk(O), 204), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 204).
goal(subtask(deficate(C), walk(O), 205), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 205).
goal(subtask(deficate(C), drop(O), 206), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 206).
goal(subtask(deficate(C), walk(O), 207), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 207).
goal(subtask(deficate(C), walk(O), 208), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 208).
goal(subtask(deficate(C), wash(O), 209), t) :- goal(C, wash(O), t), subtask(deficate(C), wash(O), 209).
goal(subtask(deficate(C), drink(O), 210), t) :- goal(C, drink(O), t), subtask(deficate(C), drink(O), 210).
goal(subtask(deficate(C), walk(O), 211), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 211).
goal(subtask(deficate(C), walk(O), 212), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 212).
goal(subtask(deficate(C), open(O), 213), t) :- goal(C, open(O), t), subtask(deficate(C), open(O), 213).
goal(subtask(deficate(C), walk(O), 214), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 214).
goal(subtask(deficate(C), walk(O), 215), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 215).
goal(subtask(deficate(C), walk(O), 216), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 216).
goal(subtask(deficate(C), sit(O), 217), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 217).
goal(subtask(deficate(C), eat(O), 218), t) :- goal(C, eat(O), t), subtask(deficate(C), eat(O), 218).
goal(subtask(deficate(C), walk(O), 219), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 219).
goal(subtask(deficate(C), walk(O), 220), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 220).
goal(subtask(deficate(C), walk(O), 221), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 221).
goal(subtask(deficate(C), sit(O), 222), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 222).
goal(subtask(deficate(C), eat(O), 223), t) :- goal(C, eat(O), t), subtask(deficate(C), eat(O), 223).
goal(subtask(deficate(C), walk(O), 224), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 224).
goal(subtask(deficate(C), walk(O), 225), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 225).
goal(subtask(deficate(C), sit(O), 226), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 226).
goal(subtask(deficate(C), eat(O), 227), t) :- goal(C, eat(O), t), subtask(deficate(C), eat(O), 227).
goal(subtask(deficate(C), walk(O), 228), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 228).
goal(subtask(deficate(C), sit(O), 229), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 229).
goal(subtask(deficate(C), eat(O), 230), t) :- goal(C, eat(O), t), subtask(deficate(C), eat(O), 230).
goal(subtask(deficate(C), walk(O), 231), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 231).
goal(subtask(deficate(C), walk(O), 232), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 232).
goal(subtask(deficate(C), drink(O), 233), t) :- goal(C, drink(O), t), subtask(deficate(C), drink(O), 233).
goal(subtask(deficate(C), walk(O), 234), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 234).
goal(subtask(deficate(C), walk(O), 235), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 235).
goal(subtask(deficate(C), drop(O), 236), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 236).
goal(subtask(deficate(C), walk(O), 237), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 237).
goal(subtask(deficate(C), walk(O), 238), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 238).
goal(subtask(deficate(C), sit(O), 239), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 239).
goal(subtask(deficate(C), drop(O), 240), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 240).
goal(subtask(deficate(C), wash(O), 241), t) :- goal(C, wash(O), t), subtask(deficate(C), wash(O), 241).
goal(subtask(deficate(C), standup, 242), t) :- goal(C, standup, t), subtask(deficate(C), standup, 242).
goal(subtask(deficate(C), walk(O), 243), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 243).
goal(subtask(deficate(C), walk(O), 244), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 244).
goal(subtask(deficate(C), wash(O), 245), t) :- goal(C, wash(O), t), subtask(deficate(C), wash(O), 245).
goal(subtask(deficate(C), drink(O), 246), t) :- goal(C, drink(O), t), subtask(deficate(C), drink(O), 246).
goal(subtask(deficate(C), walk(O), 247), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 247).
goal(subtask(deficate(C), walk(O), 248), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 248).
goal(subtask(deficate(C), drop(O), 249), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 249).
goal(subtask(deficate(C), walk(O), 250), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 250).
goal(subtask(deficate(C), walk(O), 251), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 251).
goal(subtask(deficate(C), open(O), 252), t) :- goal(C, open(O), t), subtask(deficate(C), open(O), 252).
goal(subtask(deficate(C), walk(O), 253), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 253).
goal(subtask(deficate(C), walk(O), 254), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 254).
goal(subtask(deficate(C), walk(O), 255), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 255).
goal(subtask(deficate(C), sit(O), 256), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 256).
goal(subtask(deficate(C), eat(O), 257), t) :- goal(C, eat(O), t), subtask(deficate(C), eat(O), 257).
goal(subtask(deficate(C), walk(O), 258), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 258).
goal(subtask(deficate(C), walk(O), 259), t) :- goal(C, walk(O), t), subtask(deficate(C), walk(O), 259).
goal(subtask(deficate(C), sit(O), 260), t) :- goal(C, sit(O), t), subtask(deficate(C), sit(O), 260).
goal(subtask(deficate(C), drop(O), 261), t) :- goal(C, drop(O), t), subtask(deficate(C), drop(O), 261).
goal(subtask(deficate(C), wash(O), 262), t) :- goal(C, wash(O), t), subtask(deficate(C), wash(O), 262).
