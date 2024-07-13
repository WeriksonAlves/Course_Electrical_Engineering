%% Prática 2 de ELT 451 Werikson F O Alves

% Procura o diretorio com todos os arquivos relacionados ao projeto
% Procura o diretorio com todos os arquivos relacionados ao projeto
PastaAtual = pwd;
PastaRaiz = 'ELT451';
cd(PastaAtual(1:(strfind(PastaAtual,PastaRaiz)+numel(PastaRaiz)-1)))
addpath(genpath(pwd))

%% 
% Exercicio 1: 
% Implementar uma rotina que gere uma classe (no plano) com distribuição 
% gaussiana. As variáveis de entrada são os parâmetros da distribuição 
% (média e variância, nesse caso) e a saída são os vetores de abscissa e 
% ordenada. Em seguida, faça uma rotina para geração de classe com 
% distribuição uniforme. Exemplo: Figura

% Exercicio 2:
% Crie uma função para medir a distorção (em dB) entre duas séries 
% temporais1.

% Limpa o workspace, command window e fecha as janelas
%clear; clc; close all;

MX = 19;   %Media em X
MY = 37;   %Media em Y
VX = 51;    %Varianca em X
VY = 86;    %Varianca em X
QP = 10^3; %Quantidade de pontos

% Use "Gaussiana" ou "Uniforme" para escolher o tipo de distribuição a ser
% usada
Distribuicao("Gaussiana",MX,MY,VX,VY,QP); 
Distribuicao("Uniforme",MX,MY,VX,VY,QP);