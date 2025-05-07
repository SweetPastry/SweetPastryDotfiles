% 生成数据
XY1 = randi([0, 100], 2, 100); % 100个矩形的左上角
XY2 = XY1 + randi([10, 50], 2, 100); % 100个矩形的右下角

% 前50个矩形
XY1_1 = XY1(:, 1:50); % 左上角
XY2_1 = XY2(:, 1:50); % 右下角

% 后50个矩形
XY1_2 = XY1(:, 51:100); % 左上角
XY2_2 = XY2(:, 51:100); % 右下角

% 计算前50个矩形和后50个矩形的面积
area1 = (XY2_1(1, :) - XY1_1(1, :)) .* (XY1_1(2, :) - XY2_1(2, :)); % 前50个矩形的面积
area2 = (XY2_2(1, :) - XY1_2(1, :)) .* (XY1_2(2, :) - XY2_2(2, :)); % 后50个矩形的面积

% 计算重叠区域
% 计算x方向重叠
x_overlap = max(0, min(XY2_1(1, :)', XY2_2(1, :)) - max(XY1_1(1, :)', XY1_2(1, :)));

% 计算y方向重叠
y_overlap = max(0, min(XY1_1(2, :)', XY1_2(2, :)) - max(XY2_1(2, :)', XY2_2(2, :)));

% 计算重叠面积
overlap_area = x_overlap .* y_overlap;

% 计算两个矩形的总面积（面积和 - 重叠面积）
total_area = area1' + area2 - overlap_area;

% 计算度量：重叠面积 / (面积和 - 重叠面积)
score = overlap_area ./ total_area;

% 找到有效的配对，度量值大于0
valid_pairs = score > 0;

% 找到有效配对的索引
[row_idx, col_idx] = find(valid_pairs);
matched_pairs = [row_idx, col_idx];


if isempty(matched_pairs)
    disp('没有找到有效的矩形配对');
else
    disp('配对的矩形索引 (前50组 和 后50组):');
    disp(matched_pairs);
end
