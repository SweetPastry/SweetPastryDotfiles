data = [randn(2, 5), randn(2, 3) + ones(2, 3) * 10]
plot(data(1, :), data(2, :), 'bo')

distances = zeros(8, 8);

for i = 1:8

    for j = i + 1:8
        distances(i, j) = sqrt(sum((data(:, i) - data(:, j)) .^ 2));
    end

end

% 找到距离最远的两个点
[max_distance, linear_idx] = max(distances(:));
[row_idx, col_idx] = ind2sub(size(distances), linear_idx);

% 根据X坐标对点进行分类
for i = 1:size(data, 2)

    if data(1, i) < mean(data(1, :)) % 如果x坐标小于所有点x坐标的平均值，归入class1
        class1 = [class1, i]; % 将索引添加到class1
    else % 否则归入class2
        class2 = [class2, i]; % 将索引添加到class2
    end

end

% 输出分类结果
disp('class1中的点的索引是:');
disp(class1);

disp('class2中的点的索引是:');
disp(class2);

% 可视化分类结果
plot(data(1, class1), data(2, class1), 'ro', 'DisplayName', 'class1');
plot(data(1, class2), data(2, class2), 'go', 'DisplayName', 'class2');
legend('show');
hold off;
