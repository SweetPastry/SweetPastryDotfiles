% global 会在函数 内部声明一个全局变量, 这样在函数外部也能被调用
function init()
    % global x = 10;
    x = x+1;
end

function check()
    disp(x);
end

init();
check();
init();
check();