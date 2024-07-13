function [Pesos,Bias,Erro_Medio,Erro_Epoca] = Perceptron(Pesos0,Bias0,Matriz_entrada,Saida_Desejada,Eta,Maximo_Epocas,Tolerancia)
    Colunas_Entradas = size(Matriz_entrada,2) %Numero de colunas
    Linhas_Entradas = size(Matriz_entrada,1) %Numero de linhas
    Saida_Calculada = yperceptron(Pesos0,Bias0,Matriz_entrada)
    Erro = Saida_Desejada - Saida_Calculada
    
    Erro_Medio = mean(Erro.^2)
    Erro_Epoca = Erro_Medio
    
    Epoca_Atual = 1
    Pesos = [Bias0 Pesos0] % Pesos e bias
    Entrada = [-ones(Linhas_Entradas,1) Matriz_entrada] % entrada e -1
    
    while (Erro_Medio >= Tolerancia)
        if Epoca_Atual > Maximo_Epocas
            break
        end
        
        Delta_W = Eta*Erro.*Entrada;
        Pesos = Pesos + Delta_W';
        
        Bias = Pesos(size(Pesos,1),1);
        Pesos(size(Pesos,1),:) = [];
        Saida_Calculada = yperceptron(Pesos,Bias,Matriz_entrada);
        
        Erro = Saida_Desejada - Saida_Calculada;
        Erro_Medio = mean(Erro.^2);
        Erro_Epoca(Epoca_Atual) = Erro_Medio;
        
        x1 = 0:.1:2;
        x2 = -(Pesos(1)/Pesos(2))*x1 + (Bias/Pesos(2)); %Reta de decisão
        
        plot(x1,x2,'-',[0 0 1 1],[0 1 0 1],'r*');
        xlabel('Bit 1');ylabel('Bit 2')
        axis([0 2 0 2])
        drawnow
        pause
        
        Epoca_Atual = Epoca_Atual + 1
        Pesos = [Pesos; Bias];
    end
end
        
    