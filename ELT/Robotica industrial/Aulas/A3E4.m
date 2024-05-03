%% Fazer 2 prismas, um apoiado no outro rotacionarem

% Limpar todas as variaveis, janelas e o command window
close all; clear all; clc;

%Cria o cilindro a ser divido ao meio
[Cfb0, Cfl0, Cv0] = criarprisma(8,1,1);

%Cria o Prisma Inferior completo 
PIfl = [1 2 12 11;
       2 3 13 12;
       3 4 14 13;
       4 5 15 14;
       5 6 16 15;
       6 7 17 16;
       7 8 18 17;
       8 9 19 18;
       9 10 20 19;
       10 1 11 20];
 
PIfb = [1 2 3 4 5 6 7 8 9 10; 
       11 12 13 14 15 16 17 18 19 20];

PIv = [[-1 0 0];
      [Cv0(6,1) Cv0(6,2) 0];
      [0 -1 0];
      [Cv0(8,1) Cv0(8,2) 0];
      [1 0 0];
      [1 3 0];
      [Cv0(2,1) Cv0(2,2)+3 0];
      [0 4 0];
      [Cv0(4,1) Cv0(4,2)+3 0];
      [-1 3 0];%Termina base
      [-1 0 1];
      [Cv0(6,1) Cv0(6,2) 1];
      [0 -1 1];
      [Cv0(8,1) Cv0(8,2) 1];
      [1 0 1];
      [1 3 1];
      [Cv0(2,1) Cv0(2,2)+3 1];
      [0 4 1];
      [Cv0(4,1) Cv0(4,2)+3 1];
      [-1 3 1]];%Termina Topo

PI(1) = patch('vertice',PIv,'faces',PIfb,...
    'FaceAlpha',0.9,'FaceColor',[0 0 1]);
PI(2) = patch('vertice',PIv,'faces',PIfl,...
    'FaceAlpha',0.9,'FaceColor',[0 1 0]);

%Cria o Prisma Superior completo
PSfb = PIfb;
PSfl = PIfl;
PSv= PIv;
PS(1) = patch('vertice',PSv,'faces',PSfb,...
    'FaceAlpha',0.9,'FaceColor',[0 1 1]);
PS(2) = patch('vertice',PSv,'faces',PSfl,...
    'FaceAlpha',0.9,'FaceColor',[1 0 0]);

%Define os eixos gráficos
axis([-8 8 -8 8 -1 2])
view(30,30)
xlabel('x')
ylabel('y')
zlabel('z')
grid on




%Faz o movimento do braço
Elos = 2;



% ......................................................................
if Elos == 1
    fprintf('\nEstá sendo rotacionado apenas um elo.\n')
    % Clona os vertices
    for linha1 = 1:2
        PS1(linha1).Vertices = PS(linha1).Vertices;
    end

    for theta = 0:5:360
        % Transformação Rotacional em z
        PS1TZ = [cosd(theta) -sind(theta) 0 0;
              sind(theta)  cosd(theta) 0 3;
                 0         0           1 1;
                 0         0           0 1];
        for linha1 = 1:2
            PS1VT = PS1TZ*[PS1(linha1).Vertices'; ones(1,length(PS1(linha1).Vertices))];
            PS1V = PS1VT(1:3,:)';
            PS(linha1).Vertices = PS1V;
        end
        PS.Vertices;
        pause(0.01)
    end
% ......................................................................
elseif Elos == 2
    fprintf('\nEstão sendo rotacionado os dois elos.\n')
    %Coloca o superior na posição certa
    PS2TZ = [1 0 0 0;
             0 1 0 3;
             0 0 1 1;
             0 0 0 1];
    for linha1 = 1:2
        PS2VT = PS2TZ*[PS(linha1).Vertices'; ones(1,length(PS(linha1).Vertices))];
        PS2V = PS2VT(1:3,:)';
        PS(linha1).Vertices = PS2V;
    end
    
    for linha2 = 1:2
        PS22(linha2).Vertices = PS(linha2).Vertices;
        PI22(linha2).Vertices = PI(linha2).Vertices;
    end
    
    for theta = 0:5:360
        % Transformação Rotacional em z
        PI2TZ = [cosd(theta) -sind(theta) 0 0;
                 sind(theta)  cosd(theta) 0 0;
                    0         0           1 0;
                    0         0           0 1];
        for linha3 = 1:2
            %Superior
            PS22VT = PI2TZ*[PS22(linha3).Vertices'; ones(1,length(PS22(linha3).Vertices))];
            PS22V = PS22VT(1:3,:)';
            PS(linha3).Vertices = PS22V;
            %Inferior
            PI22VT = PI2TZ*[PI22(linha3).Vertices'; ones(1,length(PI22(linha3).Vertices))];
            PI22V = PI22VT(1:3,:)';
            PI(linha3).Vertices = PI22V;            
        end
        PI.Vertices;
        PS.Vertices;
        pause(0.01)
    end
% ......................................................................    
else
    fprintf('\nA quantidade de elos informados está incorreta\n')
    % Transformação Rotacional em z
    theta = 0;
    TZ = [cosd(theta) -sind(theta) 0 0;
          sind(theta)  cosd(theta) 0 3;
             0         0           1 1;
             0         0           0 1];
    for linha2 = 1:2
        VT = TZ*[PIv'; ones(1,length(PIv))];
        V = VT(1:3,:)';
        PI(linha2).Vertices = V;
    end
end