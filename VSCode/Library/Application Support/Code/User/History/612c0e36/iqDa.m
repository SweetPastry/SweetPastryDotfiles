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