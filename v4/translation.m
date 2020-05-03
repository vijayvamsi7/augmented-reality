function custom_box_translated = translation(custom_box, rot_mat, x, y)
    custom_box_temp = zeros(length(custom_box),3);
    for i = 1:length(custom_box)
        custom_box_temp(i,:) = transpose(inv(rot_mat)*custom_box(i,:)');
    end
    div = x/y
    translation_vector = [0 0 div]; 
    custom_box_translated = custom_box_temp + translation_vector;
end


