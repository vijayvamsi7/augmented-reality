function plot_and_project(img_id,translated_custom_box)
[ik,iv,ek,ev,ic_map]=getCameraParameters();

plane_ids = [1 2 3 4;
    5 6 7 8;
    1 2 6 5;
    4 1 5 8;
    3 4 8 7;
    2 3 7 6
    ];

c1_id = ic_map(img_id);

iv_id = find(ik==c1_id);
ev_id = find(ek==c1_id);

A = [iv(:,:,iv_id) zeros(3,1)];
R_t = [ev(:,:,ev_id); [0 0 0 1]];

trans_box_tmp = zeros(length(translated_custom_box),1) + 1;
translated_custom_box_new = [translated_custom_box trans_box_tmp];

proj_pixel_cord = zeros(length(translated_custom_box),3);

temp = (R_t*translated_custom_box_new')';
[zz, zi] = get_z_ordering(plane_ids, temp);

for i = 1:length(translated_custom_box)
    proj_pixel_cord(i,:) =  A*R_t*translated_custom_box_new(i,:)';
    proj_pixel_cord(i,1) =  proj_pixel_cord(i,1)/ proj_pixel_cord(i,3);
    proj_pixel_cord(i,2) =  proj_pixel_cord(i,2)/ proj_pixel_cord(i,3);
end
proj_pixel_cord = proj_pixel_cord(:,1:2);

tt = imread(strcat('./original_images/ori_img',int2str(c1_id),'.jpeg'));

figure(1)
imshow(tt)
hold on

colors = ['y' 'm' 'c' 'b' 'g' 'r'];
plot_rect_plane_2d(proj_pixel_cord(zz(6,1),:),proj_pixel_cord(zz(6,2),:),proj_pixel_cord(zz(6,3),:),proj_pixel_cord(zz(6,4),:),colors(zi(6)))
plot_rect_plane_2d(proj_pixel_cord(zz(5,1),:),proj_pixel_cord(zz(5,2),:),proj_pixel_cord(zz(5,3),:),proj_pixel_cord(zz(5,4),:),colors(zi(5)))
plot_rect_plane_2d(proj_pixel_cord(zz(4,1),:),proj_pixel_cord(zz(4,2),:),proj_pixel_cord(zz(4,3),:),proj_pixel_cord(zz(4,4),:),colors(zi(4)))
plot_rect_plane_2d(proj_pixel_cord(zz(3,1),:),proj_pixel_cord(zz(3,2),:),proj_pixel_cord(zz(3,3),:),proj_pixel_cord(zz(3,4),:),colors(zi(3)))
plot_rect_plane_2d(proj_pixel_cord(zz(2,1),:),proj_pixel_cord(zz(2,2),:),proj_pixel_cord(zz(2,3),:),proj_pixel_cord(zz(2,4),:),colors(zi(2)))
plot_rect_plane_2d(proj_pixel_cord(zz(1,1),:),proj_pixel_cord(zz(1,2),:),proj_pixel_cord(zz(1,3),:),proj_pixel_cord(zz(1,4),:),colors(zi(1)))

saveas(1,'finename1.jpg')
end