% Werikson Alves - 96708
% Aula 02 DE ELT 476 (19/05/22)
%==========================================================================
%% Cria uma figura a partir dos vertices

% Limpar todas as variaveis, janelas e o command window
close all; clear all; clc;

% n= patch([x],[y],[z],[R G B])
% h(az a figura e a colore, seguindo os pontos especificados

%Exemplo: V1 = [1 0 0] V2 = [-1 1 0] V3 = [-1 -1 0] Um triângulo
h = patch([1 -1 -1],[0 1 -1],[0 0 0],[1 0 0])
