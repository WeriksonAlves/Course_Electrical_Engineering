%% Fazer 2 prismas, um apoiado no outro
%VT = [V'; ones(1,length(V))]
%V = VT(1:3,:)'

% Limpar todas as variaveis, janelas e o command window
close all; clear all; clc;

[fcb0, fcl0, Cv0] = criarprisma(4,1,1);% Cria o prisma
[fcb1, fcl1, v1] = criarprisma(8,1,1);% Cria o cilindro
%Prisma inferior
p(1) = patch('vertice',Cv0,'faces',fcb0,...
    'FaceAlpha',0.9,'FaceColor',[0 0 1]);
p(2) = patch('vertice',Cv0,'faces',fcl0,...
    'FaceAlpha',0.9,'FaceColor',[0 1 0]);
%Prisma superior superior
g(1) = patch('vertice',Cv0,'faces',fcb0,...
    'FaceAlpha',0.9,'FaceColor',[0 1 1]);
g(2) = patch('vertice',Cv0,'faces',fcl0,...
    'FaceAlpha',0.9,'FaceColor',[1 0 0]);
     
axis([-2 2 -2 2 -1 5])
view(30,30)
xlabel('x')
ylabel('y')
zlabel('z')
grid on

% Clona os vertices
for linha1 = 1:2
    g1(linha1).Vertices = g(linha1).Vertices;
end

for theta = 0:1:90
    % Transformação Rotacional em z
    TZ = [cosd(theta) -sind(theta) 0 0.5;
          sind(theta)  cosd(theta) 0 0.5;
             0         0           1 1;
             0         0           0 1];
    for linha2 = 1:2
        VT = TZ*[Cv0'; ones(1,length(Cv0))];
        V = VT(1:3,:)';
        g(linha2).Vertices = V;
    end
    g.Vertices;
    pause(0.01)
end