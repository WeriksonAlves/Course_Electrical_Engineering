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

% Para armazenar
XX = [];

tmax = 60; % Tempo em segundos
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

        % 2- Executar o controlador
        % Controlador de altitude e guinada 
        % 0 - 30s: 2m em z e 90° em psi
        % 30 - 60s: 1m em z e 0° em psi
        if toc(t) > 60
            A.pPos.Xd(3) = 0;
            A.pPos.Xd(6) = 0;        
        elseif toc(t) > 30
            A.pPos.Xd(3) = 1;
            A.pPos.Xd(6) = 0;
        else
            A.pPos.Xd(3) = 2;
            A.pPos.Xd(6) = pi/2;
        end
        
        if abs(A.pPos.Xd(6)) > pi
            if A.pPos.Xd(6) > 0
                A.pPos.Xd(6) = -2*pi + A.pPos.Xd(6);
            else
                A.pPos.Xd(6)  = 2*pi + A.pPos.Xd(6);
            end
        end
        
        A.pPos.Xtil = A.pPos.Xd - A.pPos.X;

        % Proposta de controle
        % Controle altitude
        g1 = 1.5;
        g2 = 2;
        A.pSC.Ud(3) = g1*A.pPos.Xtil(3)/sqrt((norm(A.pPos.Xtil(3))^2)+(g2^2));
        %A.pSC.Ud(3) = 0.5*A.pPos.Xtil(3); % Tipo P

        % Controle de guinada
        g3 = 2;
        g4 = 1.8;
        A.pSC.Ud(4) = -g3*A.pPos.Xtil(6)/sqrt((norm(A.pPos.Xtil(6))^2)+(g4^2));
        
        disp(['=========== '])
        disp(['Xd: 2 == X: ' num2str(A.pPos.X(3))])
        disp(['psid: 2 == psi: ' num2str(A.pPos.X(6))])

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
figure, plot(XX(:,end),[XX(:,3) XX(:,15)]) % Grafico da posição
legend('Posição desejada','Posição atual');

figure, plot(XX(:,end),[XX(:,6) XX(:,18)]) % Grafico do ângulo
legend('Angulo psi desejado','Angulo psi atual');

figure, plot(XX(:,end),XX(:,27),XX(:,end),XX(:,31),XX(:,end),XX(:,28),XX(:,end),XX(:,32))
legend('Sinal de controle: u','Sinal de controle: u_max','Sinal de controle: w_psi','Sinal de controle: w_psi_max');





























