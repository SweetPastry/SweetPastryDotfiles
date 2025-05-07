
clear

X=rand(3,100);

X=X./repmat(sqrt(sum(X.*X)),size(X,1),1);

Y=rand(3,1000);

Y=Y./repmat(sqrt(sum(Y.*Y)),size(Y,1),1);

A=X'*Y;

B=X'*X;

I=randi([1,100],1,10);

J=randi([1,1000],1,10);

index=sub2ind([100,1000],I,J);

C=A(index);

A(index)=nan;