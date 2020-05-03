function [intrinsic_map_keys,intrinsic_map_values,extrinsic_map_values,extrinsic_map_keys,image_camera_map]=getCameraParameters()

    fileID = fopen('cameras.txt','r');

    output=textscan(fileID,'%d %s %f %f %f %f %f %f','Delimiter',' ','CommentStyle','#');
    fileID2 = fopen('images.txt','r');
    img=textscan(fileID2,'%d %f %f %f %f %f %f %f %d %s %*[^\n]','Delimiter',' ','CommentStyle','#');
    [m,n]=size(output{1});
    imgId=zeros(1,m);
    cameraId=zeros(1,m);
    intrinsic_map_values=zeros(3,3,m);
    intrinsic_map_keys=zeros(m,1);

    extrinsic_map_values=zeros(3,4,m);
    extrinsic_map_keys=zeros(m,1);


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
        intrinsic_map_values(:,:,i)=intrinsic;
        intrinsic_map_keys(i)=output{1}(i);

        quat = [img{2}(j) img{3}(j) img{4}(j) img{5}(j)];
        trans=[img{6}(j);img{7}(j);img{8}(j)];
        rotm = quat2rotm(quat);
        rot(:,1:3)=rotm(:,1:3);
        rot(:,4)=trans;
        extrinsic_map_values(:,:,i)=rot;
        extrinsic_map_keys(i)=img{9}(j);
        imgId(i)=img{1}(j);
        cameraId(i)=img{9}(j);
        j=j+2;

    end
    
%     intrinsic_map = containers.Map('KeyType','int8','ValueType','any');
%     for i = 1:size(intrinsic_map_keys,1)        
%         intrinsic_map(intrinsic_map_keys(i)) = intrinsic_map_values(:,:,i);
%     end
%     
%     extrinsic_map = containers.Map('KeyType','int8','ValueType','any');
%     for i = 1:size(extrinsic_map_keys,1)
%         extrinsic_map(extrinsic_map_keys(i)) = extrinsic_map_values(:,:,i);
%     end
%     
% %     intrinsic_map=containers.Map(intrinsic_map_keys,intrinsic_map_values);
% %     extrinsic_map=containers.Map(extrinsic_map_keys,extrinsic_map_values);


    
    image_camera_map=containers.Map(cameraId,imgId);


return