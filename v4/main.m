clear; clc;
data = readPoints('points3D.txt')';
custom_box = [1 1 0; 1 -1 0; -1 -1 0; -1 1 0; 1 1 2; 1 -1 2; -1 -1 2; -1 1 2];

% Ransac routine
[p_best, n_best, ro_best, X_best, Y_best, Z_best, error_best] = ransac_cus(data, 400, 10, 2, 40);

% Get rotation matrix and translation created box
rot_mat = generate_rotation(n_best(1), n_best(2), n_best(3));
translated_custom_box = translation(custom_box, rot_mat, ro_best, n_best(3));

% Plot the box on the axis
%plot_3d_polygon(X_best, Y_best, Z_best, translated_custom_box);

for i = 1:5
    subplot(1,5,i),plot_and_project(i,translated_custom_box);
    hold on;
end

