function [R,d,c] = rotmat(norm_vector,ro_best)
    
    a = norm_vector(1);
    b = norm_vector(2);
    c = norm_vector(3);
    d = ro_best;

    %TRANSLATE TO Z-d/c 

    sq = sqrt(a^2 + b^2 + c^2);

    ct = c/sq;
    st = sqrt(a^2 + b^2)/sq;
    u1 = b/sq;
    u2 = -a/sq;


    R1 = ct + u1^2*(1-ct);
    R2 = u1*u2*(1-ct);
    R3 = u2*st;
    R4 = u1*u2*(1-ct);
    R5 = ct + u2^2*(1-ct);
    R6 = -u1*st;
    R7 = -u2*st;
    R8 = u1*st;
    R9 = ct;

    R = [R1 R2 R3; R4 R5 R6; R7 R8 R9];

end
