XY1 = randi([0, 100], 2, 100); 
XY2 = XY1 + randi([10, 50], 2, 100); 


XY1_1 = XY1(:, 1:50); 
XY2_1 = XY2(:, 1:50); 

XY1_2 = XY1(:, 51:100); 
XY2_2 = XY2(:, 51:100); 


area1 = (XY2_1(1, :) - XY1_1(1, :)) .* (XY1_1(2, :) - XY2_1(2, :));
area2 = (XY2_2(1, :) - XY1_2(1, :)) .* (XY1_2(2, :) - XY2_2(2, :)); 
x_overlap = max(0, min(XY2_1(1, :)', XY2_2(1, :)) - max(XY1_1(1, :)', XY1_2(1, :)));


y_overlap = max(0, min(XY1_1(2, :)', XY1_2(2, :)) - max(XY2_1(2, :)', XY2_2(2, :)));


overlap_area = x_overlap .* y_overlap;

total_area = area1' + area2 - overlap_area;


score = overlap_area ./ total_area;

valid_pairs = score > 0;

[row_idx, col_idx] = find(valid_pairs);
matched_pairs = [row_idx, col_idx];


if isempty(matched_pairs)
    disp('没有找到有效的矩形配对');
else
    disp('配对的矩形索引 (前50组 和 后50组):');
    disp(matched_pairs);
end
