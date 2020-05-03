yoyo = [2 2 0; 2 -2 0; -2 -2 0; -2 2 0; 2 2 4; 2 -2 4; -2 -2 4; -2 2 4];

%plot3(yoyo(:,1),yoyo(:,2),yoyo(:,3),'r.')
%norm_vector
R,d,c = rotmat(norm_vector,ro_best);

matter = inv(R);

yoyo1 = zeros(length(yoyo),3);
for i = 1:length(yoyo)
    tita = matter*yoyo(i,:)';
    yoyo1(i,:) = tita';
end

% for i = 1:length(yoyo)
%     tita = R*yoyo1(i,:)';
%     yoyo(i,:) = tita'
% end



trnsz = [0 0 d/c(3,3)];

yoyo11 = yoyo1 + trnsz;


