%% Cria o cilindro

% Limpar todas as variaveis, janelas e o command window
close all; clear all; clc;

r = 1; %Raio
n = 16; %Numero de lados
ang = 2*pi/n;

t = 0:ang:2*pi;
x = [cos(t) cos(t)];
y = [sin(t) sin(t)];
z = [zeros(1,length(t)) ones(1,length(t))];

Cv0 = [x;y;z]';

%Faces de cima e baixo
fcb0 = [1:n+1; n+2:2*(n+1)];
p(1) = patch('vertice',Cv0,'faces',fcb0,...
    'FaceAlpha',0.9,'FaceColor',[0.6 0 0]);

%Faces laterais
for linha2 = 1:n
    fl(linha2,:) = [linha2 linha2+1 n+linha2+2 n+linha2+1];
end

p(2) = patch('vertice',Cv0,'faces',fl,...
    'FaceAlpha',0.9,'FaceColor',[0 0.6 0]);

axis([-2 2 -2 2 -1 2])
view(30,30)
xlabel('x')
ylabel('y')
zlabel('z')
grid on
