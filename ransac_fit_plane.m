%%%%%%%%%%%%% ransac_fit_plane.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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


function [model,inliers]=ransac_fit_plane(points, threshold, iterations)

for i=1:iterations
    
    %rand select 3 points 
    perm=randperm(length(points));
    P(:,1)=points(perm(1),:);
    P(:,2)=points(perm(2),:);
    P(:,3)=points(perm(3),:);
    
    %find the normal of the plane
    n = cross(P(:,2)-P(:,1), P(:,3)-P(:,1));
    %convert to unit vector
    n = n/norm(n);                           
    
    npts = length(points);
    d = zeros(npts,1);   % d will be an array of distance values.

    % The following loop builds up the dot product between a vector from P(:,1)
    % to every X(:,i) with the unit plane normal.  This will be the
    % perpendicular distance from the plane for each point
    for j=1:3
        d = d + (points(j,:)'-P(j,1))*n(i); 
    end
    
    inliers = find(abs(d) < threshold);
    
end


return