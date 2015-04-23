%% A* Algorithm: Return the index of the location of a node in the openList
% ICS-E4000, Assignment 1
% Student: Gavriela Vranou
% Student number: 467614
% Starting position: Southwest

function idx = nodeIndex(s,node)
ii=1;
while(s.openList(ii,1) ~= node.x || s.openList(ii,2) ~= node.y )
    ii=ii+1;
end; % End While
idx=ii;
end