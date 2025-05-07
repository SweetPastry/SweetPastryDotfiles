function bool_result = Q4func(str, i)
    if condition1(str, i) & condition2(str, i) & condition3(str, i)

    end
end

function bool_result = condition1(str, i)
    bool_result = double(str(i))>=double('A') & double(str(i))<=double('Z')
end

function bool_result = condition2(str, i)
    bool_result = double(str(i+1))>=double('0')&double(str(i+1))<=double('9')
end

