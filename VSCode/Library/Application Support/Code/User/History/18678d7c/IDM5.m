function init()
    persistent x;
    if isempty(x)
        x = 1;
    else
        x = x+1;
    end
    disp(x);
end

init()
init()
init()