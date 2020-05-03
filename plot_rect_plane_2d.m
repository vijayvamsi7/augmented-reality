function plot_rect_plane_2d(p1, p2, p3, p4,c)

    % Create x, y, z variable with the corresponding indexes.
    x = [p1(1) p2(1) p3(1) p4(1)];
    y = [p1(2) p2(2) p3(2) p4(2)];
%     z = [p1(3) p2(3) p3(3) p4(3)];
    
    %Plot the 3d polygon and fill it with the X,Y,Z points defined with the specified color. 
    fill(x, y,c);
    
end