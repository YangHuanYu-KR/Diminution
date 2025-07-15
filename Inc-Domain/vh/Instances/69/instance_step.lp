#program step(t).

goal(juggling(C), T0, t, 1) :- subtask(juggling(C)), subtask(juggling(C), grab(O1_1), 1), goal(subtask(juggling(C), grab(O1_1), 1), T0), T0 <= T1, time(T0), subtask(juggling(C), grab(O2_1), 2), goal(subtask(juggling(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(juggling(C), grab(O3_1), 3), goal(subtask(juggling(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(juggling(C), T3, t, 2) :- subtask(juggling(C), grab(O4_1), 4), goal(subtask(juggling(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(juggling(C), grab(O5_1), 5), goal(subtask(juggling(C), grab(O5_1), 5), T4), T4 <= T5, time(T4), subtask(juggling(C), grab(O6_1), 6), goal(subtask(juggling(C), grab(O6_1), 6), T5), T5 <= t, time(T5).
goal(juggling(C), T0, t, 3) :- goal(juggling(C), T0, T2, 1), goal(juggling(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(juggling(C), T6, t, 4) :- subtask(juggling(C), grab(O7_1), 7), goal(subtask(juggling(C), grab(O7_1), 7), T6), T6 <= T7, time(T6), subtask(juggling(C), grab(O8_1), 8), goal(subtask(juggling(C), grab(O8_1), 8), T7), T7 <= T8, time(T7), subtask(juggling(C), grab(O9_1), 9), goal(subtask(juggling(C), grab(O9_1), 9), T8), T8 <= t, time(T8).
goal(juggling(C), T0, t, 5) :- goal(juggling(C), T0, T5, 3), goal(juggling(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(juggling(C), T9, t, 6) :- subtask(juggling(C), grab(O10_1), 10), goal(subtask(juggling(C), grab(O10_1), 10), T9), T9 <= T10, time(T9), subtask(juggling(C), grab(O11_1), 11), goal(subtask(juggling(C), grab(O11_1), 11), T10), T10 <= T11, time(T10), subtask(juggling(C), grab(O12_1), 12), goal(subtask(juggling(C), grab(O12_1), 12), T11), T11 <= t, time(T11).
goal(juggling(C), T0, t, 7) :- goal(juggling(C), T0, T8, 5), goal(juggling(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(juggling(C), T12, t, 8) :- subtask(juggling(C), grab(O13_1), 13), goal(subtask(juggling(C), grab(O13_1), 13), T12), T12 <= T13, time(T12), subtask(juggling(C), grab(O14_1), 14), goal(subtask(juggling(C), grab(O14_1), 14), T13), T13 <= T14, time(T13), subtask(juggling(C), grab(O15_1), 15), goal(subtask(juggling(C), grab(O15_1), 15), T14), T14 <= t, time(T14).
goal(juggling(C), T0, t, 9) :- goal(juggling(C), T0, T11, 7), goal(juggling(C), T12, T14, 8), time(T0), time(T11), time(T12), T11 <= T12, time(T14), T12 <= t.
goal(juggling(C), T15, t, 10) :- subtask(juggling(C), grab(O16_1), 16), goal(subtask(juggling(C), grab(O16_1), 16), T15), T15 <= T16, time(T15), subtask(juggling(C), grab(O17_1), 17), goal(subtask(juggling(C), grab(O17_1), 17), T16), T16 <= T17, time(T16), subtask(juggling(C), grab(O18_1), 18), goal(subtask(juggling(C), grab(O18_1), 18), T17), T17 <= t, time(T17).
goal(juggling(C), T0, t, 11) :- goal(juggling(C), T0, T14, 9), goal(juggling(C), T15, T17, 10), time(T0), time(T14), time(T15), T14 <= T15, time(T17), T15 <= t.
goal(juggling(C), T18, t, 12) :- subtask(juggling(C), grab(O19_1), 19), goal(subtask(juggling(C), grab(O19_1), 19), T18), T18 <= T19, time(T18), subtask(juggling(C), grab(O20_1), 20), goal(subtask(juggling(C), grab(O20_1), 20), T19), T19 <= T20, time(T19), subtask(juggling(C), grab(O21_1), 21), goal(subtask(juggling(C), grab(O21_1), 21), T20), T20 <= t, time(T20).
goal(juggling(C), T0, t, 13) :- goal(juggling(C), T0, T17, 11), goal(juggling(C), T18, T20, 12), time(T0), time(T17), time(T18), T17 <= T18, time(T20), T18 <= t.
goal(juggling(C), T21, t, 14) :- subtask(juggling(C), grab(O22_1), 22), goal(subtask(juggling(C), grab(O22_1), 22), T21), T21 <= T22, time(T21), subtask(juggling(C), grab(O23_1), 23), goal(subtask(juggling(C), grab(O23_1), 23), T22), T22 <= T23, time(T22), subtask(juggling(C), grab(O24_1), 24), goal(subtask(juggling(C), grab(O24_1), 24), T23), T23 <= t, time(T23).
goal(juggling(C), T0, t, 15) :- goal(juggling(C), T0, T20, 13), goal(juggling(C), T21, T23, 14), time(T0), time(T20), time(T21), T20 <= T21, time(T23), T21 <= t.
goal(juggling(C), T24, t, 16) :- subtask(juggling(C), grab(O25_1), 25), goal(subtask(juggling(C), grab(O25_1), 25), T24), T24 <= T25, time(T24), subtask(juggling(C), grab(O26_1), 26), goal(subtask(juggling(C), grab(O26_1), 26), T25), T25 <= T26, time(T25), subtask(juggling(C), grab(O27_1), 27), goal(subtask(juggling(C), grab(O27_1), 27), T26), T26 <= t, time(T26).
goal(juggling(C), T0, t, 17) :- goal(juggling(C), T0, T23, 15), goal(juggling(C), T24, T26, 16), time(T0), time(T23), time(T24), T23 <= T24, time(T26), T24 <= t.
goal(juggling(C), T27, t, 18) :- subtask(juggling(C), grab(O28_1), 28), goal(subtask(juggling(C), grab(O28_1), 28), T27), T27 <= T28, time(T27), subtask(juggling(C), grab(O29_1), 29), goal(subtask(juggling(C), grab(O29_1), 29), T28), T28 <= T29, time(T28), subtask(juggling(C), grab(O30_1), 30), goal(subtask(juggling(C), grab(O30_1), 30), T29), T29 <= t, time(T29).
goal(juggling(C), T0, t, 19) :- goal(juggling(C), T0, T26, 17), goal(juggling(C), T27, T29, 18), time(T0), time(T26), time(T27), T26 <= T27, time(T29), T27 <= t.
goal(juggling(C), T30, t, 20) :- subtask(juggling(C), grab(O31_1), 31), goal(subtask(juggling(C), grab(O31_1), 31), T30), T30 <= T31, time(T30), subtask(juggling(C), grab(O32_1), 32), goal(subtask(juggling(C), grab(O32_1), 32), T31), T31 <= T32, time(T31), subtask(juggling(C), grab(O33_1), 33), goal(subtask(juggling(C), grab(O33_1), 33), T32), T32 <= t, time(T32).
goal(juggling(C), T0, t, 21) :- goal(juggling(C), T0, T29, 19), goal(juggling(C), T30, T32, 20), time(T0), time(T29), time(T30), T29 <= T30, time(T32), T30 <= t.
goal(juggling(C), T33, t, 22) :- subtask(juggling(C), grab(O34_1), 34), goal(subtask(juggling(C), grab(O34_1), 34), T33), T33 <= T34, time(T33), subtask(juggling(C), grab(O35_1), 35), goal(subtask(juggling(C), grab(O35_1), 35), T34), T34 <= T35, time(T34), subtask(juggling(C), grab(O36_1), 36), goal(subtask(juggling(C), grab(O36_1), 36), T35), T35 <= t, time(T35).
goal(juggling(C), T0, t, 23) :- goal(juggling(C), T0, T32, 21), goal(juggling(C), T33, T35, 22), time(T0), time(T32), time(T33), T32 <= T33, time(T35), T33 <= t.
goal(juggling(C), T36, t, 24) :- subtask(juggling(C), grab(O37_1), 37), goal(subtask(juggling(C), grab(O37_1), 37), T36), T36 <= T37, time(T36), subtask(juggling(C), grab(O38_1), 38), goal(subtask(juggling(C), grab(O38_1), 38), T37), T37 <= T38, time(T37), subtask(juggling(C), grab(O39_1), 39), goal(subtask(juggling(C), grab(O39_1), 39), T38), T38 <= t, time(T38).
goal(juggling(C), T0, t, 25) :- goal(juggling(C), T0, T35, 23), goal(juggling(C), T36, T38, 24), time(T0), time(T35), time(T36), T35 <= T36, time(T38), T36 <= t.
goal(juggling(C), T39, t, 26) :- subtask(juggling(C), grab(O40_1), 40), goal(subtask(juggling(C), grab(O40_1), 40), T39), T39 <= T40, time(T39), subtask(juggling(C), grab(O41_1), 41), goal(subtask(juggling(C), grab(O41_1), 41), T40), T40 <= T41, time(T40), subtask(juggling(C), grab(O42_1), 42), goal(subtask(juggling(C), grab(O42_1), 42), T41), T41 <= t, time(T41).
goal(juggling(C), T0, t, 27) :- goal(juggling(C), T0, T38, 25), goal(juggling(C), T39, T41, 26), time(T0), time(T38), time(T39), T38 <= T39, time(T41), T39 <= t.
goal(juggling(C), T42, t, 28) :- subtask(juggling(C), grab(O43_1), 43), goal(subtask(juggling(C), grab(O43_1), 43), T42), T42 <= T43, time(T42), subtask(juggling(C), grab(O44_1), 44), goal(subtask(juggling(C), grab(O44_1), 44), T43), T43 <= T44, time(T43), subtask(juggling(C), grab(O45_1), 45), goal(subtask(juggling(C), grab(O45_1), 45), T44), T44 <= t, time(T44).
goal(juggling(C), T0, t, 29) :- goal(juggling(C), T0, T41, 27), goal(juggling(C), T42, T44, 28), time(T0), time(T41), time(T42), T41 <= T42, time(T44), T42 <= t.
goal(juggling(C), T45, t, 30) :- subtask(juggling(C), grab(O46_1), 46), goal(subtask(juggling(C), grab(O46_1), 46), T45), T45 <= T46, time(T45), subtask(juggling(C), grab(O47_1), 47), goal(subtask(juggling(C), grab(O47_1), 47), T46), T46 <= T47, time(T46), subtask(juggling(C), grab(O48_1), 48), goal(subtask(juggling(C), grab(O48_1), 48), T47), T47 <= t, time(T47).
goal(juggling(C), T0, t, 31) :- goal(juggling(C), T0, T44, 29), goal(juggling(C), T45, T47, 30), time(T0), time(T44), time(T45), T44 <= T45, time(T47), T45 <= t.
goal(juggling(C), T48, t, 32) :- subtask(juggling(C), grab(O49_1), 49), goal(subtask(juggling(C), grab(O49_1), 49), T48), T48 <= T49, time(T48), subtask(juggling(C), grab(O50_1), 50), goal(subtask(juggling(C), grab(O50_1), 50), T49), T49 <= T50, time(T49), subtask(juggling(C), grab(O51_1), 51), goal(subtask(juggling(C), grab(O51_1), 51), T50), T50 <= t, time(T50).
goal(juggling(C), T0, t, 33) :- goal(juggling(C), T0, T47, 31), goal(juggling(C), T48, T50, 32), time(T0), time(T47), time(T48), T47 <= T48, time(T50), T48 <= t.
goal(juggling(C), T51, t, 34) :- subtask(juggling(C), grab(O52_1), 52), goal(subtask(juggling(C), grab(O52_1), 52), T51), T51 <= T52, time(T51), subtask(juggling(C), grab(O53_1), 53), goal(subtask(juggling(C), grab(O53_1), 53), T52), T52 <= T53, time(T52), subtask(juggling(C), grab(O54_1), 54), goal(subtask(juggling(C), grab(O54_1), 54), T53), T53 <= t, time(T53).
goal(juggling(C), T0, t, 35) :- goal(juggling(C), T0, T50, 33), goal(juggling(C), T51, T53, 34), time(T0), time(T50), time(T51), T50 <= T51, time(T53), T51 <= t.
goal(juggling(C), T54, t, 36) :- subtask(juggling(C), grab(O55_1), 55), goal(subtask(juggling(C), grab(O55_1), 55), T54), T54 <= T55, time(T54), subtask(juggling(C), grab(O56_1), 56), goal(subtask(juggling(C), grab(O56_1), 56), T55), T55 <= T56, time(T55), subtask(juggling(C), grab(O57_1), 57), goal(subtask(juggling(C), grab(O57_1), 57), T56), T56 <= t, time(T56).
goal(juggling(C), T0, t, 37) :- goal(juggling(C), T0, T53, 35), goal(juggling(C), T54, T56, 36), time(T0), time(T53), time(T54), T53 <= T54, time(T56), T54 <= t.
goal(juggling(C), T57, t, 38) :- subtask(juggling(C), grab(O58_1), 58), goal(subtask(juggling(C), grab(O58_1), 58), T57), T57 <= T58, time(T57), subtask(juggling(C), grab(O59_1), 59), goal(subtask(juggling(C), grab(O59_1), 59), T58), T58 <= T59, time(T58), subtask(juggling(C), grab(O60_1), 60), goal(subtask(juggling(C), grab(O60_1), 60), T59), T59 <= t, time(T59).
goal(juggling(C), T0, t, 39) :- goal(juggling(C), T0, T56, 37), goal(juggling(C), T57, T59, 38), time(T0), time(T56), time(T57), T56 <= T57, time(T59), T57 <= t.
goal(juggling(C), T60, t, 40) :- subtask(juggling(C), grab(O61_1), 61), goal(subtask(juggling(C), grab(O61_1), 61), T60), T60 <= T61, time(T60), subtask(juggling(C), grab(O62_1), 62), goal(subtask(juggling(C), grab(O62_1), 62), T61), T61 <= T62, time(T61), subtask(juggling(C), grab(O63_1), 63), goal(subtask(juggling(C), grab(O63_1), 63), T62), T62 <= t, time(T62).
goal(juggling(C), T0, t, 41) :- goal(juggling(C), T0, T59, 39), goal(juggling(C), T60, T62, 40), time(T0), time(T59), time(T60), T59 <= T60, time(T62), T60 <= t.
goal(juggling(C), T63, t, 42) :- subtask(juggling(C), grab(O64_1), 64), goal(subtask(juggling(C), grab(O64_1), 64), T63), T63 <= T64, time(T63), subtask(juggling(C), grab(O65_1), 65), goal(subtask(juggling(C), grab(O65_1), 65), T64), T64 <= T65, time(T64), subtask(juggling(C), grab(O66_1), 66), goal(subtask(juggling(C), grab(O66_1), 66), T65), T65 <= t, time(T65).
goal(juggling(C), T0, t, 43) :- goal(juggling(C), T0, T62, 41), goal(juggling(C), T63, T65, 42), time(T0), time(T62), time(T63), T62 <= T63, time(T65), T63 <= t.
goal(juggling(C), T66, t, 44) :- subtask(juggling(C), grab(O67_1), 67), goal(subtask(juggling(C), grab(O67_1), 67), T66), T66 <= T67, time(T66), subtask(juggling(C), grab(O68_1), 68), goal(subtask(juggling(C), grab(O68_1), 68), T67), T67 <= T68, time(T67), subtask(juggling(C), grab(O69_1), 69), goal(subtask(juggling(C), grab(O69_1), 69), T68), T68 <= t, time(T68).
goal(juggling(C), T0, t, 45) :- goal(juggling(C), T0, T65, 43), goal(juggling(C), T66, T68, 44), time(T0), time(T65), time(T66), T65 <= T66, time(T68), T66 <= t.
goal(juggling(C), T69, t, 46) :- subtask(juggling(C), grab(O70_1), 70), goal(subtask(juggling(C), grab(O70_1), 70), T69), T69 <= T70, time(T69), subtask(juggling(C), grab(O71_1), 71), goal(subtask(juggling(C), grab(O71_1), 71), T70), T70 <= T71, time(T70), subtask(juggling(C), grab(O72_1), 72), goal(subtask(juggling(C), grab(O72_1), 72), T71), T71 <= t, time(T71).
goal(juggling(C), T0, t, 47) :- goal(juggling(C), T0, T68, 45), goal(juggling(C), T69, T71, 46), time(T0), time(T68), time(T69), T68 <= T69, time(T71), T69 <= t.
goal(juggling(C), T72, t, 48) :- subtask(juggling(C), grab(O73_1), 73), goal(subtask(juggling(C), grab(O73_1), 73), T72), T72 <= T73, time(T72), subtask(juggling(C), grab(O74_1), 74), goal(subtask(juggling(C), grab(O74_1), 74), T73), T73 <= T74, time(T73), subtask(juggling(C), grab(O75_1), 75), goal(subtask(juggling(C), grab(O75_1), 75), T74), T74 <= t, time(T74).
goal(juggling(C), T0, t, 49) :- goal(juggling(C), T0, T71, 47), goal(juggling(C), T72, T74, 48), time(T0), time(T71), time(T72), T71 <= T72, time(T74), T72 <= t.
goal(juggling(C), T75, t, 50) :- subtask(juggling(C), grab(O76_1), 76), goal(subtask(juggling(C), grab(O76_1), 76), T75), T75 <= T76, time(T75), subtask(juggling(C), grab(O77_1), 77), goal(subtask(juggling(C), grab(O77_1), 77), T76), T76 <= T77, time(T76), subtask(juggling(C), grab(O78_1), 78), goal(subtask(juggling(C), grab(O78_1), 78), T77), T77 <= t, time(T77).
goal(juggling(C), T0, t, 51) :- goal(juggling(C), T0, T74, 49), goal(juggling(C), T75, T77, 50), time(T0), time(T74), time(T75), T74 <= T75, time(T77), T75 <= t.
goal(juggling(C), T78, t, 52) :- subtask(juggling(C), grab(O79_1), 79), goal(subtask(juggling(C), grab(O79_1), 79), T78), T78 <= T79, time(T78), subtask(juggling(C), grab(O80_1), 80), goal(subtask(juggling(C), grab(O80_1), 80), T79), T79 <= T80, time(T79), subtask(juggling(C), grab(O81_1), 81), goal(subtask(juggling(C), grab(O81_1), 81), T80), T80 <= t, time(T80).
goal(juggling(C), T0, t, 53) :- goal(juggling(C), T0, T77, 51), goal(juggling(C), T78, T80, 52), time(T0), time(T77), time(T78), T77 <= T78, time(T80), T78 <= t.
goal(juggling(C), T81, t, 54) :- subtask(juggling(C), grab(O82_1), 82), goal(subtask(juggling(C), grab(O82_1), 82), T81), T81 <= T82, time(T81), subtask(juggling(C), grab(O83_1), 83), goal(subtask(juggling(C), grab(O83_1), 83), T82), T82 <= T83, time(T82), subtask(juggling(C), grab(O84_1), 84), goal(subtask(juggling(C), grab(O84_1), 84), T83), T83 <= t, time(T83).
goal(juggling(C), T0, t, 55) :- goal(juggling(C), T0, T80, 53), goal(juggling(C), T81, T83, 54), time(T0), time(T80), time(T81), T80 <= T81, time(T83), T81 <= t.
goal(juggling(C), T84, t, 56) :- subtask(juggling(C), grab(O85_1), 85), goal(subtask(juggling(C), grab(O85_1), 85), T84), T84 <= T85, time(T84), subtask(juggling(C), grab(O86_1), 86), goal(subtask(juggling(C), grab(O86_1), 86), T85), T85 <= T86, time(T85), subtask(juggling(C), grab(O87_1), 87), goal(subtask(juggling(C), grab(O87_1), 87), T86), T86 <= t, time(T86).
goal(juggling(C), T0, t, 57) :- goal(juggling(C), T0, T83, 55), goal(juggling(C), T84, T86, 56), time(T0), time(T83), time(T84), T83 <= T84, time(T86), T84 <= t.
goal(juggling(C), T87, t, 58) :- subtask(juggling(C), grab(O88_1), 88), goal(subtask(juggling(C), grab(O88_1), 88), T87), T87 <= T88, time(T87), subtask(juggling(C), grab(O89_1), 89), goal(subtask(juggling(C), grab(O89_1), 89), T88), T88 <= T89, time(T88), subtask(juggling(C), grab(O90_1), 90), goal(subtask(juggling(C), grab(O90_1), 90), T89), T89 <= t, time(T89).
goal(juggling(C), T0, t, 59) :- goal(juggling(C), T0, T86, 57), goal(juggling(C), T87, T89, 58), time(T0), time(T86), time(T87), T86 <= T87, time(T89), T87 <= t.
goal(juggling(C), T90, t, 60) :- subtask(juggling(C), grab(O91_1), 91), goal(subtask(juggling(C), grab(O91_1), 91), T90), T90 <= T91, time(T90), subtask(juggling(C), grab(O92_1), 92), goal(subtask(juggling(C), grab(O92_1), 92), T91), T91 <= T92, time(T91), subtask(juggling(C), grab(O93_1), 93), goal(subtask(juggling(C), grab(O93_1), 93), T92), T92 <= t, time(T92).
goal(juggling(C), T0, t, 61) :- goal(juggling(C), T0, T89, 59), goal(juggling(C), T90, T92, 60), time(T0), time(T89), time(T90), T89 <= T90, time(T92), T90 <= t.
goal(juggling(C), T93, t, 62) :- subtask(juggling(C), grab(O94_1), 94), goal(subtask(juggling(C), grab(O94_1), 94), T93), T93 <= T94, time(T93), subtask(juggling(C), grab(O95_1), 95), goal(subtask(juggling(C), grab(O95_1), 95), T94), T94 <= T95, time(T94), subtask(juggling(C), grab(O96_1), 96), goal(subtask(juggling(C), grab(O96_1), 96), T95), T95 <= t, time(T95).
goal(juggling(C), T0, t, 63) :- goal(juggling(C), T0, T92, 61), goal(juggling(C), T93, T95, 62), time(T0), time(T92), time(T93), T92 <= T93, time(T95), T93 <= t.
goal(juggling(C), T96, t, 64) :- subtask(juggling(C), grab(O97_1), 97), goal(subtask(juggling(C), grab(O97_1), 97), T96), T96 <= T97, time(T96), subtask(juggling(C), grab(O98_1), 98), goal(subtask(juggling(C), grab(O98_1), 98), T97), T97 <= T98, time(T97), subtask(juggling(C), grab(O99_1), 99), goal(subtask(juggling(C), grab(O99_1), 99), T98), T98 <= t, time(T98).
goal(juggling(C), T0, t, 65) :- goal(juggling(C), T0, T95, 63), goal(juggling(C), T96, T98, 64), time(T0), time(T95), time(T96), T95 <= T96, time(T98), T96 <= t.
goal(juggling(C), T99, t, 66) :- subtask(juggling(C), grab(O100_1), 100), goal(subtask(juggling(C), grab(O100_1), 100), T99), T99 <= T100, time(T99), subtask(juggling(C), grab(O101_1), 101), goal(subtask(juggling(C), grab(O101_1), 101), T100), T100 <= T101, time(T100), subtask(juggling(C), grab(O102_1), 102), goal(subtask(juggling(C), grab(O102_1), 102), T101), T101 <= t, time(T101).
goal(juggling(C), T0, t, 67) :- goal(juggling(C), T0, T98, 65), goal(juggling(C), T99, T101, 66), time(T0), time(T98), time(T99), T98 <= T99, time(T101), T99 <= t.
goal(juggling(C), T102, t, 68) :- subtask(juggling(C), grab(O103_1), 103), goal(subtask(juggling(C), grab(O103_1), 103), T102), T102 <= T103, time(T102), subtask(juggling(C), grab(O104_1), 104), goal(subtask(juggling(C), grab(O104_1), 104), T103), T103 <= T104, time(T103), subtask(juggling(C), grab(O105_1), 105), goal(subtask(juggling(C), grab(O105_1), 105), T104), T104 <= t, time(T104).
goal(juggling(C), T0, t, 69) :- goal(juggling(C), T0, T101, 67), goal(juggling(C), T102, T104, 68), time(T0), time(T101), time(T102), T101 <= T102, time(T104), T102 <= t.
goal(juggling(C), T105, t, 70) :- subtask(juggling(C), grab(O106_1), 106), goal(subtask(juggling(C), grab(O106_1), 106), T105), T105 <= T106, time(T105), subtask(juggling(C), grab(O107_1), 107), goal(subtask(juggling(C), grab(O107_1), 107), T106), T106 <= T107, time(T106), subtask(juggling(C), grab(O108_1), 108), goal(subtask(juggling(C), grab(O108_1), 108), T107), T107 <= t, time(T107).
goal(juggling(C), t) :- goal(juggling(C), T0, T104, 69), goal(juggling(C), T105, t, 70), time(T0), time(T104), time(T105), T104 <= T105.

goal(subtask(juggling(C), grab(O), 1), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 1).
goal(subtask(juggling(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 2).
goal(subtask(juggling(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 3).
goal(subtask(juggling(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 4).
goal(subtask(juggling(C), grab(O), 5), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 5).
goal(subtask(juggling(C), grab(O), 6), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 6).
goal(subtask(juggling(C), grab(O), 7), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 7).
goal(subtask(juggling(C), grab(O), 8), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 8).
goal(subtask(juggling(C), grab(O), 9), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 9).
goal(subtask(juggling(C), grab(O), 10), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 10).
goal(subtask(juggling(C), grab(O), 11), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 11).
goal(subtask(juggling(C), grab(O), 12), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 12).
goal(subtask(juggling(C), grab(O), 13), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 13).
goal(subtask(juggling(C), grab(O), 14), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 14).
goal(subtask(juggling(C), grab(O), 15), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 15).
goal(subtask(juggling(C), grab(O), 16), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 16).
goal(subtask(juggling(C), grab(O), 17), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 17).
goal(subtask(juggling(C), grab(O), 18), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 18).
goal(subtask(juggling(C), grab(O), 19), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 19).
goal(subtask(juggling(C), grab(O), 20), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 20).
goal(subtask(juggling(C), grab(O), 21), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 21).
goal(subtask(juggling(C), grab(O), 22), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 22).
goal(subtask(juggling(C), grab(O), 23), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 23).
goal(subtask(juggling(C), grab(O), 24), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 24).
goal(subtask(juggling(C), grab(O), 25), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 25).
goal(subtask(juggling(C), grab(O), 26), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 26).
goal(subtask(juggling(C), grab(O), 27), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 27).
goal(subtask(juggling(C), grab(O), 28), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 28).
goal(subtask(juggling(C), grab(O), 29), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 29).
goal(subtask(juggling(C), grab(O), 30), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 30).
goal(subtask(juggling(C), grab(O), 31), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 31).
goal(subtask(juggling(C), grab(O), 32), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 32).
goal(subtask(juggling(C), grab(O), 33), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 33).
goal(subtask(juggling(C), grab(O), 34), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 34).
goal(subtask(juggling(C), grab(O), 35), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 35).
goal(subtask(juggling(C), grab(O), 36), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 36).
goal(subtask(juggling(C), grab(O), 37), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 37).
goal(subtask(juggling(C), grab(O), 38), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 38).
goal(subtask(juggling(C), grab(O), 39), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 39).
goal(subtask(juggling(C), grab(O), 40), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 40).
goal(subtask(juggling(C), grab(O), 41), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 41).
goal(subtask(juggling(C), grab(O), 42), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 42).
goal(subtask(juggling(C), grab(O), 43), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 43).
goal(subtask(juggling(C), grab(O), 44), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 44).
goal(subtask(juggling(C), grab(O), 45), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 45).
goal(subtask(juggling(C), grab(O), 46), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 46).
goal(subtask(juggling(C), grab(O), 47), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 47).
goal(subtask(juggling(C), grab(O), 48), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 48).
goal(subtask(juggling(C), grab(O), 49), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 49).
goal(subtask(juggling(C), grab(O), 50), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 50).
goal(subtask(juggling(C), grab(O), 51), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 51).
goal(subtask(juggling(C), grab(O), 52), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 52).
goal(subtask(juggling(C), grab(O), 53), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 53).
goal(subtask(juggling(C), grab(O), 54), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 54).
goal(subtask(juggling(C), grab(O), 55), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 55).
goal(subtask(juggling(C), grab(O), 56), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 56).
goal(subtask(juggling(C), grab(O), 57), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 57).
goal(subtask(juggling(C), grab(O), 58), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 58).
goal(subtask(juggling(C), grab(O), 59), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 59).
goal(subtask(juggling(C), grab(O), 60), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 60).
goal(subtask(juggling(C), grab(O), 61), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 61).
goal(subtask(juggling(C), grab(O), 62), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 62).
goal(subtask(juggling(C), grab(O), 63), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 63).
goal(subtask(juggling(C), grab(O), 64), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 64).
goal(subtask(juggling(C), grab(O), 65), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 65).
goal(subtask(juggling(C), grab(O), 66), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 66).
goal(subtask(juggling(C), grab(O), 67), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 67).
goal(subtask(juggling(C), grab(O), 68), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 68).
goal(subtask(juggling(C), grab(O), 69), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 69).
goal(subtask(juggling(C), grab(O), 70), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 70).
goal(subtask(juggling(C), grab(O), 71), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 71).
goal(subtask(juggling(C), grab(O), 72), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 72).
goal(subtask(juggling(C), grab(O), 73), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 73).
goal(subtask(juggling(C), grab(O), 74), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 74).
goal(subtask(juggling(C), grab(O), 75), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 75).
goal(subtask(juggling(C), grab(O), 76), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 76).
goal(subtask(juggling(C), grab(O), 77), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 77).
goal(subtask(juggling(C), grab(O), 78), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 78).
goal(subtask(juggling(C), grab(O), 79), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 79).
goal(subtask(juggling(C), grab(O), 80), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 80).
goal(subtask(juggling(C), grab(O), 81), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 81).
goal(subtask(juggling(C), grab(O), 82), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 82).
goal(subtask(juggling(C), grab(O), 83), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 83).
goal(subtask(juggling(C), grab(O), 84), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 84).
goal(subtask(juggling(C), grab(O), 85), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 85).
goal(subtask(juggling(C), grab(O), 86), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 86).
goal(subtask(juggling(C), grab(O), 87), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 87).
goal(subtask(juggling(C), grab(O), 88), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 88).
goal(subtask(juggling(C), grab(O), 89), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 89).
goal(subtask(juggling(C), grab(O), 90), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 90).
goal(subtask(juggling(C), grab(O), 91), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 91).
goal(subtask(juggling(C), grab(O), 92), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 92).
goal(subtask(juggling(C), grab(O), 93), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 93).
goal(subtask(juggling(C), grab(O), 94), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 94).
goal(subtask(juggling(C), grab(O), 95), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 95).
goal(subtask(juggling(C), grab(O), 96), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 96).
goal(subtask(juggling(C), grab(O), 97), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 97).
goal(subtask(juggling(C), grab(O), 98), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 98).
goal(subtask(juggling(C), grab(O), 99), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 99).
goal(subtask(juggling(C), grab(O), 100), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 100).
goal(subtask(juggling(C), grab(O), 101), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 101).
goal(subtask(juggling(C), grab(O), 102), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 102).
goal(subtask(juggling(C), grab(O), 103), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 103).
goal(subtask(juggling(C), grab(O), 104), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 104).
goal(subtask(juggling(C), grab(O), 105), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 105).
goal(subtask(juggling(C), grab(O), 106), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 106).
goal(subtask(juggling(C), grab(O), 107), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 107).
goal(subtask(juggling(C), grab(O), 108), t) :- goal(C, grab(O), t), subtask(juggling(C), grab(O), 108).
