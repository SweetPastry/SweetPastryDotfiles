function init()
    persistent x;
    if isempty(x)
        x = 1;
    else
        x = x+1;
    end
end

function check()
    disp()