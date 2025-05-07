function bool_result = Q4func(str, i)
    if condition1(str, i) & condistion2(str, i) & condition3(str, i)

    end
end

function bool_result =  condition1(str, i)
    bool_result =  double(str(i))>=double('A') & double(str(i))<=double('Z')
end