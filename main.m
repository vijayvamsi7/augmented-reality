%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
clear;clc;
points=readPoints();

iter=100;
threshold=0.5;
min_points=3;
near_by=100;
%[p_best,n_best,ro_best,X_best,Y_best,Z_best,error_best]=ransac_cust(points,min_points,iter,threshold,near_by);

[model, inlierIdx]= RANSAC(points, fitFcn, distFcn, sampleSize, maxDistance) ;


% display the 3d points 
figure(1); clf; 
% plot3(points(:,1),points(:,2),points(:,3),'ro','LineWidth',2);
%  hold on
 plot3(X_best,Y_best,Z_best,'b*','LineWidth',2);
 hold off
drawnow
rotate3d on
axis equal
