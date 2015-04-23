%% A* Algorithm: Dynamic
% ICS-E4000, Assignment 1
% Student: Gavriela Vranou
% Student number: 467614
% Starting position: Southwest

function s=aStarDynamic(varargin)
if (nargin<1)
    hush=1; %verbose
else
    hush=0; %silent
end
%% Initialise the map and start/target coordinates
% 12x12 maze map: stores the coordinates of the map
% and the objects in each coordinate
% Obstacle=-1, Target=1, Start=2, EmptySpace=0
load map.mat
[wMap,hMap]=size(map);

% Initialise parameters
s=initialiseParameters(map,wMap,hMap);
if(hush)
    disp('Initialised')
end
%% ---- A* Algorithm ----
existsPath=1;
while((s.current.x ~= s.target.x || s.current.y ~= s.target.y) && existsPath == 1)
    %% Stage 1: find successor nodes
    % Expanded array: x, y, h(n), g(n), f(n)
    % s.openList : x, y, p.x, p.y, h(n), g(n), f(n), onList
    s=expandNodes(s,wMap,hMap);
    
    % Update openList with the successor nodes
    for ii=1:s.eCount
        flag=0;
        for jj=1:s.openCount
            % Check if node already exists on the openList
            if(s.eNodes(ii,1) == s.openList(jj,1) && s.eNodes(ii,2) == s.openList(jj,2) )
                % update cost to minimum
                s.openList(jj,7)=min(s.openList(jj,7),s.eNodes(ii,5));
                
                if s.openList(jj,7)== s.eNodes(ii,5)
                    % Update parents and cost
                    s.openList(jj,3)=s.current.x;
                    s.openList(jj,4)=s.current.y;
                    s.openList(jj,5)=s.eNodes(ii,3);
                    s.openList(jj,6)=s.eNodes(ii,4);
                end % End IF : cost changed
                flag=1;
            end % End IF : node already exists
        end % End for jj
        
        % Insert new element into the openList
        if flag == 0
            s.openCount = s.openCount+1;
            s.openList(s.openCount,:)=insertExpandedNode(s,ii);
        end % End IF : new element
    end %End for ii
    %% Stage 2: find in which node to go next
    
    %Find out the node with the smallest f(n)
    idxNode=minCost(s);
    if (idxNode ~= -1)
        %Set current node to the node with minimum f(n)
        s.current.x=s.openList(idxNode,1);
        s.current.y=s.openList(idxNode,2);
        %Update the cost of reaching the parent node
        s.pathCost=s.openList(idxNode,5);
        
        %Move the node to closedList
        s.closedCount=s.closedCount+1;
        s.closedList(s.closedCount,1)=s.current.x;
        s.closedList(s.closedCount,2)=s.current.y;
        s.openList(idxNode,8)=0;
    else
        fprintf('idxNode is -1 for (%d,%d)\n',s.current.x,s.current.y)
        %No path leads to the s.target
        existsPath=0; % Exits the loop
    end; % End IF : idxNode
end %End WHILE
if(hush)
    disp('Find optimal path')
end
%% Stage 3: find and print optimal path
s=findOptimalPath(s,hush);
end