%% A* Algorithm: Display findings of comparison
% ICS-E4000, Assignment 1
% Student: Gavriela Vranou
% Student number: 467614
% Starting position: Southwest

function displayPath(s,method1,d,method2)
%% Find the path for both methods
jj=size(s.optimalPath,1);
disp('');
s.str=sprintf('Optimal path to the target using %s method:\n',method1);
for ii=jj:-1:1
    s.str=strcat(s.str,sprintf('(%d,%d) ',s.optimalPath(ii,1),s.optimalPath(ii,2)));
end

jj=size(d.optimalPath,1);
disp('');
d.str=sprintf('Optimal path to the target using %s method:\n',method2);
for ii=jj:-1:1
    d.str=strcat(d.str,sprintf('(%d,%d) ',d.optimalPath(ii,1),d.optimalPath(ii,2)));
end
%% Display optimal path for both methods
disp(s.str);disp(d.str);

%% Display expanded nodes information for both methods
fprintf('%s: Total number of expanded nodes: %d, of which %d remain in the open list.\n',...
    method1,s.totalExpandedNodes,size(find(s.openList(:,8)>0),1));
fprintf('%s: Total number of expanded nodes: %d, of which %d remain in the open list.\n',...
    method2,d.totalExpandedNodes,size(find(d.openList(:,8)>0),1));
end