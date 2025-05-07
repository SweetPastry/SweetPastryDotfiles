% 直接运行脚本, MATLAB 会执行第一个函数

function createGUI()
    % Position 关键词, 接受如下数组参数
    % [left, bottom, width, height]
    % left, bottom 是窗口在屏幕中的位置
    % width 和 height 是窗口的大小

    width = 300;
    height = 200;

    % 如何把窗口正好放在屏幕中心
    % value = get(object_handle, 'PropertyName')
    % 0（Root Handle, 在 MATLAB 中，数字 0 用作图形对象的根句柄，也称为 Root Handle. 这是一个特殊的句柄，代表 MATLAB 的图形环境本身，而不是单个图形元素或界面组件。通过对 Root Handle 使用 get 函数，你可以访问整个图形环境的全局属性.
    screenSize = get(0, "screensize");
    left = (screenSize(3)-width) / 2;
    bottom = (screenSize(4)-height) / 2;

    % 直接生成窗口
    % Menubar:
    % figure, none, 默认是 figure
    % Name: 窗口的标题
    % NumberTitle: 窗口的序号
    % Resize: 窗口能否调节大小, 默认是可以 on
    % Toolbar: 控制窗口中工具栏的显示, 默认是 “auto”, 输入 “none” 后不显示工具栏
    hFig = figure(...
        "Position", [left, bottom, width, height], ...
        "Menubar", "none", ...
        "Name", "My GUI", ...
        "NumberTitle", "off", ...
        "Resize", "off", ...
        "Toolbar", "auto" ...
    );

    % Style:
    % pushbutton, togglebutton, radiobutton, checkbox, 
    % edit, slider, listbox, popupmenu, text

    % 
    uicontrol(...
        "Parent", hFig, ...
        "String", "button!", ...
        "Position", [50, 50, 100, 50], ...
        "Style", "pushbutton" ...
    )
end