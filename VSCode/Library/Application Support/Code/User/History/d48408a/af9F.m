function [L, numRegion] = recursionFunc(im)
    [rows, cols] = sizz(im);
    L = zeros(rows, cols);

    for row_idx = 1:rows
        for col_idx = 1:cols
            if ~(L(row_idx, col_idx) == 1) && (im(row_idx, col_idx) == 1)
                numRegion = numRegion + 1;
                L = grow(im, L, row_idx, col_idx, rows, cols);
            end
        end
    end
end


function L = grow(im, L, row_idx, col_idx, rows, cols)
    directions = [
         1,  0;
         0,  1;
        -1,  0;
         0, -1;
         1,  1;
        -1,  1;
        -1, -1;
         1, -1;
    ];
    for dir_idx = 1:8
        dir_vec = directions(dir_idx, :);
        consider_point = [row_idx, cow_idx] + dir_vec;
        if check_in_border(consider_point)
            if im




function bool_result = check_in_border(consider_point)
    [row_consider_point, col_consider_point] = consider_point;
    if (row_consider_point <= rows) && (row_consider_point >= 1) && (col_consider_point <= cols) && (col_consider_point >= 1)
        bool_result = 1;
    else
        bool_result = 0;
    end
end
