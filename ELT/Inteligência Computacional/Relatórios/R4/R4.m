%% Prática 4 de ELT 451 Werikson F O Alves

% Procura o diretorio com todos os arquivos relacionados ao projeto
% Procura o diretorio com todos os arquivos relacionados ao projeto
PastaAtual = pwd;
PastaRaiz = 'ELT451';
cd(PastaAtual(1:(strfind(PastaAtual,PastaRaiz)+numel(PastaRaiz)-1)))
addpath(genpath(pwd))

%% Exercício 1: Ajuste um perceptron para resolver o problema de 
% classificação de padrões contido nos arquivos entradasclassalunos.txt e 
% saidaclassalunos.txt, os quais contém entradas e saída desejada, 
% respectivamente. Após o treinamento, use o arquivo entradasclassteste.txt
% como entrada do perceptron e calcule o vetor de saída. Envie um arquivo 
% com o vetor de saída (use o arquivo submissaoperceptron.txt como 
% exemplo). Seu classificador será avaliado em um banco de dados de teste e
% sua nota nesta prática será o desempenho obtido.

% Limpa o workspace, command window e fecha as janelas
clear; clc; close all;

% entradasclassalunos = load('entradasclassalunos.txt');
% saidaclassalunos = load('saidaclassalunos.txt');
% 
% x = zeros(size(entradasclassalunos,1),size(entradasclassalunos,2)+1); %Entradas
% 
% %Monta os vetores de entradas
% for Linha = 1:size(entradasclassalunos,1)
%     x(Linha,:) = [1, entradasclassalunos(Linha,:)];
% end
% 
% %Monta a saida desejada
% for Linha = 1:size(saidaclassalunos,1)
%     d(Linha,:) = [saidaclassalunos(Linha,:)];
% end
%%
% x = load('entradasclassalunos.txt'); % Vetor de entradas
% d = load('saidaclassalunos.txt');    % Saída desejada
% w = randn(1,size(x,2));              % Vetor de pesos aleatórios
% eta = 0.1;                           % Taxa de aprendizagem
% epoca = 0;                           % Número de iterações
% tolerancia = 0.1;                    % Margem de erro

%%
% Limpa o workspace, command window e fecha as janelas
clear; clc; close all;
Matriz_entrada = [[0 0];[0 1];[1 0];[1 1]]; % Vetor de entradas
Saida_Desejada = [0;0;0;1];    % Saída desejada
Pesos0 = randn(1,size(Matriz_entrada,2));              % Vetor de pesos aleatórios
Bias0 = randn();
Eta = 0.1;                           % Taxa de aprendizagem
Maximo_Epocas = 100;                           % Número de iterações
Tolerancia = 0.1;                    % Margem de erro
%[Pesos,Bias,Erro_Medio,Erro_Epoca] = Perceptron(Pesos0,Bias0,Matriz_entrada,Saida_Desejada,Eta,Maximo_Epocas,Tolerancia)
