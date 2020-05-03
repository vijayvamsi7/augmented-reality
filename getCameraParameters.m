%%%%%%%%%%%%% getCameraParameters.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

function [intrinsic_map,extrinsic_map]=getCameraParameters()

fileID = fopen('cameras.txt','r');

output=textscan(fileID,'%d %s %f %f %f %f %f %f','Delimiter',' ','CommentStyle','#');
fileID2 = fopen('images.txt','r');
img=textscan(fileID2,'%d %f %f %f %f %f %f %f %d %s %*[^\n]','Delimiter',' ','CommentStyle','#');
[m,n]=size(output{1});
cameraId=output{1};
%intrinsic_map=
intrinsic=zeros(3,3);
j=1;
for i=1:m
    intrinsic(1,1)=output{5}(i);
    intrinsic(2,2)=output{5}(i);
    intrinsic(1,3)=output{6}(i);
    intrinsic(2,3)=output{7}(i);
    intrinsic(1,2)=output{8}(i);
    intrinsic(3,3)=1;

    quat = [img{2}(j) img{3}(j) img{4}(j) img{5}(j)];
    trans=[img{6}(j);img{7}(j);img{8}(j)];
    rotm = quat2rotm(quat);
    rot(:,1:3)=rotm(:,1:3);
    rot(:,4)=trans;
    j=j+2;
end
return