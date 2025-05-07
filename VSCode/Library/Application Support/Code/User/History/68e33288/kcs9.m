% global 会在函数 内部声明一个全局变量, 这样在函数外部也能被调用
function init()
    % 不能写成 global x = 10;
    global x;
    x = 10;
    x = x+1;
end

function check()
    % 这里也要写 global
    global x;
    disp(x);
end


init();
check();
checky();
% matlab 不能调用主程序内声明的变量, 和其他语言不同