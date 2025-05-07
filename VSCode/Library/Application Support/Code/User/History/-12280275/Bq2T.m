
clear

X=rand(3,100);

X=X./repmat(sqrt(sum(X.*X)),size(X,1),1);

Y=rand(3,1000);

Y=Y./repmat(sqrt(sum(Y.*Y)),size(Y,1),1);

A=X'*Y;

B=X'*X;

I=randi([1,100],1,10);

J=randi([1,1000],1,10);

index=sub2ind([100,1000],I,J);

C=A(index);

A(index)=nan;


A_filled = A;
nan_pos = isnan(A);
A_filled(nan_pos) = 0;

max_iter = 100;
tolerance = 1e-5; 

for iter = 1:max_iter
    A_prev = A_filled;
    
    for i = 1:100
        for j = 1:1000
            if nan_pos(i, j)
                weights = B(i, :);
                weights(i) = 0;
                
                valid = ~nan_pos(:, j);
                valid_weights = weights(valid);
                valid_ratings = A_filled(valid, j);
                
                numerator = sum(valid_weights .* valid_ratings);
                denominator = sum(valid_weights) + eps;
                A_filled(i, j) = numerator / denominator;
            end
        end
    end
    
    if max(abs(A_filled(:) - A_prev(:))) < tolerance
        disp(['Converged in ', num2str(iter), ' iterations.']);
        break;
    end
end

disp(A_filled(index));