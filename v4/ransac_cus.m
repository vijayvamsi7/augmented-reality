function [p_best,n_best,ro_best,error_best]= ransac_cus(points,no,iter,theshold,d)

%Initialize variables
iterations=0;
%Until iter iterations have occurred
while iterations < iter
    clear p_close dist p_new p_in p_out

    %Draw a sample of n points from the data
    perm=randperm(length(points));
    sample_in=perm(1:no);
    p_in=p(sample_in,:);
    sample_out=perm(no+1:end);
    p_out=p(sample_out,:);

    p_new = p_in;
    %Fit to that set of n points
    [n_est_in ro_est_in]=least_square_error(p_in);

    %For each data point oustide the sample
    for i=sample_out
        dist=dot(n_est_in,p(i,:))-ro_est_in;
        %Test distance d to theshold
        abs(dist);
        if abs(dist)<theshold
        %Refit the line using all these points
            [n_est_new, ro_est_new]=least_square_error(p_new);
            for iii=1:length(p_new)
                dist(iii)=dot(n_est_new,p_new(iii,:))-ro_est_new;
            end
            %Use the fitting error as error criterion (ive used SAD for ease)
            error(iterations+1)=sum(abs(dist));
        else
            error(iterations+1)=inf;
        end

        if iterations >1
            %Use the best fit from this collection
            if error(iterations+1) <= min(error)
                p_best=p_new;
                n_best=n_est_new;
                ro_best=ro_est_new;
                error_best=error(iterations+1);
            end
        end

        iterations=iterations+1;
    end
end

return