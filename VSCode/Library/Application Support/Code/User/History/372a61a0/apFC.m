data1 = randi([1, 50], 2, 4)
data2 = ones(3, 4)

cat(1, data1, data2)

data3 = randi([51, 100], 2, 4)
min(data1(1,:)'-data2(1,:))