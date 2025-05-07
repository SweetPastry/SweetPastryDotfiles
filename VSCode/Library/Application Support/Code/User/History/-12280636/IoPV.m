c=randi([40,60],1,2);

r=randi([20,30],1,1);

figure(1);

plot(c(1),c(2),'ko','MarkerSize',r);

axis off;

saveas(gcf,'o.jpg');

clear

img = imread('o.jpg');
figure(2);
imshow(img);
hold on;

% [x, y] = find(img==0);
% x_mean = mean(x)
% y_mean = mean(y)
% x_min = min(x)

% c = [x_mean, y_mean];
% r = x_mean - x_min;

threshold = 50;
[rows, cols] = find(gray_img < threshold);

x_center = mean(cols);
y_center = mean(rows);

distances = sqrt((cols - x_center).^2 + (rows - y_center).^2);
radius = mean(distances);

rectangle('Position', [c(1)-r, c(2)-r, 2*r, 2*r], 'EdgeColor', 'k', 'LineWidth', 2);
plot(c(1), c(2), 'ko', 'MarkerSize', 5, 'MarkerFaceColor', 'k');
hold off;