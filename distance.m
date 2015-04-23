%% A* Algorithm: Calculates Euclidean distance between 2 nodes
% ICS-E4000, Assignment 1
% Student: Gavriela Vranou
% Student number: 467614
% Starting position: Southwest

function dist = distance(node,goal)
dist=sqrt((node.x-goal.x)^2 + (node.y-goal.y)^2);
