function createWindowWithButtons()
    % 创建一个新的图形窗口
    hFig = figure('Position', [300, 300, 250, 150], 'MenuBar', 'none', 'Name', 'My GUI', 'NumberTitle', 'off', 'Resize', 'off');
    
    % 创建第一个按钮并设置回调函数
    uicontrol('Parent', hFig, 'Style', 'pushbutton', 'String', 'Button 1', ...
              'Position', [50, 100, 70, 30], 'Callback', @(src, event) buttonCallback('Button 1 Pressed'));
    
    % 创建第二个按钮并设置回调函数
    uicontrol('Parent', hFig, 'Style', 'pushbutton', 'String', 'Button 2', ...
              'Position', [50, 60, 70, 30], 'Callback', @(src, event) buttonCallback('Button 2 Pressed'));
    
    % 创建第三个按钮并设置回调函数
    uicontrol('Parent', hFig, 'Style', 'pushbutton', 'String', 'Button 3', ...
              'Position', [50, 20, 70, 30], 'Callback', @(src, event) buttonCallback('Button 3 Pressed'));
end

function buttonCallback(message)
    % 显示消息当按钮被按下
    disp(message);
end