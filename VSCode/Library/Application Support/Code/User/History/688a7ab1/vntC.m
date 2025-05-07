function [a, b] = muFunc(x, y)
    a = x + y;
    b = x - y;
end

disp(muFunc(1, 2))