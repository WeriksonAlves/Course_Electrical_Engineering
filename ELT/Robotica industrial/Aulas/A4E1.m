% Werikson Alves - 96708
% Aula 04 DE ELT 476 (09/06/22)
%==========================================================================
%% Dado um ponto qualquer no espaço de atuação, o braço deve
%ir até este ponto por meio de TR. 
%Usar os dois blocos da aula 3.

% Limpar todas as variaveis, janelas e o command window
close all; clear all; clc;

% % Procura o diretorio com todos os arquivos relacionados ao projeto
% PastaAtual = pwd;
% PastaRaiz = 'ELT 476';
% cd(PastaAtual(1:(strfind(PastaAtual,PastaRaiz)+numel(PastaRaiz)-1)))
% addpath(genpath(pwd))

%Posição final do efetuador
x = 6;%Coordenada x
y = 0;%Coordenada y
z = 2.01;%Coordenada z
plot3(x,y,z,'s')

%Dados construtivos dos links
a1 = 6;%Tamanho do link inferior
a2 = 3;%Tamanho do link superior 
h1 = 1;%Altura do link inferior
h2 = 1;%Altura do link superior
d = 0.4*a1;%Desconto das juntas

%Calcula os angulos de rotação dos elos
[Teta1,Teta2] = CalculaAngulo(0.6*a1,0.8*a2,x,y);
Passo = 0.005;

%Cria o link inferior
[PI_FT, PI_FL, PI_V] = CriaElo(10,a1,h1);
PI(1) = patch('vertice',PI_V,'faces',PI_FT,...
    'FaceAlpha',0.9,'FaceColor',[0 0 1]);
PI(2) = patch('vertice',PI_V,'faces',PI_FL,...
    'FaceAlpha',0.9,'FaceColor',[0 1 0]);

%Cria o link superior
[PS_FT, PS_FL, PS_V] = CriaElo(20,a2,h2);
PS(1) = patch('vertice',PS_V,'faces',PS_FT,...
    'FaceAlpha',0.9,'FaceColor',[0 1 1]);
PS(2) = patch('vertice',PS_V,'faces',PS_FL,...
    'FaceAlpha',0.9,'FaceColor',[1 0 0]);

%Define os eixos gráficos
axis([-10 10 -10 10 -1 3])
view(30,30)
xlabel('x')
ylabel('y')
zlabel('z')
grid on

%Gira o link superior
fprintf('\nGirando link superior.\n')
% Clona os vertices
for L1 = 1:2
    PS1(L1).Vertices = PS(L1).Vertices;
end

for T2 = 0:Passo:Teta2
    % Transformação Rotacional em z
    PS1TZ = [cos(T2) -sin(T2) 0 a1-d;
             sin(T2) cos(T2) 0 0;
             0 0 1 h1;
             0 0 0 1];
    for L2 = 1:2
        PS1VT = PS1TZ*[PS1(L2).Vertices'; ones(1,length(PS1(L2).Vertices))];
        PS1V = PS1VT(1:3,:)';
        PS(L2).Vertices = PS1V;
    end
    PS.Vertices;
    pause(0.01)
end   

fprintf('\nMovendo dois links.\n')
for L3 = 1:2
    PS2(L3).Vertices = PS(L3).Vertices;
    PI2(L3).Vertices = PI(L3).Vertices;
end

for T1 = 0:Passo:Teta1
    % Transformação Rotacional em z
    PI2TZ = [cos(T1) -sin(T1) 0 0;
             sin(T1)  cos(T1) 0 0;
             0 0 1 0;
             0 0 0 1];
    for L4 = 1:2
        %Superior
        PS2VT = PI2TZ*[PS2(L4).Vertices'; ones(1,length(PS2(L4).Vertices))];
        PS2V = PS2VT(1:3,:)';
        PS(L4).Vertices = PS2V;
        %Inferior
        PI2VT = PI2TZ*[PI2(L4).Vertices'; ones(1,length(PI2(L4).Vertices))];
        PI2V = PI2VT(1:3,:)';
        PI(L4).Vertices = PI2V;            
    end
    PI.Vertices;
    PS.Vertices;
    pause(0.01)
end