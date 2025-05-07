function [r1, r2] = test(x, y)
    r1 = x+y;
    r2 = x-y;
end

disp(test(1, 2));
[out1, out2]