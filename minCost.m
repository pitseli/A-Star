%% A* Algorithm: Return the index of the node with the least cost
% ICS-E4000, Assignment 1
% Student: Gavriela Vranou
% Student number: 467614
% Starting position: Southwest

function idx = minCost(s)
tmp=[];
kk=1;
flag=0;
goal=0;
% Get all nodes that are on the s.openList
for jj=1:s.openCount
    if (s.openList(jj,8)==1)
        tmp(kk,:)=[s.openList(jj,:) jj];
        if (s.openList(jj,1)==s.target.x && s.openList(jj,2)==s.target.y)
            flag=1;
            goal=jj; % Store the index of the goal node
        end;
        kk=kk+1;
    end % End IF
end % End for jj

% If one of the successors is the goal node, return its index
if flag == 1
    idx=goal;
else
    % Return the index of the node with the smallest cost
    if size(tmp ~= 0)
        [~,tidx]=min(tmp(:,7)); % Index of the smallest node in temp array
        idx=tmp(tidx,9); %Index of the smallest node in the s.openList
    else
        idx=-1;%The tmp is empty, no paths available.
    end
end