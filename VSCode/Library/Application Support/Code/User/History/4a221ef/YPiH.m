function result = derive_factorial(N)
    if (N==0)
        result = 1;
    else
        result = N * derive_factorial(N-1);
    end
end

derive_factorial(3)
>> nargout
Not enough input arguments.

Error in nargout (line 2)
    r1 = x+y;
         ^
