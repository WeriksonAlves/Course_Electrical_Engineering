% Werikson Alves - 96708
% Aula 03 DE ELT 476 (02/06/22)
%==========================================================================
%% Cria um cilindro com N faces

% Limpar todas as variaveis, janelas e o command window
close all; clear all; clc;

F = 8;
V = [];
F_Lat = [[1 2 10 9];
         [2 3 11 10];
         [3 4 12 11];
         [4 5 13 12];
         [5 6 14 13];
         [6 7 15 14];
         [7 8 16 15];
         [8 1 9 16]];
     
F_F_T = [[1 2 3 4 5 6 7 8];
         [9 10 11 12 13 14 15 16]];

V = [];
for i = 0:(360/F):359
    V = [V;cosd(i),sind(i),0];
end
for i = 0:45:359
    V = [V;cosd(i),sind(i),2];
end
fft = patch('Vertices',V,'Faces',F_F_T,'Facecolor',[1 0 0]);
fla = patch('Vertices',V,'Faces',F_Lat,'Facecolor',[0 0 1]);
fla.FaceAlpha = 0.5;
axis([-2 2 -2 2 -1 5])
view(30,30)
xlabel('x')
ylabel('y')
zlabel('z')
grid on
