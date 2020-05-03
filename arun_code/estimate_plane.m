function [Theta] = estimate_plane(X)
    N = size(X,2);
    A = [transpose(X(1, :)) transpose(X(2, :)) transpose(X(3, :)) ones(N, 1)];
    [U S V] = svd(A);
    Theta = V(:, 4);
    
return;