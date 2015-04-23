%% A* Algorithm: Plot maze and optimal path
% ICS-E4000, Assignment 1
% Student: Gavriela Vranou
% Student number: 467614
% Starting position: Southwest

function plotMaze(s,method)
load map.mat
[wMap,hMap]=size(map);

figure(gcf)
set(gca,'XAxisLocation','top','YAxisLocation','left',...
        'ydir','reverse','XLim',[1 wMap+1],'YLim',[1 hMap+1],...
        'XTIck', 1.5:12.5, 'YTIck', 1.5:12.5, 'XTickLabelMode','manual',...
        'YTickLabelMode','manual','XTickLabel',1:12,'YTickLabel',1:12);
grid on; box on;
hold on;
title(sprintf('A* optimal path using %s method',method));

%% Plot starting and target points
plot(s.target.y+.5,s.target.x+.5,'bd','MarkerFaceColor','b','MarkerSize',9);
text(s.target.y+1,s.target.x+.5,'Target')
plot(s.start.y+.5,s.start.x+.5,'bo','MarkerFaceColor','c','MarkerSize',9);
text(s.start.y+1,s.start.x+.5,'Start')

%% Plot obstacles
[rr,cc]=find(map==-1);
for ii=1:size(rr,1)
    plot(cc(ii)+.5,rr(ii)+.5,'rx','LineWidth',3,'MarkerSize',9);
end

%% Plot optimal path
jj=size(s.optimalPath,1);
p=plot(s.optimalPath(jj,2)+.5,s.optimalPath(jj,1)+.5,'bo','MarkerFaceColor','c','MarkerSize',9);
jj=jj-1;
for ii=jj:-1:1
    pause(.25);
    set(p,'XData',s.optimalPath(ii,2)+.5,'YData',s.optimalPath(ii,1)+.5);
end;
plot(s.optimalPath(:,2)+.5,s.optimalPath(:,1)+.5);