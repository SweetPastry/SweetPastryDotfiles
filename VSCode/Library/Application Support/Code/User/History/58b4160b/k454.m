% 在其他 .m 文件中定义的同名函数可以被同一个目录下的其他函数调用
function result = func_demo(input)
    disp(inputd);
    inner_func();
end


% 定义函数的文件内部再调用
function inner_func()
    disp("Here is inner!");
end