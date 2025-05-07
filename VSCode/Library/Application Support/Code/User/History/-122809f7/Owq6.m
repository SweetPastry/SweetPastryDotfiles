x=linspace(0,1,1000); 
p=rand(4,1)
y=exp(polyval(p,x));

z = log(y);

p_pre = polyfit(x, z, 4);
p_ppre = p_pre(2:end)