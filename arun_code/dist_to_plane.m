function [d] = dist_to_plane(theta,points)
    for i = 1:size(points,1)
        dd = abs(dot(theta,[points(i,:) 1]));
        num = norm(theta(1:3));
        d(i,:) = dd/num;
    end
     
end
  
