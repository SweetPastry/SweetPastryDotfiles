% MATLAB 默认是传值调用, 程序内部对形参的修改不会返回主程序
function func_demo(a)
    a = a+1;
    % 顺带一提, 在 MATLAB 中 a += 1 这种写法是不支持的, 也就是不支持增量赋值
end

a = 1;
func_demo(a);
a   % a=1





% 矩阵也是传值调用
A = eye(2, 2);
func_demo(A);
A   % A=eye(2, 2)





% 有一种比较巧妙的写法解决这个问题
function a = solution_demo(a)
    a = a + 1;
end
a_ = solution_demo(a);
A_ = solution_demo(A);
a_
A_





% 结构体和