s = importdata("ShowResult.m", "\n")


for line_idx = 1:length(s)
    if strtrim(s(line_idx))(1)=='%'
        contains
    else
        if strtrim(s(line_idx))()
    end
end

for i=1:length(s)
    fprintf("%s\n", s{i});
end
