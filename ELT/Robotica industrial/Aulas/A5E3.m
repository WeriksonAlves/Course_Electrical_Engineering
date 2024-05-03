% Werikson Alves - 96708
% Aula 05 DE ELT 476 (23/06/22)
%==========================================================================
%% Criar uma nuvens de pontos variando teta1 e teta 2 a cada grau no 
% intervalo de -180 a 180.

% Limpar todas as variaveis, janelas e o command window
close all; clear all; clc;

% Procura o diretorio com todos os arquivos relacionados ao projeto
PastaAtual = pwd;
PastaRaiz = 'ELT471';
cd(PastaAtual(1:(strfind(PastaAtual,PastaRaiz)+numel(PastaRaiz)-1)))
addpath(genpath(pwd))

%Dados construtivos dos links
a1 = 445;%Tamanho do link inferior
a2 = 355;%Tamanho do link superior 
h1 = 0.25;%Altura do link inferior
h2 = 0.25;%Altura do link superior
Passo = deg2rad(1);
% Theta1 = -90:90;
% Theta2 = -130:130;
extra = 100;


%Cria o link superior
[PS_FT, PS_FL, PS_V] = CriaElo2(8,a2,h2);
PS(1) = patch('vertice',PS_V,'faces',PS_FT,...
    'FaceAlpha',0.9,'FaceColor',[0 1 1]);
PS(2) = patch('vertice',PS_V,'faces',PS_FL,...
    'FaceAlpha',0.9,'FaceColor',[1 0 0]);

%Cria o link inferior
[PI_FT, PI_FL, PI_V] = CriaElo2(8,a1,h1);
PI(1) = patch('vertice',PI_V,'faces',PI_FT,...
    'FaceAlpha',0.9,'FaceColor',[0 0 1]);
PI(2) = patch('vertice',PI_V,'faces',PI_FL,...
    'FaceAlpha',0.9,'FaceColor',[0 1 0]);

%Define os eixos gráficos
axis([-(a1+a2+extra) (a1+a2+extra) -(a1+a2+extra) (a1+a2+extra) -1 (h1+h2+1)])
view(30,30)
xlabel('x')
ylabel('y')
zlabel('z')
grid on

% Clona principal dos vertices
for L1 = 1:2 
    PS1(L1).Vertices = PS(L1).Vertices;
    PI1(L1).Vertices = PI(L1).Vertices;
end

% Etapa 1..................................................................
fprintf('\nPosiciona os links.\n')
Posiciona1 = [cos(deg2rad(-130)) -sin(deg2rad(-130)) 0  a1;
              sin(deg2rad(-130)) cos(deg2rad(-130))  0  0;
              0          0           1  h1;
              0          0           0  1];
          
