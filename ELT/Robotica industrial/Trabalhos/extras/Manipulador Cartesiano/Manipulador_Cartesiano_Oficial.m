% Trabalho de ELT476
% Simulação de um Manipoulador Cartesiano
% Werikson Alves - 96708
%==========================================================================
% Limpar todas as variaveis, janelas e o command window
close all; clear all; clc;

% Procura o diretorio com todos os arquivos relacionados ao projeto
PastaAtual = pwd;
PastaRaiz = 'Manipulador Cartesiano';
cd(PastaAtual(1:(strfind(PastaAtual,PastaRaiz)+numel(PastaRaiz)-1)))
addpath(genpath(pwd))

%% Parte 1: Entrada dos dados
% O manipulador possui tamanho maximo de 100 mm em todos os eixos, tendo um
% espaço de trabalho maximo de 100x100x100 começando na origem.

% Ponto inicial e final do efetuador em mm.
qi = [0,0,0]'; 
qf = [100,50,100]'; 
    
% Modelo de cinematica utilizada
%Tipo = "Inversa"; 
Tipo = "Direta";

x0 = 0; y0 = 0; z0 = 0; % [mm] Deslocamento da base do manipulador cartesiano
phi = 0; theta = 0; psi = 0; % [rad] Orientação da base do manipulador cartesiano

ti = 0; % [s] Tempo inicial da simulação
tf = 1; % [s] Tempo final da simulação

% Derivada dos pontos
qid = [0 0 0]';
qfd = [0 0 0]';
Matriz_q = [qi qid qf qfd]';

d0 = 20; a4 = 15; %[mm] Considerações físicas do manipulador

% Parte 2: Faz uma linha no espaço de trabalho

%Estrategia_Polinomial(ti,tf,Matriz_q,Tipo,d0,a4,x0,y0,z0,phi,theta,psi);

%% Parte 2: Cálculo dos parametros e imagem inicail do manipulador
% 
%
eixoz=50;

% for eixoz = 0:10:90
    for eixoy = 0:10:90
        for eixox = 0:10:90
            qi = [eixox,eixoy,eixoz]';
            eixox1 = eixox + 10;
            qf = [eixox1,eixoy,eixoz]';
            Matriz_q = [qi qid qf qfd]';
            
            [base,link_0,link_1,link_2,link_3,link_4] = Estrategia_Polinomial(ti,tf,qi,qf,Tipo,x0,y0,z0,phi,theta,psi);
            delete(base),delete(link_0),delete(link_1),delete(link_2),delete(link_3),delete(link_4)

        end
    end
% end
    

