a=randi([0,255],50,50,3);

b=ones(50,randi([1,15],1),3)*255;

c=ones(50,randi([1,15],1),3)*255;

d=cat(2,b,a,c);

for i = 1:length(50, )