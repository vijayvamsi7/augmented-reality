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

% iter=1000;
% threshold=1;
% min_points=3;
% near_by=10;
% [p_best,n_best,ro_best,X_best,Y_best,Z_best,error_best]=ransac_cust(points,min_points,iter,threshold,near_by);
% 
% %[model, inlierIdx]= RANSAC(points, fitFcn, distFcn, sampleSize, maxDistance) ;
% 
% 
% % display the 3d points 
% figure(1); clf; 
% % plot3(points(:,1),points(:,2),points(:,3),'ro','LineWidth',2); 
% % hold on
% plot3(p_best(1,:),p_best(2,:),p_best(3,:),'b*','LineWidth',2);
% hold off
% drawnow
% rotate3d on
% axis equal

inliers=matfile('in_points.mat').in_points;
camera_coord=getCameraCoordinates(inliers,points');
box = [1 1 1; 1 1 -1;1 -1 1;  1 -1 -1; -1 1 1; -1 1 -1 ; -1 -1 1;  -1 -1 -1];

figure(1);clf;
plot3(inliers(:,1),inliers(:,2),inliers(:,3),'b*','LineWidth',2);
hold on
plot3(points(:,1),points(:,2),points(:,3),'ro','LineWidth',2);
hold on
plot3(box(:,1),box(:,2),box(:,3),'o');
hold off
drawnow
rotate3d on
axis equal



