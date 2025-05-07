
function c = test(a, b)
    % nargin 用来判断用户输入了几个参数
    if (nargin==1)
        c = a^2;
    else
        c = a*b;
    end
end

test(3)
test(4, 2)