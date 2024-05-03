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
view(0,90)
axis(limites)
grid on

A.mCADplot
drawnow
disp('Start..........')
pause

% Para armazenar
XX = [];

tmax = 150; % Tempo em segundos
t  = tic;
tc = tic;
tp = tic;

g1 = 100;
g2 = 100;
g3 = 100;
g4 = 100;
g5 = 100;
g6 = 50;
g7 = 100;
g8 = 50;
g9 = 60;
g10 = 90;
g11 = 80;
g12 = 70;

Kx = [g1 g2 g1 g2];
Ky = [g3 g4 g3 g4];
Kz = [g5 g6 g5 g6];

Kp = [g7 g8 g7 g8];
Kf = [g9 g10 g9 g10];
Kt = [g11 g12 g11 g12];

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
        if toc(t) > 120
            A.pPos.Xd(1) = 1;
            A.pPos.Xd(2) = 1;
            A.pPos.Xd(3) = 1;
        elseif toc(t) > 90
            A.pPos.Xd(1) = 1;
            A.pPos.Xd(2) = -1;
            A.pPos.Xd(3) = 1;
        elseif toc(t) > 60
            A.pPos.Xd(1) = -1;
            A.pPos.Xd(2) = -1;
            A.pPos.Xd(3) = 1;         
        elseif toc(t) > 30
            A.pPos.Xd(1) = -1;
            A.pPos.Xd(2) = 1;
            A.pPos.Xd(3) = 1;        
        else
            A.pPos.Xd(1) = 0;
            A.pPos.Xd(2) = 0;
            A.pPos.Xd(3) = 1;
        end
        
        % Angulo psi desejado para o instante
        A.pPos.Xd(6) = atan2( (A.pPos.Xd(2)-A.pPos.Xda(2)), (A.pPos.Xd(1)-A.pPos.Xda(1)) );
        
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
            disp('XZ')
            A = Function_PVTOL_XZ(A,Kx,Kz,Kt);
        elseif (abs(A.pPos.Xtil(6)) < psi_min) && (abs(A.pPos.Xtil(2)) > y_min)
            disp('YZ')
            A = Function_PVTOL_YZ(A,Ky,Kz,Kf);
        else (A.pPos.Xda(1) ~= A.pPos.Xd(1)) || (A.pPos.Xda(2) ~= A.pPos.Xd(2)) || (A.pPos.Xda(3) ~= A.pPos.Xd(3)) || (abs(A.pPos.Xtil(6)) > psi_min)
            disp('Z')
            A.pPos.Xda = A.pPos.Xd;
            A = Function_PVTOL_Z(A,Kz,Kp);
        end
        
        disp(['=========== '])
        disp(['X: ' num2str(A.pPos.X')])
        disp(['Xd: ' num2str(A.pPos.Xd')])

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

figure, plot(XX(:,end),[XX(:,27),XX(:,31),-XX(:,31)])
legend('U(3)','+U(3)_(max)','-U(3)_(max)');

figure, plot(XX(:,end),[XX(:,3) XX(:,15)]) % Grafico da posição
legend('Xd(3)','X(3)');

figure, plot(XX(:,end),[XX(:,6) XX(:,18)]) % Grafico do ângulo
legend('Xd(6)','X(6)');

figure, plot(XX(:,end),[XX(:,28),XX(:,32),-XX(:,32)])
legend('U(4)','+U(4)_(max)','-U(4)_(max)');
