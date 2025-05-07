data = [randn(2, 5), randn(2, 3) + ones(2, 3) * 10]
plot(data(1, :), data(2, :), 'bo')

[idx, centroids] = kmeans(data', 2);

plot(data(1, idx == 1), data(2, idx == 1), 'ro', 'DisplayName', '类1');
plot(data(1, idx == 2), data(2, idx == 2), 'go', 'DisplayName', '类2');


plot(centroids(:, 1), centroids(:, 2), 'kx', 'MarkerSize', 12, 'LineWidth', 3, 'DisplayName', '类中心');

legend('show');
title('K-Means 聚类结果');
hold off;
