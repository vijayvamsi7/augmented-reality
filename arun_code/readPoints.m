function [points]=readPoints(filename)
    fileID = fopen(filename,'r');

    output=textscan(fileID,'%f %f %f %f %*[^\n]','Delimiter',' ','CommentStyle','#');

    points(1,:)=output{2};
    points(2,:)=output{3};
    points(3,:)=output{4};
    fclose(fileID);
return