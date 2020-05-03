%%%%%%%%%%%%% getImageCoordinates.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

function [img_coord]=getImageCoordinates(k,rot,camera)

[m,n]=size(camera);
img_coord=zeros(m,n);
for i=1:n
    coord=[camera(1,i);camera(2,i);camera(3,i);1];
    img_coord(:,i)=k*rot*coord;
end

return