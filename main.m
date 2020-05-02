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

points=readPoints('points3D.txt');

iter=3000;
threshold=0.0000001;
ransac_cust(points,iter,threshold);


% display the 3d points 
figure(1); clf; 
plot3(points(1,:),points(2,:)',points(3,:)','ro','LineWidth',2);
% hold on
% plot3(inlier(1,:)',inlier(2,:)',ilier(3,:)','b*','LineWidth',2);
% hold off
drawnow
rotate3d on
axis equal
