%custom_box_translated = [2 2 0; 2 -2 0; -2 -2 0; -2 2 0; 2 2 4; 2 -2 4; -2 -2 4; -2 2 4];
function plot_3d_polygon(X_best,Y_best,Z_best,custom_box_translated)
    mesh(X_best,Y_best,Z_best);colormap([0.5 0.5 0.5]);
    hold on
    plot_rect_plane(custom_box_translated(1,:),custom_box_translated(2,:),custom_box_translated(3,:),custom_box_translated(4,:))
    hold on;
    plot_rect_plane(custom_box_translated(5,:),custom_box_translated(6,:),custom_box_translated(7,:),custom_box_translated(8,:))
    hold on;
    plot_rect_plane(custom_box_translated(1,:),custom_box_translated(2,:),custom_box_translated(6,:),custom_box_translated(5,:))
    hold on;
    plot_rect_plane(custom_box_translated(2,:),custom_box_translated(3,:),custom_box_translated(7,:),custom_box_translated(6,:))
    hold on;
    plot_rect_plane(custom_box_translated(3,:),custom_box_translated(4,:),custom_box_translated(8,:),custom_box_translated(7,:))
    hold on;
    plot_rect_plane(custom_box_translated(4,:),custom_box_translated(1,:),custom_box_translated(5,:),custom_box_translated(8,:))
    hold on;

    xlabel('X') 
    ylabel('Y')
    zlabel('Z')
end