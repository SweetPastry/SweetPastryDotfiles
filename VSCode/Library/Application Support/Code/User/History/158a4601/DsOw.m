s = importdata("ShowResult.m", "\n")

X = 1;
for line_idx = 1:length(s)
    s_nospace = strtrim(s{line_idx});
    if ~isempty(s_nospace)&&s_nospace(1)=='%'
        continue
    else
        if strncmp(strtrim(s(line_idx)), 'for', 3)||strncmp(strtrim(s(line_idx)), 'while', 4)
            s{line_idx} = s{line_idx} + "    %Loop" + int2str(X);
            pointer = line_idx + 1;
            while ~strncmp(strtrim(s(pointer)), "end", 3)
                pointer = pointer + 1;
            end
            s{pointer} = s{pointer} + "    %Loop" + int2str(X);
            X = X + 1;
        end
    end
end

for i=1:length(s)
    fprintf("%s\n", s{i});
end
