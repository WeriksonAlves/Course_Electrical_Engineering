close all
clear
clc

try
    fclose(instrfindall);
end

% Looking for the root directory
FolderCurrent = pwd;

% % Modify Root Folder if necessary.
% FolderRoot = 'ELT472';
% %FolderRoot = 'AuRoRA';
% cd(FolderCurrent(1:(strfind(FolderCurrent,FolderRoot)+numel(FolderRoot)-1)))
% addpath(genpath(pwd))
% addpath(genpath(pwd))

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

Passo = -1;
Minimo = inf;
for g1 = 10:Passo:0
    for g2 = 10:Passo:0
        for g3 = 10:Passo:0
            for g4 = 10:Passo:0
                for g5 = 10:Passo:0
                    for g6 = 10:Passo:0
                        for g7 = 10:Passo:0
                            for g8 = 10:Passo:0
                                for g9 = 10:Passo:0
                                    for g10 = 10:Passo:0
                                        for g11 = 10:Passo:0
                                            for g12 = 10:Passo:0
                                                disp(['Ganhos: ' num2str(g1) ', ' num2str(g2) ', ' num2str(g3) ', ' num2str(g4) ', ' num2str(g5) ', ' num2str(g6) ', ' num2str(g7) ', ' num2str(g8) ', ' num2str(g9) ', ' num2str(g10) ', ' num2str(g11) ' e ' num2str(g12)])
                                                
                                                
                                                XX = []; % Para armazenar
                                                T = 30;
                                                tmax = T; % Tempo em segundos
                                                
                                                % Parâmetros de desempenho
                                                Erro_mim = 0.01;
                                                
                                                Fim_t = 0;
                                                Fim_g1 = 0;
                                                Fim_g2 = 0;
                                                Fim_g3 = 0;
                                                Fim_g4 = 0;
                                                Fim_g5 = 0;
                                                Fim_g6 = 0;
                                                Fim_g7 = 0;
                                                Fim_g8 = 0;
                                                Fim_g9 = 0;
                                                Fim_g10 = 0;
                                                Fim_g11 = 0;
                                                Fim_g12 = 0;
                                                
                                                Kx = [g1 g2 g1 g2];
                                                Ky = [g3 g4 g3 g4];
                                                Kz = [g5 g6 g5 g6];
                                                
                                                Kp = [g7 g8 g7 g8];
                                                Kf = [g9 g10 g9 g10];
                                                Kt = [g11 g12 g11 g12];
                                                
                                                for t = 0:A.pPar.Ts:tmax
                                                    % Executar estratégia
                                                    
                                                    % 1- Ler dados dos sensores
                                                    A.rGetSensorData;
                                                    
                                                    %% Executar o controlador - Editar a partir daqui
                                                    
                                                    A.pPos.Xd(1) = 1;
                                                    A.pPos.Xd(2) = 1;
                                                    A.pPos.Xd(3) = 2;
                                                    A.pPos.Xd(6) = pi/4;
                                                    
                                                    if abs(A.pPos.Xd(6)) > pi
                                                        if A.pPos.Xd(6) > 0
                                                            A.pPos.Xd(6) = -2*pi + A.pPos.Xd(6);
                                                        else
                                                            A.pPos.Xd(6)  = 2*pi + A.pPos.Xd(6);
                                                        end
                                                    end
                                                    
                                                    A.pPos.Xtil = A.pPos.Xd - A.pPos.X;
                                                    
                                                    % Proposta de controle PVTOL XZ
                                                    psi_min = deg2rad(15);
                                                    y_min = 0.1;
                                                    
                                                    if (abs(A.pPos.Xtil(6)) < psi_min) && (abs(A.pPos.Xtil(2)) < y_min)
                                                        %disp('X')
                                                        A = Function_PVTOL_XZ(A,Kx,Kz,Kt);
                                                    elseif (abs(A.pPos.Xtil(6)) < psi_min) && (abs(A.pPos.Xtil(2)) > y_min)
                                                        %disp('Y')
                                                        A = Function_PVTOL_YZ(A,Ky,Kz,Kf);
                                                    elseif (A.pPos.Xda(1) ~= A.pPos.Xd(1)) || (A.pPos.Xda(2) ~= A.pPos.Xd(2)) || (A.pPos.Xda(3) ~= A.pPos.Xd(3)) || (abs(A.pPos.Xtil(6)) > psi_min)
                                                        %disp('Z')
                                                        A.pPos.Xda = A.pPos.Xd;
                                                        A = Function_PVTOL_Z(A,Kz,Kp);
                                                    end
                                                    
                                                    %% Terminar daqui para cima
                                                    
                                                    % Verifica a saturação
                                                    if (A.pSC.Ud(1) > A.pPar.uSat(1)) || (A.pSC.Ud(2) > A.pPar.uSat(2)) || (A.pSC.Ud(3) > A.pPar.uSat(3)) || (A.pSC.Ud(4) > A.pPar.uSat(4))
                                                        disp(['Saturado: ' num2str(A.pSC.Ud')])
                                                        break
                                                    end
                                                    
                                                    % Gravar dados
                                                    XX = [XX; [A.pPos.Xd' A.pPos.X' A.pSC.Ud' A.pPar.uSat' t]];
                                                    
                                                    % 3- Enviar sinais de controle
                                                    A.rSendControlSignals;
                                                    
                                                    
                                                    if (t < T) && (norm(A.pPos.Xtil(1:2)) < Erro_mim)
                                                        disp(['Ganho encontrado: ' num2str(g1) ', ' num2str(g2) ', ' num2str(g3) ', ' num2str(g4) ', ' num2str(g5) ', ' num2str(g6) ', ' num2str(g7) ', ' num2str(g8) ', ' num2str(g9) ', ' num2str(g10) ', ' num2str(g11) ' e ' num2str(g12)])                                                        
                                                        Fim_t = 1;
                                                        break
                                                    elseif ((t > T/2) && (norm(A.pPos.Xtil(1:2)) > Erro_mim)) || (norm(A.pPos.Xtil(1:2)) > 3)
                                                        %disp(['Erro Atual: ' num2str(norm(A.pPos.Xtil(1:3)))])
                                                        break
                                                    end
                                                end
                                                
                                                if norm(A.pPos.Xtil(1:2)) < Minimo
                                                    Minimo = norm(A.pPos.Xtil(1:3));
                                                    Melhor_Ganho = [g1 g2 g3 g4 g5 g6 g7 g8 g9 g10 g11 g12];
                                                    disp(['Menor erro encontrado: ' num2str(Minimo)])
                                                    disp(['Melhor Ganho encontrado: ' num2str(g1) ', ' num2str(g2) ', ' num2str(g3) ', ' num2str(g4) ', ' num2str(g5) ', ' num2str(g6) ', ' num2str(g7) ', ' num2str(g8) ', ' num2str(g9) ', ' num2str(g10) ', ' num2str(g11) ' e ' num2str(g12)])                                                        
                                                end
                                                
                                                if Fim_t == 1
                                                    Fim_g12 = 1;
                                                    break
                                                end
                                            end
                                            
                                            if Fim_g12 == 1
                                                Fim_g11 = 1;
                                                break
                                            end
                                        end
                                        if Fim_g11 == 1
                                            Fim_g10 = 1;
                                            break
                                        end
                                    end
                                    if Fim_g10 == 1
                                        Fim_g9 = 1;
                                        break
                                    end
                                end
                                if Fim_g9 == 1
                                    Fim_g8 = 1;
                                    break
                                end
                            end
                            if Fim_g8 == 1
                                Fim_g7 = 1;
                                break
                            end
                        end
                        if Fim_g7 == 1
                            Fim_g6 = 1;
                            break
                        end
                    end
                    if Fim_g6 == 1
                        Fim_g5 = 1;
                        break
                    end
                end
                if Fim_g5 == 1
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
        Fim_g1 = 1;
        break
    end
end


% Criar figuras
figure, plot(XX(:,end),[XX(:,1) XX(:,13)]) % Grafico da posição
legend('Xd(1)','X(1)');

figure, plot(XX(:,end),[XX(:,26),XX(:,30),-XX(:,30)])
legend('U(2)','+U(2)_(max)','-U(2)_(max)');

figure, plot(XX(:,end),[XX(:,3) XX(:,15)]) % Grafico da posição
legend('Xd(3)','X(3)');

figure, plot(XX(:,end),[XX(:,27),XX(:,31),-XX(:,31)])
legend('U(3)','+U(3)_(max)','-U(3)_(max)');

figure, plot(XX(:,end),[XX(:,6) XX(:,18)]) % Grafico do ângulo
legend('Xd(6)','X(6)');

figure, plot(XX(:,end),[XX(:,28),XX(:,32),-XX(:,32)])
legend('U(4)','+U(4)_(max)','-U(4)_(max)');
