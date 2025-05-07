A = randi([1,100],2,10)
R = rand(2)
t = rand(2,1)
B = R*A+t*ones(1,10)

AA = A(:,1:5)-A(:,6:10)
BB = B(:,1:5)-B(:,6:10)

RR = BB/AA
tt = B-RR*A