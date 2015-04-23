%% A* Algorithm: Initialisation
% ICS-E4000, Assignment 1
% Student: Gavriela Vranou
% Student number: 467614
% Starting position: Southwest

function s=initialiseParameters(map,wMap,hMap)
% Coordinates of the Target
try
    [s.target.x, s.target.y]=find(map==1);
catch err
    disp('oops! target NE')
    s.target.x=1;
    s.target.y=12;
    
end
% Coordinates of the starting position
try
    [s.start.x,s.start.y]=find(map==2);
catch err
    disp('oops! start SW')
    s.start.x=12;
    s.start.y=1;
end

%% Initialise lists used
% Open list containing candidate nodes
s.openList=[];

% Closed list containing obstacles and visited nodes
s.closedList=[];

%Put all obstacles on the Closed list
s.closedCount=0;
for ii=1:wMap
    for jj=1:hMap
        if(map(ii,jj) == -1)
            s.closedCount=s.closedCount+1;
            s.closedList(s.closedCount,1)=ii;
            s.closedList(s.closedCount,2)=jj;
        end % End IF
    end % End for jj
end % End for ii

%set the starting node as the first node
s.current.x=s.start.x;
s.current.y=s.start.y;
s.openCount=1;
s.pathCost=0;
goalDistance=distance(s.start,s.target);

s.openList(s.openCount,:)=insertNode(s.current.x,s.current.y,s.current.x,s.current.y,s.pathCost,goalDistance,goalDistance);
s.openList(s.openCount,8)=0;

s.closedCount=s.closedCount+1;
s.closedList(s.closedCount,1)=s.current.x;
s.closedList(s.closedCount,2)=s.current.y;

s.totalExpandedNodes=1;
end % End function