%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grid Size X:                      11
% Grid Size Y:                      6
% Number of Nodes:                  66
% Number of Highway Nodes:          45
% Number of Robots:                 3
% Number of Shelves:                12
% Number of Picking Stations:       2
% Number of Products:               5
% Number of Product Units in Total: 50
% Number of Orders:                 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#program base.

% init
init(object(highway,1),value(at,(1,1))).
init(object(highway,2),value(at,(2,1))).
init(object(highway,3),value(at,(3,1))).
init(object(highway,5),value(at,(5,1))).
init(object(highway,6),value(at,(6,1))).
init(object(highway,7),value(at,(7,1))).
init(object(highway,9),value(at,(9,1))).
init(object(highway,10),value(at,(10,1))).
init(object(highway,11),value(at,(11,1))).
init(object(highway,12),value(at,(1,2))).
init(object(highway,13),value(at,(2,2))).
init(object(highway,14),value(at,(3,2))).
init(object(highway,15),value(at,(4,2))).
init(object(highway,16),value(at,(5,2))).
init(object(highway,17),value(at,(6,2))).
init(object(highway,18),value(at,(7,2))).
init(object(highway,19),value(at,(8,2))).
init(object(highway,20),value(at,(9,2))).
init(object(highway,21),value(at,(10,2))).
init(object(highway,22),value(at,(11,2))).
init(object(highway,23),value(at,(1,3))).
init(object(highway,28),value(at,(6,3))).
init(object(highway,33),value(at,(11,3))).
init(object(highway,34),value(at,(1,4))).
init(object(highway,39),value(at,(6,4))).
init(object(highway,44),value(at,(11,4))).
init(object(highway,45),value(at,(1,5))).
init(object(highway,46),value(at,(2,5))).
init(object(highway,47),value(at,(3,5))).
init(object(highway,48),value(at,(4,5))).
init(object(highway,49),value(at,(5,5))).
init(object(highway,50),value(at,(6,5))).
init(object(highway,51),value(at,(7,5))).
init(object(highway,52),value(at,(8,5))).
init(object(highway,53),value(at,(9,5))).
init(object(highway,54),value(at,(10,5))).
init(object(highway,55),value(at,(11,5))).
init(object(highway,59),value(at,(4,6))).
init(object(highway,60),value(at,(5,6))).
init(object(highway,61),value(at,(6,6))).
init(object(highway,62),value(at,(7,6))).
init(object(highway,63),value(at,(8,6))).
init(object(highway,64),value(at,(9,6))).
init(object(highway,65),value(at,(10,6))).
init(object(highway,66),value(at,(11,6))).
init(object(node,1),value(at,(1,1))).
init(object(node,2),value(at,(2,1))).
init(object(node,3),value(at,(3,1))).
init(object(node,4),value(at,(4,1))).
init(object(node,5),value(at,(5,1))).
init(object(node,6),value(at,(6,1))).
init(object(node,7),value(at,(7,1))).
init(object(node,8),value(at,(8,1))).
init(object(node,9),value(at,(9,1))).
init(object(node,10),value(at,(10,1))).
init(object(node,11),value(at,(11,1))).
init(object(node,12),value(at,(1,2))).
init(object(node,13),value(at,(2,2))).
init(object(node,14),value(at,(3,2))).
init(object(node,15),value(at,(4,2))).
init(object(node,16),value(at,(5,2))).
init(object(node,17),value(at,(6,2))).
init(object(node,18),value(at,(7,2))).
init(object(node,19),value(at,(8,2))).
init(object(node,20),value(at,(9,2))).
init(object(node,21),value(at,(10,2))).
init(object(node,22),value(at,(11,2))).
init(object(node,23),value(at,(1,3))).
init(object(node,24),value(at,(2,3))).
init(object(node,25),value(at,(3,3))).
init(object(node,26),value(at,(4,3))).
init(object(node,27),value(at,(5,3))).
init(object(node,28),value(at,(6,3))).
init(object(node,29),value(at,(7,3))).
init(object(node,30),value(at,(8,3))).
init(object(node,31),value(at,(9,3))).
init(object(node,32),value(at,(10,3))).
init(object(node,33),value(at,(11,3))).
init(object(node,34),value(at,(1,4))).
init(object(node,35),value(at,(2,4))).
init(object(node,36),value(at,(3,4))).
init(object(node,37),value(at,(4,4))).
init(object(node,38),value(at,(5,4))).
init(object(node,39),value(at,(6,4))).
init(object(node,40),value(at,(7,4))).
init(object(node,41),value(at,(8,4))).
init(object(node,42),value(at,(9,4))).
init(object(node,43),value(at,(10,4))).
init(object(node,44),value(at,(11,4))).
init(object(node,45),value(at,(1,5))).
init(object(node,46),value(at,(2,5))).
init(object(node,47),value(at,(3,5))).
init(object(node,48),value(at,(4,5))).
init(object(node,49),value(at,(5,5))).
init(object(node,50),value(at,(6,5))).
init(object(node,51),value(at,(7,5))).
init(object(node,52),value(at,(8,5))).
init(object(node,53),value(at,(9,5))).
init(object(node,54),value(at,(10,5))).
init(object(node,55),value(at,(11,5))).
init(object(node,56),value(at,(1,6))).
init(object(node,57),value(at,(2,6))).
init(object(node,58),value(at,(3,6))).
init(object(node,59),value(at,(4,6))).
init(object(node,60),value(at,(5,6))).
init(object(node,61),value(at,(6,6))).
init(object(node,62),value(at,(7,6))).
init(object(node,63),value(at,(8,6))).
init(object(node,64),value(at,(9,6))).
init(object(node,65),value(at,(10,6))).
init(object(node,66),value(at,(11,6))).

init(object(order,1),value(line,(2,11))).
init(object(order,1),value(line,(4,2))).
init(object(order,1),value(pickingStation,1)).
init(object(order,2),value(line,(4,1))).
init(object(order,2),value(line,(5,20))).
init(object(order,2),value(pickingStation,2)).
init(object(order,3),value(line,(1,2))).
init(object(order,3),value(line,(3,1))).
init(object(order,3),value(pickingStation,2)).
init(object(pickingStation,1),value(at,(4,1))).
init(object(pickingStation,2),value(at,(8,1))).

init(object(product,1),value(on,(9,4))).
init(object(product,1),value(on,(12,4))).
init(object(product,2),value(on,(2,7))).
init(object(product,2),value(on,(3,4))).
init(object(product,3),value(on,(1,8))).
init(object(product,4),value(on,(1,1))).
init(object(product,4),value(on,(2,1))).
init(object(product,4),value(on,(3,1))).
init(object(product,5),value(on,(1,10))).
init(object(product,5),value(on,(2,10))).
init(object(robot,1),value(at,(1,6))).
init(object(robot,2),value(at,(2,6))).
init(object(robot,3),value(at,(3,6))).
init(object(shelf,1),value(at,(3,3))).
init(object(shelf,2),value(at,(5,3))).
init(object(shelf,3),value(at,(7,3))).
init(object(shelf,4),value(at,(8,3))).
init(object(shelf,5),value(at,(10,3))).
init(object(shelf,6),value(at,(3,4))).
init(object(shelf,7),value(at,(4,4))).
init(object(shelf,8),value(at,(5,4))).
init(object(shelf,9),value(at,(7,4))).
init(object(shelf,10),value(at,(8,4))).
init(object(shelf,11),value(at,(9,4))).
init(object(shelf,12),value(at,(10,4))).
