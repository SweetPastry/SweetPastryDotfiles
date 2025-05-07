function [L, numRegions] = findConnectedComponents(im)
    [rows, cols] = size(im);
    L = zeros