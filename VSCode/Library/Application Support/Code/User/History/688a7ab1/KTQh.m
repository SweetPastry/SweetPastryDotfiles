a = randi([0, 255], 50, 50, 3);
b = ones(50, randi([1, 15], 1), 3) * 255;
c = ones(50, randi([1, 15], 1), 3) * 255;
d = cat(2, b, a, c);

cols_to_remove = [];

for i = 1:size(d, 2)

    if all(d(:, i, :) == 255, 'all')
        cols_to_remove = [cols_to_remove i];
    end

end

d(:, cols_to_remove, :) = [];

is_equal = isequal(d, a);

if is_equal
    disp('矩阵 d 与矩阵 a 完全相同');
else
    disp('矩阵 d 与矩阵 a 不相同');
end
