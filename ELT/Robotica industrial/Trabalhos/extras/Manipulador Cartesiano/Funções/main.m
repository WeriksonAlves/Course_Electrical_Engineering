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

%% Parte 1: Entrada dos dados basicos e imagem estatica do manipulador

% O manipulador possui tamanho maximo de 100 mm em todos os eixos, tendo um
% espaço de trabalho maximo de 100x100x100 começando na origem.

Maximo = [98.5,98.5,98.5]'; % Ponto Maximo do efetuador 
Minimo = [1.5,1.5,1.5]'; % Ponto minimo do efetuador

% Modo 1: Faz uma reta no espaço
% Modo 2: Faz o espaço de trabalho
% Modo 3: Espaço livre para o usuario
Modo = 1;
ti = 0; % [s] Tempo inicial da simulação
tf = 1; % [s] Tempo final da simulação
Passo = 15;
Tipo = "Direta"; 
%Tipo = "Direta";
qf = [48.5,54,60]';

x0 = 0; y0 = -48.5; z0 = 0; % [mm] Deslocamento da base do manipulador cartesiano
phi = 0; theta = 0; psi = 0; % [rad] Orientação da base do manipulador cartesiano
%%
if Tipo == "Inversa"
    Inicio = [60,48.5,49]';
    [base,link_0,link_1,link_2,link_3,link_4] = Estrategia_Polinomial(0,1,Inicio,Inicio,Tipo,x0,y0,z0,phi,theta,psi);
elseif Tipo == "Direta"
    Inicio = [48.5,54,60]';
    [base,link_0,link_1,link_2,link_3,link_4] = Estrategia_Polinomial(0,1,Inicio,Inicio,Tipo,x0,y0,z0,phi,theta,psi);
end

if Modo == 1
    % Parte 2: Faz uma reta qualquer no espaço
    qi = Inicio; 
    % Parte 2: Faz uma linha no espaço de trabalho
    delete(base),delete(link_0),delete(link_1),delete(link_2),delete(link_3),delete(link_4)
    [base,link_0,link_1,link_2,link_3,link_4] = Estrategia_Polinomial(ti,tf,qi,qf,Tipo,x0,y0,z0,phi,theta,psi);

elseif Modo == 2
    % Parte 3: Desenha o espaço de trabalho
    
    % Move para o ponto minimo do efetuador e depois faz o worksapce.
    qi = Inicio;
    qf = Minimo;
    % Parte 2: Faz uma linha no espaço de trabalho
    delete(base),delete(link_0),delete(link_1),delete(link_2),delete(link_3),delete(link_4)
    [base,link_0,link_1,link_2,link_3,link_4] = Estrategia_Polinomial(0,3,qi,qf,Tipo,x0,y0,z0,phi,theta,psi);

    Iday = 1;
    Idaz = 1;
    
    for z = Minimo(3):Passo:Maximo(3)
        if Idaz == 1
            for y = Minimo(2):Passo:Maximo(2)
                if Iday == 1
                    for x = Minimo(1):Passo:Maximo(1)
                        qi = [x,y,z]';
                        qf = [x+Passo,y,z]';
                        delete(base),delete(link_0),delete(link_1),delete(link_2),delete(link_3),delete(link_4)
                        [base,link_0,link_1,link_2,link_3,link_4] = Estrategia_Polinomial(ti,tf,qi,qf,Tipo,x0,y0,z0,phi,theta,psi);
                    end
                    Iday = 0;
                elseif Iday == 0
                    for x = Maximo(1):-Passo:Minimo(1)
                        qi = [x,y,z]';
                        qf = [x-Passo,y,z]';
                        delete(base),delete(link_0),delete(link_1),delete(link_2),delete(link_3),delete(link_4)
                        [base,link_0,link_1,link_2,link_3,link_4] = Estrategia_Polinomial(ti,tf,qi,qf,Tipo,x0,y0,z0,phi,theta,psi);
                    end
                    Iday = 1;
                end
            end
            Idaz = 0;
        elseif Idaz == 0
            for y = Maximo(2):-Passo:Minimo(2)
                if Iday == 1
                    for x = Minimo(1):Passo:Maximo(1)
                        qi = [x,y,z]';
                        qf = [x+Passo,y,z]';
                        delete(base),delete(link_0),delete(link_1),delete(link_2),delete(link_3),delete(link_4)
                        [base,link_0,link_1,link_2,link_3,link_4] = Estrategia_Polinomial(ti,tf,qi,qf,Tipo,x0,y0,z0,phi,theta,psi);
                    end
                    Iday = 0;
                elseif Iday == 0
                    for x = Maximo(1):-Passo:Minimo(1)
                        qi = [x,y,z]';
                        qf = [x-Passo,y,z]';
                        delete(base),delete(link_0),delete(link_1),delete(link_2),delete(link_3),delete(link_4)
                        [base,link_0,link_1,link_2,link_3,link_4] = Estrategia_Polinomial(ti,tf,qi,qf,Tipo,x0,y0,z0,phi,theta,psi);
                    end
                    Iday = 1;
                end
            end
            Idaz = 1;
        end
    end
    
elseif Modo == 3
    % Parte 3: Extra
end