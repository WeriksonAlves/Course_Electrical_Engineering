%% Fazer a figura anterior rotacionar

% Limpar todas as variaveis, janelas e o command window
close all; clear all; clc;

h = patch([1 -1 -1],[0 1 -1],[0 0 0],[1 0 0]);
theta = 45;

% Transformação Rotacional em y
Roty = [[cosd(theta)  0 sind(theta)];
       [         0  1          0];
       [-sind(theta) 0 cosd(theta)]];
 
h.Vertices = (Roty*h.Vertices')'
axis([-.5 1.5 -1.5 1.5 -1.5 1.5])

axis equal
view(30,30)

xlabel('x')
ylabel('y')
zlabel('z')
grid on