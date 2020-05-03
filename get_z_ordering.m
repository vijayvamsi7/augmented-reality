function [z_ordered, z_indices] = get_z_ordering(planes,rt_mat)
    temp = zeros(6,1);
    for i = 1:6
        
        curr_plane = rt_mat(planes(i,:),1:3);
        curr_z = mean(curr_plane);
        temp(i,1) = curr_z(3);
      
    end
    temp
    [a,b] = sort(temp)
    z_ordered = planes(b,:);
    z_indices = b;
end