for L11 = 1:2
    VetorTempS1 = Posiciona1*[PS1(L11).Vertices'; ones(1,length(PS1(L11).Vertices))];
    VetorVertS1 = VetorTempS1(1:3,:)';
    PS(L11).Vertices = VetorVertS1;
end

PS.Vertices;
pause(0.01)

% Etapa 2..................................................................
fprintf('\nMovendo o link superior e inferior.\n')
for L2 = 1:2
    PS2(L2).Vertices = PS(L2).Vertices;
    PI2(L2).Vertices = PI(L2).Vertices;
end

for T2 = deg2rad(90):-Passo:deg2rad(-90)% Transformação Rotacional em z
    Theta1 = T2;
    Rotz2 = [cos(Theta1) -sin(Theta1) 0 0;
             sin(Theta1)  cos(Theta1) 0 0;
             0 0 1 0;
             0 0 0 1];
    for L2 = 1:2
        %Superior
        VetorTempS2 = Rotz2*[PS2(L2).Vertices'; ones(1,length(PS2(L2).Vertices))];
        VetorVertS2 = VetorTempS2(1:3,:)';
        PS(L2).Vertices = VetorVertS2;
        %Inferior
        VetorTempI2 = Rotz2*[PI2(L2).Vertices'; ones(1,length(PI2(L2).Vertices))];
        VetorVertI2 = VetorTempI2(1:3,:)';
        PI(L2).Vertices = VetorVertI2;            
    end
    Efetuador=VetorVertS2;%Parte superior
    PI.Vertices;
    PS.Vertices;
    hold on
    plot3(Efetuador(13,1),Efetuador(13,2),Efetuador(13,3),'.')
    pause(0.01)
end

% Etapa 3..................................................................
fprintf('\nMovendo o link superior.\n')
for T3 = deg2rad(140):Passo:deg2rad(270)
    Theta2 = T3;
    Rotz3 = [cos(Theta2) -sin(Theta2) 0 a1*cos(Theta1);
            sin(Theta2)  cos(Theta2) 0 a1*sin(Theta1);
            0        0       1  h1;
            0        0       0  1];
    for L33 = 1:2
        VetorTempS3 = Rotz3*[PS1(L33).Vertices'; ones(1,length(PS1(L33).Vertices))];
        VetorVertS3 = VetorTempS3(1:3,:)';
        PS(L33).Vertices = VetorVertS3;
    end
    Efetuador=VetorVertS3;%Parte superior
    hold on
    plot3(Efetuador(13,1),Efetuador(13,2),Efetuador(13,3),'.')
    PS.Vertices;
    pause(0.01)
end

% Etapa 4..................................................................
fprintf('\nMovendo o link superior e inferior.\n')
for L4 = 1:2
    PS4(L4).Vertices = PS(L4).Vertices;
    PI4(L4).Vertices = PI(L4).Vertices;
end

for T4 = deg2rad(0):Passo:deg2rad(180)% Transformação Rotacional em z
    Theta1 = T4;
    Rotz4 = [cos(Theta1) -sin(Theta1) 0 0;
             sin(Theta1)  cos(Theta1) 0 0;
             0 0 1 0;
             0 0 0 1];
    for L4 = 1:2
        %Superior
        VetorTempS4 = Rotz4*[PS4(L4).Vertices'; ones(1,length(PS4(L4).Vertices))];
        VetorVertS4 = VetorTempS4(1:3,:)';
        PS(L4).Vertices = VetorVertS4;
        %Inferior
        VetorTempI4 = Rotz4*[PI4(L4).Vertices'; ones(1,length(PI4(L4).Vertices))];
        VetorVertI4 = VetorTempI4(1:3,:)';
        PI(L4).Vertices = VetorVertI4;            
    end
    Efetuador=VetorVertS4;%Parte superior
    PI.Vertices;
    PS.Vertices;
    hold on
    plot3(Efetuador(13,1),Efetuador(13,2),Efetuador(13,3),'.')
    pause(0.01)
end

% Etapa 5..................................................................
fprintf('\nMovendo o link superior.\n')
for T5 = deg2rad(90):Passo:deg2rad(220)
    Theta2 = T5;
    Rotz5 = [cos(Theta2) -sin(Theta2) 0 a1*cos(deg2rad(90));
             sin(Theta2)  cos(Theta2) 0 a1*sin(deg2rad(90));
             0        0       1  h1;
             0        0       0  1];
    for L5 = 1:2
        VetorTempS5 = Rotz5*[PS1(L5).Vertices'; ones(1,length(PS1(L5).Vertices))];
        VetorVertS5 = VetorTempS5(1:3,:)';
        PS(L5).Vertices = VetorVertS5;
    end
    Efetuador=VetorVertS5;%Parte superior
    hold on
    plot3(Efetuador(13,1),Efetuador(13,2),Efetuador(13,3),'.')
    PS.Vertices;
    pause(0.01)
end

% Etapa 6..................................................................
fprintf('\nMovendo o link superior e inferior.\n')
for L6 = 1:2
    PS6(L6).Vertices = PS(L6).Vertices;
    PI6(L6).Vertices = PI(L6).Vertices;
end

for T6 = deg2rad(0):-Passo:deg2rad(-180)% Transformação Rotacional em z
    Theta1 = T6;
    Rotz6 = [cos(Theta1) -sin(Theta1) 0 0;
             sin(Theta1)  cos(Theta1) 0 0;
             0 0 1 0;
             0 0 0 1];
    for L66 = 1:2
        %Superior
        VetorTempS6 = Rotz6*[PS6(L66).Vertices'; ones(1,length(PS6(L66).Vertices))];
        VetorVertS6 = VetorTempS6(1:3,:)';
        PS(L66).Vertices = VetorVertS6;
        %Inferior
        VetorTempI6 = Rotz6*[PI6(L66).Vertices'; ones(1,length(PI6(L66).Vertices))];
        VetorVertI6 = VetorTempI6(1:3,:)';
        PI(L66).Vertices = VetorVertI6;            
    end
    Efetuador=VetorVertS6;%Parte superior
    PI.Vertices;
    PS.Vertices;
    hold on
    plot3(Efetuador(13,1),Efetuador(13,2),Efetuador(13,3),'.')
    pause(0.01)
end