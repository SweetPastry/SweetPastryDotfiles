p=randi([1,10],4,1)
y1=polyval(p,1:100)
k=rand(1)*10000
y2=k*(0:99)+y1(end)
y=[y1,y2]
% plot(y)
k=(y(2)-y(1)(end))/(0:99)