s = importdata("ShowResult.m", "\n")

X = 1;
for line_idx = 1:length(s)
    if strtrim(s(line_idx))(1)=='%'
        contains
    else
        if strncmp(strtrim(s(line_idx)), 'for', 3)
            s = {s(1:line_idx-1), "Loop"+X, s(line_idx:end)};
            pointer = line_idx + 1;
            while ~strncmp(strtrim(s(pointer)), "end", 3)
                pointer = pointer + 1;
            end
        end
    end
end

for i=1:length(s)
    fprintf("%s\n", s{i});
end
