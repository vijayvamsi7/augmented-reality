%%%%%%%%%%%%% readPoints.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%
% Input Variables:
%
% Returned Results:
%
% Processing Flow:
%
%
% The following functions are called:  
%
%  Author:      Mudit Garg
%  Date:        05/01/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [points, points_hor]=readPoints()
fileID = fopen('points3D.txt','r');

output=textscan(fileID,'%f %f %f %f %*[^\n]','Delimiter',' ','CommentStyle','#');

points(1,:)=output{2};
points(2,:)=output{3};
points(3,:)=output{4};
points_hor(:, 1) = output{2};
points_hor(:, 2) = output{3};
points_hor(:, 3) = output{4};
fclose(fileID);
%points_hor
return