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

