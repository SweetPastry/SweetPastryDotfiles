function result = derive_factorial(N)
    if (N==0)
        result = 1;
    else
        result = N * derive_factorial(N-1);
    end
end

derive_factorial(3)
derive_factorial(4)

