function Q3()
    hFig = figure('Position', [300, 300, 250, 150], 'MenuBar', 'none', 'Name', 'My GUI', 'NumberTitle', 'off', 'Resize', 'off');
    
    uicontrol(
        'Parent', hFig, 
        'Style', 'pushbutton', 
        'String', 'Rock',
        'Position', [50, 100, 70, 30], 
        'Callback', @(src, event) buttonCallbackRock("WIN!")
    );
    
    uicontrol(
        'Parent', hFig, 
        'Style', 'pushbutton', 
        'String', 'Scissor',
        'Position', [50, 60, 70, 30], 
        'Callback', @(src, event) buttonCallbackScissor("LOSE!!")
    );
    
    uicontrol(
        'Parent', hFig, 
        'Style', 'pushbutton', 
        'String', 'Paper',
        'Position', [50, 20, 70, 30], 
        'Callback', @(src, event) buttonCallback('Button 3 Pressed')
    );
end

function buttonCallback(message)
    disp(message);
end