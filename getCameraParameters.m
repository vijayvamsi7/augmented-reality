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

function [intrinsic,extrinsic]=getCameraParameters()

fileID = fopen('cameras.txt','r');

output=textscan(fileID,'%d %s %f %f %f %f %f %f','Delimiter',' ','CommentStyle','#');

intrinsic=zeros(3,3);
intrinsic(1,1)=output{5}(1);
intrinsic(2,2)=output{5}(1);
intrinsic(1,3)=output{6}(1);
intrinsic(2,3)=output{7}(1);
intrinsic(1,2)=output{8}(1);
intrinsic(3,3)=1;


return