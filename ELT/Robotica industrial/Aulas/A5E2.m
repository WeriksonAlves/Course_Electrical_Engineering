% Werikson Alves - 96708
% Aula 05 DE ELT 476 (23/06/22)
%==========================================================================
%% Criar uma nuvens de pontos variando teta1 e teta 2 a cada grau no 
% intervalo de -180 a 180.

% Limpar todas as variaveis, janelas e o command window
close all; clear all; clc;

% Procura o diretorio com todos os arquivos relacionados ao projeto
PastaAtual = pwd;
PastaRaiz = 'ELT 476';
cd(PastaAtual(1:(strfind(PastaAtual,PastaRaiz)+numel(PastaRaiz)-1)))
addpath(genpath(pwd))

%Dados construtivos dos links
a1 = 3;%Tamanho do link inferior
a2 = 2;%Tamanho do link superior 
h1 = 0.25;%Altura do link inferior
h2 = 0.25;%Altura do link superior
%d = 1;%Desconto das juntas
Passo = deg2rad(10);


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
axis([-10 10 -10 10 -0.5 1.5])
view(30,30)
xlabel('x')
ylabel('y')
zlabel('z')
grid on

% Clona os vertices
for L1 = 1:2
    PS1(L1).Vertices = PS(L1).Vertices;
    PI1(L1).Vertices = PI(L1).Vertices;
end

for T1 = 0:Passo:2*pi    
    fprintf('\nMovendo dois links.\n')
    % Transformação Rotacional em z
    PI1TZ = [cos(T1) -sin(T1) 0 0;
             sin(T1)  cos(T1) 0 0;
             0        0       1 0;
             0        0       0 1];
    for L2 = 1:2
        %Superior
        PS1VT = PI1TZ*[PS1(L2).Vertices'; ones(1,length(PS1(L2).Vertices))];
        PS1V = PS1VT(1:3,:)';
        PS(L2).Vertices = PS1V;
        %Inferior
        PI1VT = PI1TZ*[PI1(L2).Vertices'; ones(1,length(PI1(L2).Vertices))];
        PI1V = PI1VT(1:3,:)';
        PI(L2).Vertices = PI1V;            
    end
    PI.Vertices;
    pause(0.01)
    
    %Gira o link superior
    fprintf('\nGirando link superior.\n')
    for T = 0:Passo:2*pi
        % Transformação Rotacional em z
        PS1TZ = [cos(T) -sin(T) 0 a1*cos(T1);
                 sin(T)  cos(T) 0 a1*sin(T1);
                 0        0     1 h1;
                 0        0     0 1];
        for L2 = 1:2
            PS2VT = PS1TZ*[PS1(L2).Vertices'; ones(1,length(PS1(L2).Vertices))];
            PS2V = PS2VT(1:3,:)';
            PS(L2).Vertices = PS2V;
        end
        Efetuador=PS2V;%Parte superior
        hold on
        plot3(Efetuador(13,1),Efetuador(13,2),Efetuador(13,3),'.')
        PS.Vertices;
        pause(0.01)
    end
end
