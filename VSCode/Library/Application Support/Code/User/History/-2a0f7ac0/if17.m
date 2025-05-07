function result_str = Q4func2(str)
    for i = 1:(length(str)-1)
        if Q4func(str, i)
            str(i:(i+1)) = [];
            
        end
    end
end