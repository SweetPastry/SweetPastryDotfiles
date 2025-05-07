function [L, numRegions] = findConnectedComponents(im)
    [rows, cols] = size(im);
    L = zeros(rows, cols);
    numRegions = 0;
    directions = [
        -1,  0;
         0, -1;
         1,  0;
         0,  1;
        -1,  1;
        -1, -1;
         1, -1;
         1,  1
    ]

    for i=1:rows
        for j=1:cols
            if im(i, j)==1 && L(i, j)==0
                numRegions = =numRegions + 1;
                L = growRegion(im, L, i, j, numRegions, directions, rows, cols);
            end
        end
    end
end





function L = growRegion(im, L, i, j, numRegions, directions, rows, cols)
    stack = [i, j];
    L(i, j) = numRegions;
    
    while ~isempty(stack)
        consider_point = stack(1, :);
        stack(1, :) = [];

        [consider_x, consider_y] = consider_point;

        for direction_idx = 1:size(directions, 1)
            neighbor_point = consider_point + directions(k, :);

            if neighbor_point(1)>0 && neighbor_point(2)<=
        end
    end
end
