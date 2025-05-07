clear;
randPoints = rand(10, 2);
save("randPoints.txt", "randPoints", "-ascii")
clear;
data = importdata("randPoints.txt")
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
[boardPoints_x, boardPoints_y] = meshgrid([x_min, x_max], [y_min, y_max])
scatter(x_list, y_list)
hold on
box on
plot([
        boardPoints_x(1, 1), boardPoints_x(1, 2), boardPoints_x(2, 2), boardPoints_x(2, 1), boardPoints_x(1, 1)
    ], [
        boardPoints_y(1, 1), boardPoints_y(1, 2), boardPoints_y(2, 2), boardPoints_y(2, 1), boardPoints_y(1, 1)
], '-o')