load im.mat;
imshow(im);

[L, numRegions] = findConnectedComponents(im);

uniqueValues = unique(L);
cellForShowResult = cell(length(unique(L)), 1);
for i = 1:length(uniqueValues)
    [row, col] = find(L==uniqueValues(i));
    cellForShowResult{i} = [row, col];
end

ShowResult(im, cellForShowResult);
disp(numRegions);

 