% Werikson Alves - 96708
% Aula 01 DE ELT 476 (19/05/22)
% Matriz de rotação

%% Calcula a matriz de rotação para um dado angulo.

% Limpar todas as variaveis, janelas e o command window
close all; clear all; clc;

%Ângulo de rotação desejado e abreviação trigonometrica
phi = input('Entre com valor do ângulo de rotação:'); 
c = cosd(phi);
s = sind(phi);
Rot = [[1 0 0];
     [0 c -s];
     [0 s c]];
 
% Imprimi a matriz de rotação R
fprintf('A matriz de rotação R, dado o ângulo %d graus é:\n',phi);
disp(Rot)
