%% Fazer o prisma rotacionar 360º

% Limpar todas as variaveis, janelas e o command window
close all; clear all; clc;

% Inicializa o sistema de coordenadas, criando a orientação original

h(1) = patch([2 2 2 2],[0 3 3 0],[0 0 1 1],[0 0 0]);
h(2) = patch([2 0 0 2],[3 3 3 3],[0 0 1 1],[0 0 1]);
h(3) = patch([0 0 0 0],[3 0 0 3],[0 0 1 1],[0 1 0]);
h(4) = patch([0 2 2 0],[0 0 0 0],[0 0 1 1],[0 1 1]);
h(5) = patch([2 2 0 0],[0 3 3 0],[0 0 0 0],[1 0 0]);
h(6) = patch([2 2 0 0],[0 3 3 0],[1 1 1 1],[1 0 1]);

axis([-3 3 -3 5 -4 4])
view(30,30)
xlabel('x')
ylabel('y')
zlabel('z')
grid on

% Clona os vertices
for iii = 1:6
    h1(iii).Vertices = h(iii).Vertices;
end

for theta = 0:5:360
    % Transformação Rotacional em y
    Roty = [[cosd(theta)  0 sind(theta)];
            [         0   1           0];
            [-sind(theta) 0 cosd(theta)]];
    for ii = 1:6
        h(ii).Vertices = (Roty*h1(ii).Vertices')';
    end
    h.Vertices
    pause(0.01)
end