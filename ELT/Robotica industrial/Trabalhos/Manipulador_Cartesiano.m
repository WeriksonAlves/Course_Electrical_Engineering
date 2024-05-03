% Trabalho de ELT476
% Confecção e simulação de um Manipoulador Cartesiano
% Tiago
% Celso
% Hiago
% Werikson Alves - 96708
%==========================================================================
% Limpar todas as variaveis, janelas e o command window
close all; clear all; clc;

% Procura o diretorio com todos os arquivos relacionados ao projeto
PastaAtual = pwd;
PastaRaiz = 'ELT 476';
cd(PastaAtual(1:(strfind(PastaAtual,PastaRaiz)+numel(PastaRaiz)-1)))
addpath(genpath(pwd))
%%

% Dados da matriz de Devanit-Hartenberg
T0 = deg2rad(0);
d0 = 2;
a0 = 0;
A0 = deg2rad(90);

T1 = deg2rad(0);
d1 = 10;
a1 = 0;
A1 = deg2rad(-90);

T2 = deg2rad(-90);
d2 = 10;
a2 = 0;
A2 = deg2rad(-90);

T3 = deg2rad(0);
d3 = 10;
a3 = 0;
A3 = deg2rad(0);

T4 = deg2rad(90);
d4 = 0;
a4 = 2;
A4 = deg2rad(0);

DH = [[T0 d0 a1 A1];
      [T1 d1 a1 A1];
      [T2 d2 a2 A2];
      [T3 d3 a3 A3];
      [T4 d4 a4 A4]]
  
% Definição das matrizes de transformação 
AT0 = Matriz_Transformacao(T0,d0,a0,A0)
A01 = Matriz_Transformacao(T1,d1,a1,A1)
AT1 = AT0*A01
A12 = Matriz_Transformacao(T2,d2,a2,A2)
AT2 = AT1*A12
A23 = Matriz_Transformacao(T3,d3,a3,A3)
AT3 = AT2*A23
A34 = Matriz_Transformacao(T4,d4,a4,A4)
AT4 = AT3*A34
