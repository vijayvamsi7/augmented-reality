function [n_est ro_est ]=least_square_error(p)

pbar=mean(p);

for i=1:length(p)
A(:,:,i)=(p(i,:)-pbar)'*(p(i,:)-pbar);
end

%Sum up all entries in A
Asum=sum(A,3);
[V, ~]=eig(Asum);

%Calculate new normal vector
n_est=V(:,1);

%Calculate new ro
ro_est=dot(n_est,pbar);

end
