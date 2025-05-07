# 【MATLAB】【区域生长算法】 找到二值图像的所有联通区域

### 二值图像

二值图像是一种图像类型, 其中每个像素仅能取两个值, 通常是黑色和白色. 这种图像的主要特点是信息的简化, 常用于图像处理和计算机视觉中, 特别是在边缘检测、形状识别和物体分割等任务中. 二值化可以通过阈值处理将灰度图像转换为二值图像. 

### 连通区域

连通区域是指图像中相邻的像素集合, 这些像素在某种意义上是“连接”的. 在二值图像中, 连通区域通常指的是所有相连的白色像素或黑色像素. 连通区域可以分为两类：

1. **4-连通区域**：相邻像素仅在上下或左右方向相连. 
2. **8-连通区域**：相邻像素在上下、左右和对角线方向均相连. 

### 区域生长算法

区域生长算法是一种图像分割技术, 用于从种子点开始逐渐扩展区域. 算法步骤通常如下：

1. 选择一个或多个种子点. 
2. 检查种子点的邻域像素, 如果邻域像素满足特定条件（如灰度值相似）, 则将其加入到区域中. 
3. 重复这个过程, 直到没有更多的像素可以加入. 

### 算法的意义

区域生长算法在图像处理中的意义主要体现在以下几个方面：

1. **图像分割**：有效地将图像分割成有意义的区域, 便于后续处理和分析. 
2. **适应性强**：可以根据不同的图像特征（如颜色、纹理）进行调整, 适用于多种应用场景. 
3. **简单易懂**：算法原理简单, 容易实现, 特别适合初学者学习图像处理的基本概念. 

总之, 区域生长算法是一种重要的图像分割技术, 广泛应用于医学成像、物体识别和计算机视觉等领域. 



### 作业题目
> 双击im.mat文件装入数据并用imshow(im)显示，设计程序找到二值图像的各个连通区域、并将其所包含点的坐标保存到对应的元胞. 用ShowResult程序可视化结果.

```MATLAB
% findConnectedComponents.m 这个文件定义了算法函数

function [L, numRegions] = findConnectedComponents(im)
    [rows, cols] = size(im);
    L = zeros(rows, cols);
    numRegions = 0;
    directions = [
        -1,  0;
         0, -1;
         1,  0;
         0,  1;
        -1,  1;
        -1, -1;
         1, -1;
         1,  1
    ];

    for i=1:rows
        for j=1:cols
            % fprintf("(%d, %d) point\n", i, j);
            if im(i, j)==1 && L(i, j)==0
                numRegions = numRegions + 1;
                L = growRegion(im, L, i, j, numRegions, directions, rows, cols);
            end
        end
    end
end





function L = growRegion(im, L, i, j, numRegions, directions, rows, cols)
    stack = [i, j];
    L(i, j) = numRegions;
    
    while ~isempty(stack)
        consider_point = stack(1, :);
        stack(1, :) = [];

        for direction_idx = 1:size(directions, 1)
            neighbor_point = consider_point + directions(direction_idx, :);

            if neighbor_point(1)>0 && neighbor_point(1)<=rows && neighbor_point(2)>0 && neighbor_point(2)<=cols
                if im(neighbor_point(1), neighbor_point(2))==1 && L(neighbor_point(1), neighbor_point(2))==0
                    L(neighbor_point(1), neighbor_point(2)) = numRegions;
                    stack = [
                        stack;
                        neighbor_point(1), neighbor_point(2);
                    ];
                end
            end
        end
    end
end
```

```MATLAB
load im.mat;
imshow(im);

[L, numRegions] = findConnectedComponents(im);

uniqueValues = unique(L);
cellForShowResult = cell(length(unique(L)), 1);
for i = 1:length(uniqueValues)
    [row, col] = find(L==uniqueValues(i));
    cellForShowResult{i} = [row, col];
end

ShowResult(im, cellForShowResult(2:end));
disp(numRegions);
```

![alt text](image.png)