c=randi([40,60],1,2);

r=randi([20,30],1,1);

figure(1);

plot(c(1),c(2),'ko','MarkerSize',r);

axis off;

saveas(gcf,'o.jpg');

clear

img = imread('o.jpg');
gray_img = rgb2gray(img);


threshold = 50;
[rows, cols] = find(gray_img < threshold);

x_center = mean(cols);
y_center = mean(rows);

distances = sqrt((cols - x_center).^2 + (rows - y_center).^2);
radius = mean(distances); 

figure(2);
imshow(img);
hold on;
rectangle('Position', [x_center-radius, y_center-radius, 2*radius, 2*radius], ...
          'EdgeColor', 'k', 'LineWidth', 2);
plot(x_center, y_center, 'ko', 'MarkerSize', 5, 'MarkerFaceColor', 'k');
hold off;