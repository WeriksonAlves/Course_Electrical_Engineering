function Output = NMCP(Input,Weights,Bias)
    Output = hardlim(sum(Input.*Weights,2) + Bias);
end