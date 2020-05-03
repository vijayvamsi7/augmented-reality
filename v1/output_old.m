% [A, R_t]=parameters('frame28.jpg');

[ik,iv,ek,ev,ic_map]=getCameraParameters();
A = [iv(:,:,2) zeros(3,1)];
R_t = [ev(:,:,2); [0 0 0 1]];

yoyo11 = translated_custom_box;

yy = zeros(length(yoyo11),1) + 1;
yoyo11_new = [yoyo11 yy];

u = zeros(length(yoyo11),3);

for i = 1:length(yoyo11)
    u(i,:) =  A*R_t*yoyo11_new(i,:)';
    u(i,1) =  u(i,1)/ u(i,3);
    u(i,2) =  u(i,2)/ u(i,3);
end

tt = imread('C:\Users\arunt\Documents\cv\sfm\boxes\box (2).jpg');


u = u(:,1:2);
figure(1)
imshow(tt)
hold on
% sz = 4;
% scatter(u(:,1),u(:,2),sz,'d');
%plot(u(:,1), u(:,2), 'ro', 'MarkerSize', 3);
 
plot_rect_plane_2d(u(1,:),u(2,:),u(3,:),u(4,:),'r')
plot_rect_plane_2d(u(5,:),u(6,:),u(7,:),u(8,:),'r')
plot_rect_plane_2d(u(1,:),u(2,:),u(6,:),u(5,:),'k')
plot_rect_plane_2d(u(2,:),u(3,:),u(7,:),u(6,:),'c')
plot_rect_plane_2d(u(3,:),u(4,:),u(8,:),u(7,:),'k')
plot_rect_plane_2d(u(4,:),u(1,:),u(5,:),u(8,:),'c')
saveas(1,'finename1.jpg')