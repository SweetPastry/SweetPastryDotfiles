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





% 结构体和元胞数组也是传值调用的
struct_x = struct("Name", "Alex", "Age", "17");
function func_demo2(arg)
    arg.Name = "Daming";
end
func_demo2(struct_x);
struct_x    % 没有修改 Alex 为 Daming





% 函数内部修改全局变量
counter = 0;
function f()
    global counter;
    counter = counter + 1;
end
f();
counter % counter=1