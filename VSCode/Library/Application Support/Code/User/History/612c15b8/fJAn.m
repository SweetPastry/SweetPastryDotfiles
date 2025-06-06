function Q3()
    screenSize = get(0, 'ScreenSize');
    
    hFig = figure(...
        'Position', [300, 300, 250, 150], ...
        'MenuBar', 'none', ...
        'Name', 'My GUI', ...
        'NumberTitle', 'off', ...
        'Resize', 'on' ...
    );
    
    uicontrol(...
        'Parent', hFig, ...
        'Style', 'pushbutton', ...
        'String', 'Rock', ...
        'Position', [50, 100, 70, 30], ...
        'Callback', @(src, event) buttonCallbackRock("WIN!") ...
    );
    
    uicontrol(...
        'Parent', hFig, ...
        'Style', 'pushbutton', ...
        'String', 'Scissor', ...
        'Position', [50, 60, 70, 30], ...
        'Callback', @(src, event) buttonCallbackScissor("LOSE!!") ...
    );
    
    uicontrol(...
        'Parent', hFig, ...
        'Style', 'pushbutton', ...
        'String', 'Paper', ...
        'Position', [50, 20, 70, 30], ...
        'Callback', @(src, event) buttonCallbackPaper('Button 3 Pressed') ...
    );
end

function buttonCallbackRock(message)
    close all;
    msgbox(message);
end
function buttonCallbackScissor(message)
    close all;
    msgbox(message);
end
function buttonCallbackPaper(message)
    close all;
    msgbox(message);
end