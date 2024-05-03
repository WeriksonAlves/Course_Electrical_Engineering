close all
clear
clc

try
    fclose(instrfindall);
end

% Looking for the root directory
FolderCurrent = pwd;

% Modify Root Folder if necessary.
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
view(0,90)
axis(limites)
grid on

A.mCADplot
drawnow
disp('Start..........')
pause

% Para armazenar
XX = [];
T = 30;
tmax = T; % Tempo em segundos
t  = tic;
tc = tic;
tp = tic;

while toc(t) < tmax
    % Controlador em função do tempo de amostragem
    if toc(tc) >  A.pPar.Ts
        tc = tic;

        % Executar estratégia
        
        % 1- Ler dados dos sensores
        A.rGetSensorData;
        
        A.pPos.Xd(1) = 2;
        A.pPos.Xd(2) = 2;
        A.pPos.Xd(3) = 1.5;
        A.pPos.Xd(6) = pi/4;
        
        if abs(A.pPos.Xd(6)) > pi
            if A.pPos.Xd(6) > 0
                A.pPos.Xd(6) = -2*pi + A.pPos.Xd(6);
            else
                A.pPos.Xd(6)  = 2*pi + A.pPos.Xd(6);
            end
        end
        
        A = controlador_drone_Werikosn(A);
        
        %%
        %g = [X Z T P]'
%         G = [1 2 1 5;
%              1 3 1 3;
%              1 1 1 1;
%              1 5 1 5];
%         
%         Eq_u_1 = A.pPos.dXd(9);
%         Eq_u_2 = G(2,1)*A.pPos.Xtil(3)/sqrt((norm(A.pPos.Xtil(3))^2)+(G(2,2)^2));
%         Eq_u_3 = G(2,3)*A.pPos.Xtil(9)/sqrt((norm(A.pPos.Xtil(9))^2)+(G(2,4)^2));
%         nz =  Eq_u_1 + Eq_u_2 + Eq_u_3;
%         
%         Eq_Td_1 = A.pPos.dXd(7);
%         Eq_Td_2 = G(3,1)*A.pPos.Xtil(1)/sqrt((norm(A.pPos.Xtil(1))^2)+(G(3,2)^2));
%         Eq_Td_3 = G(3,3)*A.pPos.Xtil(7)/sqrt((norm(A.pPos.Xtil(7))^2)+(G(3,4)^2));
%         Td = atan2((Eq_Td_1 + Eq_Td_2 + Eq_Td_3),(nz));
%         A.pPos.Xd(5) = Td;
%         
%         A.pPos.Xtil = A.pPos.Xd - A.pPos.X;
%                 
%         % Proposta de controle PVTOL XZ
%         
%         % ....................................................
%         %Etapa 1: Contrele de Altura 
%         A.pSC.Ud(3) = G(2,1)*A.pPos.Xtil(3)/sqrt((norm(A.pPos.Xtil(3))^2)+(G(2,2)^2)) + G(2,3)*A.pPos.Xtil(9)/sqrt((norm(A.pPos.Xtil(9))^2)+(G(2,4)^2));
%         
%         % .................................................... 
%         %Etapa 2: Controle de orientação
%         Margem_Ang = deg2rad(5);
%         if abs(A.pPos.Xtil(6)) > Margem_Ang
%             A.pSC.Ud(4) = -(G(4,1)*A.pPos.Xtil(6)/sqrt((norm(A.pPos.Xtil(6))^2)+(G(4,2)^2)) + G(4,3)*A.pPos.Xtil(12)/sqrt((norm(A.pPos.Xtil(12))^2)+(G(4,4)^2)));
%         else     
%             A.pSC.Ud(2) = -(G(1,1)*A.pPos.Xtil(5)/sqrt((norm(A.pPos.Xtil(5))^2)+(G(1,2)^2)) + G(1,3)*A.pPos.Xtil(11)/sqrt((norm(A.pPos.Xtil(11))^2)+(G(1,4)^2)));
%         end
        %%

%         disp(['Xd: ' num2str(A.pPos.Xd')])
%         disp(['X: ' num2str(A.pPos.X')])

        % Gravar dados 
        XX = [XX; [A.pPos.Xd' A.pPos.X' A.pSC.Ud' A.pPar.uSat' toc(t)]];

        % 3- Enviar sinais de controle
        A.rSendControlSignals;

        
    end

    % Para plotar a simulação
    if toc(tp) > 0.1
        tp = tic;
        A.mCADplot;
        drawnow;        
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
