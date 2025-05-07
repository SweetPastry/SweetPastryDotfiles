data = [randn(2, 5), randn(2, 3) + ones(2, 3) * 10]
plot(data(1, :), data(2, :), 'bo')

% 初始化类中心，随机选择两个点作为初始质心
centroids = data(:, randperm(size(data, 2), 2));

% 设置最大迭代次数和容忍度
max_iter = 100;
tol = 1e-4;

for iter = 1:max_iter
    % 计算每个数据点到两个类中心的欧式距离
    dist1 = sum((data - centroids(:, 1)) .^ 2, 1);
    dist2 = sum((data - centroids(:, 2)) .^ 2, 1);

    % 分配每个点到最近的类中心
    idx = dist1 < dist2; % 类1为true，类2为false

    % 计算新的类中心
    new_centroid1 = mean(data(:, idx), 2); % 类1的新中心
    new_centroid2 = mean(data(:, ~idx), 2); % 类2的新中心

    % 检查中心是否收敛（如果类中心的变化小于容忍度）
    if norm(new_centroid1 - centroids(:, 1)) < tol && norm(new_centroid2 - centroids(:, 2)) < tol
        break;
    end

    % 更新类中心
    centroids(:, 1) = new_centroid1;
    centroids(:, 2) = new_centroid2;
end

% 根据聚类结果绘制不同颜色的点
plot(data(1, idx), data(2, idx), 'ro', 'DisplayName', '类1');
plot(data(1, ~idx), data(2, ~idx), 'go', 'DisplayName', '类2');

% 绘制类中心
plot(centroids(1, :), centroids(2, :), 'kx', 'MarkerSize', 12, 'LineWidth', 3, 'DisplayName', '类中心');

legend('show');
title('手动实现 K-Means 聚类结果');
hold off;
