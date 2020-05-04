function [inlier_est ro_est ]=least_square_error(p)

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
ro_est=dot(inlier_est,pbar);

end
