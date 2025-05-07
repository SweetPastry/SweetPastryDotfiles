function bool_result = Q4func(str, i)
    bool_result = condition1(str, i) && condition2(str, i) && condition3;
end

function bool_result = condition1(str, i)
    bool_result = double(str(i))>=double('A') & double(str(i))<=double('Z');
end

function bool_result = condition2(str, i)
    bool_result = double(str(i+1))>=double('0')&double(str(i+1))<=double('9');
end

function bool_result = condition3(str, i)
    bool_result = abs(double(str(i))-(double(str(i+1))-double('0'))*2.6-double('A'))<=2;
end