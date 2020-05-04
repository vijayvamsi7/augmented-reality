function [best_inliers,best_nor_vec,best_ro,best_error]= ransac_cus(points,no,iterations,theshold,d)

%Initialize variables
iter=0;
%Until iter iterations have occurred
while iter < iterations

    %Find random n points from data. In our case, we are taking
    %n as 3.
    perm=randperm(length(points));
    sample_in=perm(1:no);
    p_in=p(sample_in,:);
    remaining_data=perm(no+1:end);
    p_out=p(sample_out,:);

    new_inlier = p_in;
    %Fitting these 3 points to form a plane using least square error
    [n_est_in ro_est_in]=least_square_error(p_in);

    %For each data point oustide the sample
    for i=remaining_data
        %calculatying the distance
        dist=dot(n_est_in,p(i,:))-ro_est_in;
        %comparing the distance to threhold.
        if abs(dist)<theshold
            %finding all the points within that plane.
            [inlier_new_est, ro_est_new]=least_square_error(new_inlier);
            for iii=1:length(new_inlier)
                dist(iii)=dot(inlier_new_est,new_inlier(iii,:))-ro_est_new;
            end
            %Use the fitting error as error criterion (we ve used SAD)
            error(iter+1)=sum(abs(dist));
        else
            error(iter+1)=inf;
        end
        
        
        if iter >1
            %updating the inliers
            if error(iter+1) <= min(error)
                best_inliers=new_inlier;
                best_nor_vec=inlier_new_est;
                best_ro=ro_est_new;
                best_error=error(iter+1);
            end
        end

        iter=iter+1;
    end
end

return