function [inlier_est, ro_est,X,Y,Z ]=least_square_error(p)

pavg=mean(p);

for i=1:length(p)
    A(:,:,i)=(p(i,:)-pavg)'*(p(i,:)-pavg);
end

%Sum up all entries in A and find an eigen vector
Asum=sum(A,3);
[V, ~]=eig(Asum);

%Calculate new normal vector
inlier_est=V(:,1);

%Calculate new ro
ro_est=dot(inlier_est,pavg);

[X,Y]=meshgrid(min(p(:,1)):max(p(:,1)),min(p(:,2)):max(p(:,2)));
Z=(ro_est-inlier_est(1)*X-inlier_est(2).*Y)/inlier_est(3);
end
