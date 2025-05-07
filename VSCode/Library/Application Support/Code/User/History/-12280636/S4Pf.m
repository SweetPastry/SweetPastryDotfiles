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

r = randi([20, 30], 1, 1);
rectangle('Position', [c(1)-r, c(2)-r, 2*r, 2*r], 'EdgeColor', 'k', 'LineWidth', 2);
plot(c(1), c(2), 'ko', 'MarkerSize', 5, 'MarkerFaceColor', 'k');
hold off;