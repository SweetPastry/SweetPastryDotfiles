data = readtable("上课点名表.xls", NumHeaderLines=3);
data_clear = readtable("上课点名表.xls", NumHeaderLines=4);
majors_list = data_clear(:, 5).Var5;
emptyIdx = cellfun(@isempty, majors_list);
majors_list = majors_list(~emptyIdx);
majors_tuple_only = {};
majors_num = [];
for idx = 1:length(majors_list)
    major_name = majors_list{idx};
    if ~ismember({major_name}, majors_tuple_only)
        majors_tuple_only{end+1} = major_name;
        majors_num(end+1) = 1;
    else
        major_idx = find(strcmp(majors_tuple_only, major_name));
        majors_num(major_idx) = majors_num(major_idx) + 1;
    end
end
for idx = 1:length(majors_num)
    labels{idx} = sprintf('%s: %d 人', majors_tuple_only{idx}, majors_num(idx));
end
figure;
pie(majors_num, labels);