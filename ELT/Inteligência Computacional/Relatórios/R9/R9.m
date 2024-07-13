%% Prática 9 de ELT 451 Werikson F O Alves

clc
close all
clear all

% Procura o diretorio com todos os arquivos relacionados ao projeto
% Procura o diretorio com todos os arquivos relacionados ao projeto
% PastaAtual = pwd;
% PastaRaiz = 'ELT451';
% cd(PastaAtual(1:(strfind(PastaAtual,PastaRaiz)+numel(PastaRaiz)-1)))
% addpath(genpath(pwd))
%%
x = load('entradasclassalunos1.txt');
y = load('saidaclassalunos1.txt');
%%
genOpt = genfisOptions( 'GridPartition' );
genOpt.NumMembershipFunctions = 2;
genOpt.InputMembershipFunctionType = 'gaussmf' ;
inFIS = genfis(x,y,genOpt);
%%
opt = anfisOptions;
opt.InitialFIS = inFIS;
opt.EpochNumber = 2;
opt.ErrorGoal = 1;
opt.DisplayANFISInformation = 0;
opt.DisplayErrorValues = 0;
opt.DisplayStepSize = 0;
opt.DisplayFinalResults = 0;
%%
outFIS = anfis([x y],opt);
%%
plot(x,y,x,evalfis(outFIS,x))
legend( 'Dados de treinamento' , 'Saída ANFIS' )
