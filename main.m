%% A* Algorithm: Main
% ICS-E4000, Assignment 1
% Student: Gavriela Vranou
% Student number: 467614
% Starting position: Southwest
clear; close all; format compact; clc;

%% Compare Basic and Dynamic
dynamicRun=aStarDynamic(1);
basicRun=aStarBasic(1);

displayPath(basicRun,'Basic',dynamicRun,'Dynamic');
figure(1)
plotMaze(dynamicRun,'Dynamic')
figure(2)
plotMaze(basicRun,'Basic')