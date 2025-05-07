clear;
randPoints = rand(10, 2);
save("randPoints.txt", "randPoints", "-ascii")
clear;
data = importdata("randPoints.txt");
x_list = [];
y_list = [];
for point_idx = 1:10
    points(point_idx).x = data(point_idx, 1);
    points(point_idx).y = data(point_idx, 2);
    x_list = [x_list, points(point_idx).x];
    y_list = [y_list, points(point_idx).y];
end
x_min = min(x_list);
x_max = max(x_list);
y_min = min(y_list);
y_max = max(y_list);
[boardPoints_x, boardPoints_y] = meshgrid([x_min, x_max], [y_min, y_max]);
scatter(x_list, y_list)
hold on
box on
K = convhull(data(:, 1), data(:, 2));
plot(data(K, 1), data(K, 2), '-o')