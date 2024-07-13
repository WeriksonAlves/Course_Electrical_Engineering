function Distribuicao(Tipo,MX,MY,VX,VY,QP)
    Pontos = zeros(2,QP);
    if Tipo == "Gaussiana"
        for i = 1:QP
            Pontos(:,i) = [sqrt(VX)*randn()+MX sqrt(VY)*randn()+MY];
        end
        figure()
        scatter(Pontos(1,:),Pontos(2,:));
        xlabel('x')
        ylabel('y')
        title('Classe Gaussiana')
        axis([.7*MX 1.4*MX .8*MY 1.25*MY])
        disp('Distorção para Classe Gaussiana:')
        Distorcao_dB(Pontos(1,:),Pontos(2,:))
        
    elseif Tipo == "Uniforme"
        X1 = (2*MX-sqrt(12*VX))/2;  %obtenção do coeficiente de menor valor da ditribuição de x
        X2 = (2*MX+sqrt(12*VX))/2;   %obtenção do coeficiente de maior valor da ditribuição de x
        Y1 = (2*MY-sqrt(12*VY))/2;   %obtenção do coeficiente de menor valor da ditribuição de y
        Y2 = (2*MY+sqrt(12*VY))/2;   %obtenção do coeficiente de maior valor da ditribuição de y

        for i = 1:QP
            Pontos(:,i) = [X1+(X2-X1)*rand() Y1+(Y2-Y1)*rand()];
        end
        figure()
        scatter(Pontos(1,:),Pontos(2,:));
        xlabel('x')
        ylabel('y')
        title('Classe Uniforme')
        axis([.8*MX 1.2*MX .85*MY 1.15*MY])
        disp('Distorção para Classe Uniforme:')
        Distorcao_dB(Pontos(1,:),Pontos(2,:))
    end
    grid on
    hold on
    MX = mean(Pontos(1,:));
    MY = mean(Pontos(2,:));
    plot([MX MX], [0, MY+10*VX],':r','LineWidth',2)
    hold on
    plot([0, MX+10*VY],[MY MY],':r','LineWidth',2)
end