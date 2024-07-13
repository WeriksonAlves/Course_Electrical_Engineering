while Solucao == "Errada"
    disp('')
    Weights = rand(1,7);
    YY = NMCP(Credito,Weights,Threshold_3)
    
    if YY == Resposta
        Solucao = "Correta"
        Weights_Final = Weights;
        break
    else
        Solucao = "Errada"
    end
    
    Iteracao = Iteracao + 1
    if Iteracao == Limite_Iteracao
        Iteracao
        break
    end
end