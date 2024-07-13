function Saida = yperceptron(Pesos,Bias,Matriz_entrada)
    Saida = hardlim(sum(Matriz_entrada.*Pesos,2) + Bias);
end