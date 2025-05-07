
a = randi([0, 255], 50, 50, 3);
b = ones(50, randi([1, 15], 1), 3) * 255;
c = ones(50, randi([1, 15], 1), 3) * 255;
d = cat(2, b, a, c);

% 删除满足条件的一列在所有页面的值均为255，则删除该列
cols_to_remove = [];

for i = 1:size(d, 2)

    if all(d(:, i, :) == 255, 'all')
        cols_to_remove = [cols_to_remove i];
    end

end

% 删除列
d(:, cols_to_remove, :) = [];

% 检查 d 和 a 是否相同
is_equal = isequal(d, a);

% 输出结果
if is_equal
    disp('矩阵 d 与矩阵 a 完全相同');
else
    disp('矩阵 d 与矩阵 a 不相同');
end
