function [r1, r2] = test(x, y)
    r1 = x+y;
    r2 = x-y;
end

disp(test(1, 2));   % 只打印 r1
[out1, out2] = test(2, 3);
disp(out2)

function [r1, r2] = test2(x, y)
    if (nargout==1)
        r1 = x*y;
    else