function c = test(a, b)
    if (nargin==1)
        c = a^2;
    else
        c = a*b;
    end
end

test(3)
test(4, 2)