s = importdata("ShowResult.m", "\n")


for line_idx = 1:length(s)
    if strtrim(s(line_idx))(1)=='%'
        contains
    else
        if strncmp(strtrim(s(line_idx)), 'for', 3)
            s = {}
        end
    end
end

for i=1:length(s)
    fprintf("%s\n", s{i});
end
