% [A, R_t]=parameters('frame28.jpg');

function plot_and_project(imageID,translated_custom_box)
[ik,iv,ek,ev,ic_map]=getCameraParameters();
img_id = imageID;
% for i = 1:5
%     subplot(1,5,i),plot_and_project(i,translated_custom_box);
%     hold on;
% end

plane_ids = [1 2 3 4;
    5 6 7 8;
    1 2 6 5;
    4 1 5 8;
    3 4 8 7;
    2 3 7 6
    ];



c1_id = ic_map(img_id);
%c2_id = ic_map(2)

iv_id = find(ik==c1_id);
ev_id = find(ek==c1_id);

A = [iv(:,:,iv_id) zeros(3,1)];
R_t = [ev(:,:,ev_id); [0 0 0 1]];

% A = [iv(:,:,2) zeros(3,1)];
% R_t = [ev(:,:,2); [0 0 0 1]];

yoyo11 = translated_custom_box;
yy = zeros(length(yoyo11),1) + 1;
yoyo11_new = [yoyo11 yy];

u = zeros(length(yoyo11),3);
temp = (R_t*yoyo11_new');
for i = 1:length(yoyo11)
    u(i,:) =  A*R_t*yoyo11_new(i,:)';
    u(i,1) =  u(i,1)/ u(i,3);
    u(i,2) =  u(i,2)/ u(i,3);
end

tt = imread(strcat('C:\Users\arunt\Documents\cv\sfm\table\',int2str(c1_id),'table.jpeg'));


u = u(:,1:2);
figure(1)
imshow(tt)
hold on
% sz = 4;
% scatter(u(:,1),u(:,2),sz,'d');
%plot(u(:,1), u(:,2), 'ro', 'MarkerSize', 3);

plot_rect_plane_2d(u(1,:),u(2,:),u(3,:),u(4,:),'y')
plot_rect_plane_2d(u(5,:),u(6,:),u(7,:),u(8,:),'m')
plot_rect_plane_2d(u(1,:),u(2,:),u(6,:),u(5,:),'c')
plot_rect_plane_2d(u(4,:),u(1,:),u(5,:),u(8,:),'b')
plot_rect_plane_2d(u(3,:),u(4,:),u(8,:),u(7,:),'g')
plot_rect_plane_2d(u(2,:),u(3,:),u(7,:),u(6,:),'r')

saveas(1,'finename1.jpg')
end