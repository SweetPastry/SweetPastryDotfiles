function c = test(a, b)
    % nargin 用来判断用户输入了几个参数
    if (nargin==1)
        c = a^2;
    else
        c = a*b;
    end
end

disp(test(3));
disp(test(4, 2));
disp(nargin(@test));