function [r1, r2] = test(x, y)
    r1 = x;
    r2 = x-y;
end

[out1, out2] = test(1, 2);