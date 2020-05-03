% ptCloud = pcread('table.ply')
% data = ptCloud.Location;
data = matfile('in_points.mat').in_points;

% [p_best,n_best,ro_best,X_best,Y_best,Z_best,error_best]
[p_best,n_best,ro_best,X_best,Y_best,Z_best,error_best] = fit_plane_new(data, 1500, 10, 2, 70);

norm_vector = n_best;


figure(1);
pause(.5)
plot3(p_best(:,1),p_best(:,2),p_best(:,3),'ok')
hold on
plot3(yoyo11(:,1),yoyo11(:,2),yoyo11(:,3),'r.')
mesh(X_best,Y_best,Z_best);colormap([.8 .8 .8]);
beep;

fit_plane_new(data, 1500, 10, 2, 70)

% figure(2);plot3(ans(:,1),ans(:,2),ans(:,3))
% figure(3);pcshow(ptCloud);hold on;pcshow(ans);
% figure(4);pcshow(ans);

% samples_pick=[1:1:length(p_pick)];

%Remove just used points from points for next plane
% for ii=1:length(samples_used) %In lack for a better way to do it used a loop
% samples_pick=samples_pick(samples_pick~=samples_used(ii)); %remove first
% end

% p_pick=p_pick(samples_pick,:);

