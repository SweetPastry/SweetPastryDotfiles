clear
X = rand(3,100);
X = X./repmat(sqrt(sum(X.*X)),size(X,1),1);

Y = rand(3,1000);
Y = Y./repmat(sqrt(sum(Y.*Y)),size(Y,1),1);

A = X'*Y;
B = X'*X;

I = randi([1,100],1,10);
J = randi([1,1000],1,10);
index = sub2ind([100,1000],I,J);
C = A(index);


% index
A(index)



A(index) = nan;

[num_users, num_items] = size(A);
A_est = A;

for idx = 1:length(index)
    i = I(idx);
    j = J(idx);

    known_users = find(~isnan(A(:, j)));
    known_users(known_users == i) = [];
    
    if isempty(known_users)
        A_est(i,j) = nanmean(A(:));
        continue;
    end
    
    sim_vec = B(i, known_users);
    rating_vec = A(known_users, j)';

    weight_sum = sum(sim_vec);
    if weight_sum == 0
        A_est(i,j) = nanmean(A(:));
    else
        A_est(i,j) = sum(sim_vec .* rating_vec) / weight_sum;
    end
end



A_est(index)