function [Solucao,Weights,Y] = Pesos_Aleatorios(Credito,Threshold,Resposta)
    Weights = rand(1,7);
    Y = NMCP(Credito,Weights,Threshold);
    
    if YY == Resposta
        Solucao = "Correta";
    else
        Solucao = "Errada";
    end
end