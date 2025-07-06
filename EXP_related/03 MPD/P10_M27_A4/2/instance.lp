#program base.
%============================
% Instance Products_num:10, Machines_num:27, Attributes_num:4, idx 2
%============================

%----------------------------
% Object declarations (is/2)
%----------------------------
is(input1, input).
is(input2, input).
is(input3, input).
is(output1, output).
is(output2, output).
is(output3, output).
is(output4, output).
is(m1, machine).
is(m2, machine).
is(m3, machine).
is(m4, machine).
is(m5, machine).
is(m6, machine).
is(m7, machine).
is(m8, machine).
is(m9, machine).
is(m10, machine).
is(m11, machine).
is(m12, machine).
is(m13, machine).
is(m14, machine).
is(m15, machine).
is(m16, machine).
is(m17, machine).
is(m18, machine).
is(m19, machine).
is(m20, machine).
is(p1, product).
is(p2, product).
is(p3, product).
is(p4, product).
is(p5, product).
is(p6, product).
is(p7, product).
is(p8, product).
is(p9, product).
is(p10, product).
is(a1, attribute).
is(a2, attribute).
is(a3, attribute).
is(a4, attribute).

%----------------------------
% Attribute assignments (give/2)
%----------------------------
gives(m1,a3).
gives(m2,a2).
gives(m3,a1).
gives(m4,a4).
gives(m5,a4).
gives(m6,a2).
gives(m7,a1).
gives(m8,a1).
gives(m9,a4).
gives(m10,a3).
gives(m11,a4).
gives(m12,a4).
gives(m13,a4).
gives(m14,a1).
gives(m15,a1).
gives(m16,a1).
gives(m17,a4).
gives(m18,a3).
gives(m19,a1).
gives(m20,a2).

%----------------------------
% Enter times (enter_time/3)
%----------------------------
enter_time(p1,input1,7).
enter_time(p2,input3,10).
enter_time(p3,input2,8).
enter_time(p4,input2,5).
enter_time(p5,input1,5).
enter_time(p6,input2,4).
enter_time(p7,input1,6).
enter_time(p8,input1,9).
enter_time(p9,input3,7).
enter_time(p10,input1,8).

%----------------------------
% Connectivity (connected/2)
%----------------------------
%----------------------------
% Connectivity (connected/2)
%----------------------------
connected(m7,m8).
connected(m16,m5).
connected(input2,m20).
connected(m19,m18).
connected(m16,m17).
connected(m14,m18).
connected(m9,m10).
connected(m5,m6).
connected(m19,m16).
connected(m3,output3).
connected(m11,m12).
connected(m2,m3).
connected(m18,m19).
connected(m20,m1).
connected(m14,m15).
connected(m7,m10).
connected(m2,m20).
connected(m10,m11).
connected(m15,m10).
connected(m2,m11).
connected(m3,m4).
connected(m19,m20).
connected(m13,m9).
connected(m15,m16).
connected(m2,output1).
connected(m17,m18).
connected(m7,m2).
connected(m1,m2).
connected(m6,m7).
connected(m6,output4).
connected(input1,m17).
connected(m12,m13).
connected(m4,m5).
connected(m17,output2).
connected(m13,m14).
connected(input3,m6).
connected(m8,m9).

