clear
% 生成数据
X = rand(3,100);
X = X./repmat(sqrt(sum(X.*X)),size(X,1),1);

Y = rand(3,1000);
Y = Y./repmat(sqrt(sum(Y.*Y)),size(Y,1),1);

A = X'*Y;    % 用户偏好矩阵：100x1000
B = X'*X;    % 用户相似度矩阵：100x100

% 人为制造缺失值
I = randi([1,100],1,10);
J = randi([1,1000],1,10);
index = sub2ind([100,1000],I,J);
C = A(index);
A(index) = nan; % 将A中某些位置置为缺失


% --------- 利用B和A的已知值估计A的缺失值 ----------

[num_users, num_items] = size(A);

% 创建一个A的副本，用于填充缺失值
A_est = A;

for idx = 1:length(index)
    i = I(idx); % 缺失项的用户ID
    j = J(idx); % 缺失项的商品ID
    
    % 找出对商品j有评分的其他用户集合U
    known_users = find(~isnan(A(:, j)));
    known_users(known_users == i) = []; % 去除用户i自身
    
    if isempty(known_users)
        % 若没有任何用户对该商品有评分，则用全局平均值或0填充
        A_est(i,j) = nanmean(A(:));
        continue;
    end
    
    % 从B中取出用户i与已知用户的相似度
    sim_vec = B(i, known_users);
    
    % 已知评分
    rating_vec = A(known_users, j);
    
    % 对评分进行加权平均
    weight_sum = sum(sim_vec);
    if weight_sum == 0
        % 若相似度总和为0，则用全局平均值（或其他策略）填充
        A_est(i,j) = nanmean(A(:));
    else
        A_est(i,j) = sum(sim_vec .* rating_vec) / weight_sum;
    end
end

% 此时，A_est中已填充了先前的缺失值
% 可以检查填充精度（比如MSE）：
diff = A_est(index) - C;
mse = mean(diff.^2);
fprintf('填充缺失值后的MSE: %.4f\n', mse);