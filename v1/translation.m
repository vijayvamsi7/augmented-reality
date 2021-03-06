% custom_box = [2 2 0; 2 -2 0; -2 -2 0; -2 2 0; 2 2 4; 2 -2 4; -2 -2 4; -2 2 4];

%plot3(custom_box(:,1),custom_box(:,2),custom_box(:,3),'r.')
%norm_vector
function [custom_box_translated] = translation(R,d,c,custom_box)
%     R,d,c = rotmat(norm_vector,ro_best);

    custom_box_temp = zeros(length(custom_box),3);
    for i = 1:length(custom_box)
        custom_box_temp(i,:) = transpose(inv(R)*custom_box(i,:)');
    end
    
    translation_vector = [0 0 d/c]; 

    custom_box_translated = custom_box_temp + translation_vector;
end


