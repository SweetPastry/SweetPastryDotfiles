data = [randn(2, 5), randn(2, 3) + ones(2, 3) * 10]
plot(data(1, :), data(2, :), 'bo')


centroids = data(:, randperm(size(data, 2), 2));


max_iter = 100;
tol = 1e-4;

for iter = 1:max_iter
    
    dist1 = sum((data - centroids(:, 1)) .^ 2, 1);
    dist2 = sum((data - centroids(:, 2)) .^ 2, 1);

    
    idx = dist1 < dist2; 

    
    new_centroid1 = mean(data(:, idx), 2); 
    new_centroid2 = mean(data(:, ~idx), 2); 

    
    if norm(new_centroid1 - centroids(:, 1)) < tol && norm(new_centroid2 - centroids(:, 2)) < tol
        break;
    end

    
    centroids(:, 1) = new_centroid1;
    centroids(:, 2) = new_centroid2;
end


plot(data(1, idx), data(2, idx), 'ro', 'DisplayName', '类1');
plot(data(1, ~idx), data(2, ~idx), 'go', 'DisplayName', '类2');


plot(centroids(1, :), centroids(2, :), 'kx', 'MarkerSize', 12, 'LineWidth', 3, 'DisplayName', '类中心');

legend('show');
title('手动实现 K-Means 聚类结果');
hold off;
