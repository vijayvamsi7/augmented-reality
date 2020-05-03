
points = readPoints('points3D.txt')';
%plot3(points(:,1),points(:,2),points(:,3),'.')
in_count = 0;
in_points = [];
stdd = Inf;
iter = 3000;
s = 7;
d = 4;

for i = 1:iter
   curr_points = points(randsample(size(points,1),s),:);
   plane = estimate_plane(curr_points)';
   
   
   distances = dist_to_plane(plane,points);
   ids = find(distances < d);
   if size(ids,1) > in_count
       
       in_count = size(ids,1)
       in_points = points(ids,:);
   elseif size(ids,1) == in_count && std(distances)<stdd
       stdd = std(distances);
       in_count = size(ids,1);
       in_points = points(ids,:);
   end
   l_in_points = [];
   
   
end


in_points

theta = estimate_plane(in_points)';

x=in_points(:,1);
y=in_points(:,2);
z=in_points(:,3);
DM = [x, y, ones(size(z))];                             % Design Matrix
B = DM\z;                                               % Estimate Parameters
[X,Y] = meshgrid(linspace(min(x),max(x),50), linspace(min(y),max(y),50));
Z = B(1)*X + B(2)*Y + B(3)*ones(size(X));
figure(1)
plot3(in_points(:,1),in_points(:,2),in_points(:,3),'.')
hold on
meshc(X, Y, Z)
hold off
grid on
xlabel('x(mm)'); ylabel('y(mm)'); zlabel('z(mm)');
title('Masked plot');
grid on
text(-20, 50, 450, sprintf('Z = %.3f\\cdotX %+.3f\\cdotY %+3.0f', B))


% [x y] = meshgrid(-10:1:10); % Generate x and y data
% z = -1/theta(3)*(theta(1)*x + theta(2)*y + theta(4)); % Solve for z data
% surf(x,y,z) %Plot the surface
hold on;
%points_=[in_points(1,:)' in_points(2,:)' in_points(3,:)']; % using the data given in the question
%fill3(points_(1,:),points_(2,:),points_(3,:),'r');
%hold on;
plot3(points(:,1),points(:,2),points(:,3),'.')
%plot3(in_points(:,1),in_points(:,2),in_points(:,3),'.')
grid on
alpha(0.3)

% WIDTH, HEIGHT, PARAMS[] focal length principal point at pixel location
%3024 4032 3082.77 1512 2016 0.0112756

%IMAGE_ID, QW, QX, QY, QZ, TX, TY, TZ, CAMERA_ID, NAME
save('in_points.mat','in_points')
    

