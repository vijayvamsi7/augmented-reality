clear; clc;
data = readPoints('points3D.txt')';
custom_box = [1 1 0; 1 -1 0; -1 -1 0; -1 1 0; 1 1 2; 1 -1 2; -1 -1 2; -1 1 2];

% Ransac routine
[p_best, n_best, ro_best, X_best, Y_best, Z_best, error_best] = ransac_cus(data, 300, 10, 2, 40);

% Get rotation matrix and translation created box
rot_mat = rotmat(n_best(1), n_best(2), n_best(3));
translated_custom_box = translation(custom_box, rot_mat, ro_best, n_best(3));

% Plot the box on the axis
plot_3d_polygon(X_best, Y_best, Z_best, translated_custom_box);


%plot_3d_polygon(xbest,ybest,zbest,trans_box)


% figure(1);
% pause(.5)
% plot3(p_best(:,1),p_best(:,2),p_best(:,3),'ok')
% hold on
% plot3(yoyo11(:,1),yoyo11(:,2),yoyo11(:,3),'r.')
% mesh(X_best,Y_best,Z_best);colormap([.8 .8 .8]);
% beep;
% 
% ransac_cus(data, 300, 10, 2, 40)

% figure(2);plot3(ans(:,1),ans(:,2),ans(:,3))
% figure(3);pcshow(ptCloud);hold on;pcshow(ans);
% figure(4);pcshow(ans);

% samples_pick=[1:1:length(p_pick)];

%Remove just used points from points for next plane
% for ii=1:length(samples_used) %In lack for a better way to do it used a loop
% samples_pick=samples_pick(samples_pick~=samples_used(ii)); %remove first
% end

% p_pick=p_pick(samples_pick,:);

