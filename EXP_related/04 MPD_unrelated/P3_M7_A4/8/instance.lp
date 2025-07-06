#program base.
%============================
% Instance Products_num:3, RelatedMachines:7, Attributes_num:4, UnrelatedMachines:7, idx 8
%============================

%----------------------------
% Object declarations - related (is/2)
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
% Object declarations - unrelated (is/2)
%----------------------------
is(u_m_8_1, machine).
is(u_m_8_2, machine).
is(u_m_8_3, machine).
is(u_m_8_4, machine).
is(u_m_8_5, machine).
is(u_m_8_6, machine).
is(u_m_8_7, machine).
is(u_a_8_1, attribute).
is(u_a_8_2, attribute).
is(u_a_8_3, attribute).
is(u_a_8_4, attribute).

%----------------------------
% Attribute assignments - related (gives/2)
%----------------------------
gives(m1,a3).
gives(m2,a4).
gives(m3,a2).
gives(m2,a1).

%----------------------------
% Attribute assignments - unrelated (gives/2)
%----------------------------
gives(u_m_8_1,u_a_8_3).
gives(u_m_8_2,u_a_8_4).
gives(u_m_8_3,u_a_8_1).
gives(u_m_8_4,u_a_8_2).
gives(u_m_8_5,u_a_8_3).
gives(u_m_8_6,u_a_8_3).
gives(u_m_8_7,u_a_8_2).

%----------------------------
% Enter times - related (enter_time/3)
%----------------------------
enter_time(p1,input1,2).
enter_time(p2,input1,1).
enter_time(p3,input2,3).

%----------------------------
% Connectivity - related (connected/2)
%----------------------------
connected(m3,m2).
connected(m3,m1).
connected(m1,m2).
connected(input1,m1).
connected(input2,m3).
connected(m1,output2).
connected(m2,m3).
connected(m2,output1).

%----------------------------
% Connectivity - unrelated (connected/2)
%   它们与主图完全不连通，仅在自身内部连通
%----------------------------
connected(u_m_8_1,u_m_8_2).
connected(u_m_8_2,u_m_8_3).
connected(u_m_8_3,u_m_8_4).
connected(u_m_8_4,u_m_8_5).
connected(u_m_8_5,u_m_8_6).
connected(u_m_8_6,u_m_8_7).
connected(u_m_8_7,u_m_8_1).
connected(u_m_8_3,u_m_8_1).
connected(u_m_8_1,u_m_8_5).
connected(u_m_8_4,u_m_8_3).
connected(u_m_8_6,u_m_8_3).
connected(u_m_8_4,u_m_8_5).
connected(u_m_8_5,u_m_8_1).
connected(u_m_8_4,u_m_8_5).

