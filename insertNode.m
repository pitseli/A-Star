%% A* Algorithm: Populate openList using parameters
% ICS-E4000, Assignment 1
% Student: Gavriela Vranou
% Student number: 467614
% Starting position: Southwest

function newRow = insertNode(nodeX,nodeY,parentX,parentY,hCost,goalCost,fCost)
newRow=[1,8];

% node coordinates
newRow(1,1)=nodeX; 
newRow(1,2)=nodeY;

% parent node coordinates
newRow(1,3)=parentX;
newRow(1,4)=parentY;

newRow(1,5)=hCost;    % heuristic cost h(n)
newRow(1,6)=goalCost; % goal cost g(n)
newRow(1,7)=fCost;    % path cost f(n)

% is node on list? 1: true, 0: false
newRow(1,8)=1;
end