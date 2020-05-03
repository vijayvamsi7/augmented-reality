function rot_mat = generate_rotation(u, v, w)

    u1 = v/sqrt(u^2 + v^2 + w^2);
    u2 = -u/sqrt(u^2 + v^2 + w^2);
    ct = w/sqrt(u^2 + v^2 + w^2);
    st = sqrt(u^2 + v^2)/sqrt(u^2 + v^2 + w^2);

    R1 = ct + u1^2*(1-ct);
    R2 = u1*u2*(1-ct);
    R3 = u2*st;
    R4 = u1*u2*(1-ct);
    R5 = ct + u2^2*(1-ct);
    R6 = -u1*st;
    R7 = -u2*st;
    R8 = u1*st;
    R9 = ct;

    rot_mat = [R1 R2 R3; R4 R5 R6; R7 R8 R9];
end
