close all
clear
clc

try
    fclose(instrfindall);
end

% Looking for the root directory
FolderCurrent = pwd;

% Modify Root Folder if necessary.
FolderRoot = 'ELT472';
%FolderRoot = 'AuRoRA';
cd(FolderCurrent(1:(strfind(FolderCurrent,FolderRoot)+numel(FolderRoot)-1)))
addpath(genpath(pwd))
addpath(genpath(pwd))

% =========================================================================
% Declaring robots
A = ArDrone;

% =========================================================================
% Plotting information

figure(1)
axis([-3 3 -3 3 0 3])
xlabel({'$$x$$ [m]'},'FontSize',18,'FontWeight','bold','interpreter','latex');
ylabel({'$$y$$ [m]'},'FontSize',18,'FontWeight','bold','interpreter','latex');
zlabel({'$$z$$ [m]'},'FontSize',18,'FontWeight','bold','interpreter','latex');
limites = [-3 3 -3 3 0 3];
Ground = patch(limites([1 1 2 2]),limites([3 4 4 3]),limites([5 5 5 5]),[0.6 1 0.6]);
Ground.FaceAlpha = 0.4;
view(40,40)
axis(limites)
grid on

A.mCADplot
drawnow
disp('Start..........')
pause

for g1 = 1.5:-0.1:0.01
    for g2 = 2:-0.1:0.01
        for g3 = 2:-0.1:0.01
            for g4 = 2:-0.1:0.01
                disp(['Ganhos: ' num2str(g1) ', ' num2str(g2) ', ' num2str(g3) ' e ' num2str(g4)])
                
                % Para armazenar
                XX = [];

                tmax = 60; % Tempo em segundos               
                tp = 0.1;
                T = 30;
                
                % Parâmetros de desempenho
                Erro_mim = 0.01;
                IAE = 0;
                ITAE = 0;
                IASC = 0;
                Fim_t = 0;
                Fim_g1 = 0;
                Fim_g2 = 0;
                Fim_g3 = 0;
                Fim_g4 = 0;
                
                % Executar estratégia

                % 1- Ler dados dos sensores
                A.rGetSensorData;

                % 2- Executar o controlador
                % Controlador de altitude e guinada 
                % 0 - 30s: 2m em z e 90° em psi
                % 30 - 60s: 1m em z e 0° em psi
                for t = 0:tp:tmax
                    if t > 2*T
                        A.pPos.Xd(3) = 0;
                        A.pPos.Xd(6) = 0;        
                    elseif t > T
                        A.pPos.Xd(3) = 1;
                        A.pPos.Xd(6) = 0;
                    else
                        A.pPos.Xd(3) = 2;
                        A.pPos.Xd(6) = pi/2;
                    end

                    A.pPos.Xtil = A.pPos.Xd - A.pPos.X;

                    % Proposta de controle
                    % Controle altitude
                    %g1 = 2;
                    %g2 = 0.06;
                    A.pSC.Ud(3) = g1*A.pPos.Xtil(3)/sqrt((norm(A.pPos.Xtil(3))^2)+(g2^2));
                    %A.pSC.Ud(3) = 0.5*A.pPos.Xtil(3); % Tipo P
            
                    % Controle de guinada
                    %g3 = 1;
                    %g4 = 1;
                    A.pSC.Ud(4) = -g3*A.pPos.Xtil(6)/sqrt((norm(A.pPos.Xtil(6))^2)+(g4^2));
                    
                    % Verifica a saturação
                    if (A.pSC.Ud(3)>A.pPar.uSat(3)) || (A.pSC.Ud(4)>A.pPar.uSat(4))
                        disp(['Saturado: ' num2str(A.pSC.Ud(1)) ' e ' num2str(A.pSC.Ud(2))])
                        break
                    end

                    % Gravar dados 
                    XX = [XX; [A.pPos.Xd' A.pPos.X' A.pSC.Ud' t]];

                    % 3- Enviar sinais de controle
                    A.rSendControlSignals;

%                     A.mCADplot;
%                     drawnow;  
                    Vec = [A.pPos.Xtil(3) A.pPos.Xtil(6)];
                    if (t <= T/2) && (norm(Vec) <= Erro_mim)
                        disp(['Ganho encontrado: ' num2str(g1) ' e ' num2str(g2)])
                        Fim_t = 1;
                        break
                    elseif (t > T/2) && (norm(Vec) > Erro_mim)
                        disp(['Erro Atual: ' num2str(norm(A.pPos.Xtil(1:2)))])
                        break
                    end
                end
                if Fim_t == 1
                    Fim_g4 = 1;
                    break
                end
            end
            if Fim_g4 == 1
                Fim_g3 = 1;
                break
            end
        end
        if Fim_g3 == 1
            Fim_g2 = 1;
            break
        end
    end
    if Fim_g2 == 1
        break
    end
end

% Criar figuras
figure, plot(XX(:,end),[XX(:,3) XX(:,15)]) % Grafico da posição
legend('Posição desejada','Posição atual');

figure, plot(XX(:,end),[XX(:,6) XX(:,18)]) % Grafico do ângulo
legend('Angulo psi desejado','Angulo psi atual');

figure, plot(XX(:,end),XX(:,27))
legend('Sinal de controle');
