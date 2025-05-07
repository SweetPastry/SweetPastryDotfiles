function [L, numRegion] = recursionFunc(im)
    numRegion = 0;
    [rows, cols] = size(im);
    L = zeros(rows, cols);

    for row_idx = 1:rows
        for col_idx = 1:cols
            % fprintf("(%d, %d)\n", row_idx, col_idx);
            if (L(row_idx, col_idx) == 0) && (im(row_idx, col_idx) == 1)
                numRegion = numRegion + 1;
                L(row_idx, col_idx) = numRegion;
                L = grow(im, L, row_idx, col_idx, rows, cols, numRegion);
            end
        end
    end
end


function L = grow(im, L, row_idx, col_idx, rows, cols, numRegion)
    if ~(L(row_idx, col_idx) == 0)
        return;
    end
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
        consider_point = [row_idx, col_idx] + dir_vec;
        row_consider_point = consider_point(1);
        col_consider_point = consider_point(2);

        if check_in_border(row_consider_point, col_consider_point, rows, cols)
            if im(row_consider_point, col_consider_point) == 1
                L(row_consider_point, col_consider_point) = numRegion;
                L = grow(im, L, row_consider_point, col_consider_point, rows, cols, numRegion);
            end
        end
    end
end




function bool_result = check_in_border(row_consider_point, col_consider_point, rows, cols)
    if (row_consider_point <= rows) && (row_consider_point >= 1) && (col_consider_point <= cols) && (col_consider_point >= 1)
        bool_result = 1;
    else
        bool_result = 0;
    end
end
