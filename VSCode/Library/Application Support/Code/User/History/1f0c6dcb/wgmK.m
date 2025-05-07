function [L, numRegions] = findConnectedComponents(im)
    [rows, cols] = size(im);
    L = zeros(rows, cols);
    currentLabel = 0;
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