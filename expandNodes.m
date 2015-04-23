%% A* Algorithm: Expand successor nodes
% ICS-E4000, Assignment 1
% Student: Gavriela Vranou
% Student number: 467614
% Starting position: Southwest

function s=expandNodes(s,wMap,hMap)
% Takes a node and returns the expanded list of successors, with the
% calculated cost values. None of the successors is on the closedList.
s.eNodes=[];
s.eCount=1;
for ii= 1:-1:-1
    for jj= 1:-1:-1
        % Skip (ii,jj)=(0,0), it is the originating node
        if xor(jj,ii) % move only to one direction at a time
            successor.x = s.current.x + ii;
            successor.y = s.current.y + jj;
            % Check if the successor is within maze
            if( (successor.x >0 && successor.x <=wMap) && (successor.y >0 && successor.y <=hMap))
                flag=1;
                for kk=1:s.closedCount
                    % Check if the successor is on closed/visited list.
                    if(successor.x == s.closedList(kk,1) && successor.y == s.closedList(kk,2))
                        flag=0;
                    end
                end % End for kk
                
                % If the successor is not on closed list, expand the node
                if (flag)
                    s.eNodes(s.eCount,1) = successor.x;
                    s.eNodes(s.eCount,2) = successor.y;
                    % g(n) cost of travelling from start to node
                    s.eNodes(s.eCount,3) = s.pathCost+1;  
                    % h(n) distance between node and target
                    s.eNodes(s.eCount,4) = distance(s.target,successor); 
                    % f(n): g(n)+h(n) overall cost
                    s.eNodes(s.eCount,5) = s.eNodes(s.eCount,3)+s.eNodes(s.eCount,4); 
                    s.eCount=s.eCount+1;
                end % End IF : closed list
                
            end % End IF : maze
        end % End IF : originating node
    end % End for jj
end % End for ii
s.eCount=size(s.eNodes,1);
s.totalExpandedNodes=s.totalExpandedNodes+s.eCount;