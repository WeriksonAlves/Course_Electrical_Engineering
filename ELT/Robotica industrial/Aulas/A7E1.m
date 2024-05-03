% Werikson Alves - 96708
% Aula 07 DE ELT 476 (14/07/22)
%==========================================================================
% Limpar todas as variaveis, janelas e o command window
close all; clear all; clc;

% Procura o diretorio com todos os arquivos relacionados ao projeto
PastaAtual = pwd;
PastaRaiz = 'ELT 476';
cd(PastaAtual(1:(strfind(PastaAtual,PastaRaiz)+numel(PastaRaiz)-1)))
addpath(genpath(pwd))
%% Cinematica inversa
% Parametros dados
Pi = [1 2 0];
Pf = [3 2 1];
d1 = 3;

% Calculo dos outros parametros
Ti = atand(-Pi(1)/Pi(2));
d2i = Pi(3)-d1;
d3i = sqrt((Pi(1)^2)+(Pi(2)^2));

Tf = atand(-Pf(1)/Pf(2));
d2f = Pf(3)-d1;
d3f = sqrt((Pf(1)^2)+(Pf(2)^2));
%%


%Calculo da matriz de DH
c1 = cosd(Ti);
s1 = sind(Ti);
A01 = [c1 -s1 0 0;
       s1  c1 0 0;
       0   0  1 d1;
       0   0  0 1];
A12 = [1  0  0 0;
       0  0  1 0;
       0 -1  0 d2i;
       0  0  0 1];
A23 = [1 0 0 0;
       0 1 0 0;
       0 0 1 d3i;
       0 0 0 1];
A02 = A01*A12;
A03 = A02*A23;


