%% A* Algorithm: Populate openList with the expanded nodes of struct s
% ICS-E4000, Assignment 1
% Student: Gavriela Vranou
% Student number: 467614
% Starting position: Southwest

function newRow = insertExpandedNode(s,ii)
newRow=[1,8];

% node coordinates
newRow(1,1)=s.eNodes(ii,1); 
newRow(1,2)=s.eNodes(ii,2);

% parent node coordinates
newRow(1,3)=s.current.x;
newRow(1,4)=s.current.y;

newRow(1,5)=s.eNodes(ii,3); % heuristic cost h(n)
newRow(1,6)=s.eNodes(ii,4); % goal cost g(n)
newRow(1,7)=s.eNodes(ii,5); % path cost f(n)

% is on list? 1: true, 0: false
newRow(1,8)=1;
end