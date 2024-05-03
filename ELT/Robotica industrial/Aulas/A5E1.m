% Werikson Alves - 96708
% Aula 05 DE ELT 476 (23/06/22)
%==========================================================================
%% 1-Criar um volume de trabalho do manipulador planar considerando os 
% limites do manipulador.

% Limpar todas as variaveis, janelas e o command window
close all; clear all; clc;

% Procura o diretorio com todos os arquivos relacionados ao projeto
PastaAtual = pwd;
PastaRaiz = 'ELT 476';
cd(PastaAtual(1:(strfind(PastaAtual,PastaRaiz)+numel(PastaRaiz)-1)))
addpath(genpath(pwd))

%Dados construtivos dos links
a1 = 3;%Tamanho do link inferior
a2 = 2;%Tamanho do link superior 
h1 = 0.25;%Altura do link inferior
h2 = 0.25;%Altura do link superior
d = 1;%Desconto das juntas
Passo = deg2rad(5);

%Cria o link superior
[PS_FT, PS_FL, PS_V] = CriaElo2(8,a2,h2);
PS(1) = patch('vertice',PS_V,'faces',PS_FT,...
    'FaceAlpha',0.9,'FaceColor',[0 1 1]);
PS(2) = patch('vertice',PS_V,'faces',PS_FL,...
    'FaceAlpha',0.9,'FaceColor',[1 0 0]);

%Cria o link inferior
[PI_FT, PI_FL, PI_V] = CriaElo2(8,a1,h1);
PI(1) = patch('vertice',PI_V,'faces',PI_FT,...
    'FaceAlpha',0.9,'FaceColor',[0 0 1]);
PI(2) = patch('vertice',PI_V,'faces',PI_FL,...
    'FaceAlpha',0.9,'FaceColor',[0 1 0]);

%Define os eixos gráficos
axis([-10 10 -10 10 -0.5 1.5])
view(30,30)
xlabel('x')
ylabel('y')
zlabel('z')
grid on

%Gira o link superior
[PS] = RotacionaPS(PS,Passo,0,pi,a1,0,h1);
[PI,PS] = RotacionaPI(PI,PS,Passo,0,2*pi,0,0,0);
[PS] = RotacionaPS(PS,Passo,pi,2*pi,a1-d,0,0);
[PI,PS] = RotacionaPI(PI,PS,Passo,0,2*pi,0,0,0);
