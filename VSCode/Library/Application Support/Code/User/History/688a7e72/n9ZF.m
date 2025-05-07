data = [randn(2, 5), randn(2, 3) + ones(2, 3) * 10]
plot(data(1, :), data(2, :), 'bo')

class1 = []
class2 = []

for i = 1:8
    for j = i + 1:8
        distances(i, j) = sqrt(sum((data(:, i) - data(:, j)) .^ 2));
    end

    end

    [max_distance, linear_idx] = max(distances(:));

    [row_idx, col_idx] = ind2sub(size(distances), linear_idx);

    disp(['欧式距离最远的两个点是第 ', num2str(row_idx), ' 和第 ', num2str(col_idx), ' 个点']);
    disp(['最大欧式距离为: ', num2str(max_distance)]);
