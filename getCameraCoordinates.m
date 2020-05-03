%%%%%%%%%%%%% getCameraCoordinates.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

function [camera_coor]=getCameraCoordinates(plane,worldPoints)

c=[0 0 0];
%c= mid point of plane
for i=1:length(plane)
    c(1)=c(1)+plane(i,1);
    c(2)=c(2)+plane(i,2);
    c(3)=c(3)+plane(i,3);
end
c=c./length(plane);

[m,n]=size(worldPoints);
camera_coor=zeros(m,n);
for i=1:n
    P=worldPoints(:,i);
    Z=P-c';
    Zaxis=Z/norm(Z);
    X=cross([0,0,1],Zaxis);
    Xaxis=X/norm(X);
    Yaxis=cross(Zaxis,Xaxis);
    rot(1,:)=Xaxis;
    rot(2,:)=Yaxis;
    rot(3,:)=Zaxis;
    camera_coor(:,i)=rot*Z;
end


return