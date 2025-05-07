function [r1, r2] = test(x, y)
    r1 = x+y;
    r2 = x-y;
end

disp(test(1, 2));   % 只打印 r1
[out1, out2] = test(2, 3);
disp(out2)


disp("-----美丽的分界线-----");


function [r1, r2] = test2(x, y)
    if (nargout==1)
        r1 = x*y;
    else
        r1 = x+y;
        r2 = x-y;
    end
end

disp(test2(3, 4));
[out1, out2] = test2(5, 6);
disp(out2);