#program base.
%============================
% Instance Products_num:3, Machines_num:7, Attributes_num:4, idx 10
%============================

%----------------------------
% Object declarations (is/2)
%----------------------------
is(input1, input).
is(input2, input).
is(output1, output).
is(output2, output).
is(m1, machine).
is(m2, machine).
is(m3, machine).
is(p1, product).
is(p2, product).
is(p3, product).
is(a1, attribute).
is(a2, attribute).
is(a3, attribute).
is(a4, attribute).

%----------------------------
% Attribute assignments (give/2)
%----------------------------
gives(m1,a3).
gives(m2,a4).
gives(m3,a2).
gives(m3,a1).

%----------------------------
% Enter times (enter_time/3)
%----------------------------
enter_time(p1,input1,3).
enter_time(p2,input1,2).
enter_time(p3,input2,1).

%----------------------------
% Connectivity (connected/2)
%----------------------------
%----------------------------
% Connectivity (connected/2)
%----------------------------
connected(m1,m2).
connected(input1,m3).
connected(m3,output1).
connected(m1,output2).
connected(input2,m1).
connected(m3,m1).
connected(m2,m3).
connected(m1,m3).

