function [L, numRegions] = findConnectedComponents(binaryImage)
    % binaryImage: 二值化图像，前景为1，背景为0
    % L: 联通区域标记矩阵
    % numRegions: 联通区域的数量

    % 获取图像尺寸
    [rows, cols] = size(binaryImage);
    
    % 初始化标记矩阵L，大小与原图一致
    L = zeros(rows, cols);
    
    % 初始化区域编号
    currentLabel = 0;
    
    % 方向向量，用于检查8邻域
    directions = [-1, 0; 1, 0; 0, -1; 0, 1; -1, -1; -1, 1; 1, -1; 1, 1];
    
    % 遍历图像中的每个像素点
    for i = 1:rows
        for j = 1:cols
            % 如果是前景点且未被标记过
            if binaryImage(i, j) == 1 && L(i, j) == 0
                % 增加区域编号
                currentLabel = currentLabel + 1;
                
                % 进行区域生长
                L = growRegion(binaryImage, L, i, j, currentLabel, directions);
            end
        end
    end
    
    % 返回区域数
    numRegions = currentLabel;
end

function L = growRegion(binaryImage, L, i, j, currentLabel, directions)
    % 初始化队列，并将种子点加入队列
    queue = [i, j];
    
    % 标记当前种子点
    L(i, j) = currentLabel;
    
    % 图像尺寸
    [rows, cols] = size(binaryImage);
    
    % 开始区域生长
    while ~isempty(queue)
        % 弹出队列的第一个点
        point = queue(1, :);
        queue(1, :) = []; % 更新队列
        
        % 获取当前点的坐标
        x = point(1);
        y = point(2);
        
        % 遍历8邻域
        for k = 1:size(directions, 1)
            % 计算邻居坐标
            nx = x + directions(k, 1);
            ny = y + directions(k, 2);
            
            % 检查邻居是否在图像范围内
            if nx > 0 && nx <= rows && ny > 0 && ny <= cols
                % 如果邻居是前景点且未被标记过
                if binaryImage(nx, ny) == 1 && L(nx, ny) == 0
                    % 标记该邻居点
                    L(nx, ny) = currentLabel;
                    
                    % 将该邻居点加入队列继续生长
                    queue = [queue; nx, ny];
                end
            end
        end
    end
end 