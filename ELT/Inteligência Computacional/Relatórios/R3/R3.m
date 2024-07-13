%% Prática 3 de ELT 451 Werikson F O Alves

% Procura o diretorio com todos os arquivos relacionados ao projeto
% Procura o diretorio com todos os arquivos relacionados ao projeto
PastaAtual = pwd;
PastaRaiz = 'ELT451';
cd(PastaAtual(1:(strfind(PastaAtual,PastaRaiz)+numel(PastaRaiz)-1)))
addpath(genpath(pwd))

%% Exercício 1: Implemente uma função que crie um neurônio de 
% McCulloch-Pitts. Esta função receberá o vetor de entradas, o vetor de 
% pesos e o bias e retornará a saída calculada.

% Limpa o workspace, command window e fecha as janelas
clear; clc; close all;

disp('Exercício 1:')
Input_vector = randn(1,10);
Weights_vector = rand(1,10);
Threshold1 = 1;
Y = NMCP(Input_vector,Weights_vector,Threshold1) % Neurônio de McCulloch-Pitts

%% Exercício 2: Utilizando o neurônio implementado no item anterior, 
% modifique os pesos e o limiar de modo que o neurônio seja capaz de emular
% a função lógica NAND de dois bits. Mostre a reta de separação. Faça o 
% mesmo para as funções OR e XOR. Caso não seja possível encontrar uma reta
% de separação, discuta o motivo.

% Limpa o workspace, command window e fecha as janelas
clear; clc; close all;

disp('Exercício 2:')
Logical_input = [0 0; 0 1; 1 0; 1 1]

disp(' ')
NAND_Weights_vector = [-2 -2];
NAND_Threshold1 = 2;
NAND_Y = NMCP(Logical_input,NAND_Weights_vector,NAND_Threshold1)

disp(' ')
OR_Weights_vector = [3 3];
OR_Threshold1 = -3;
OR_Y = NMCP(Logical_input,OR_Weights_vector,OR_Threshold1)

disp(' ')
disp('XOR => Não tem como ')
XOR_Weights_vector = [-1 1];
XOR_Threshold1 = -1;
XOR_Y = NMCP(Logical_input,XOR_Weights_vector,XOR_Threshold1)

%% Exercício 3: A tabela a seguir apresenta alguns exemplos de tomada de 
% decisão que foram feitos por um especialista em análise de crédito. 
% Ajuste um neurônio artificial que simula as decisões do especialista. 
% Caso não seja possível encontrar uma reta de separação, discuta o motivo.

% Limpa o workspace, command window e fecha as janelas
clear; clc; close all;

disp('Exercício 3:')
Idade = [18; 19; 25; 40; 21; 22];
Idade = Idade./max(Idade);
Sexo = [1; 1; 0; 1; 1; 0]; % 1 para M e 0 para F
Casa = [0; 1; 0; 1; 0; 1]; % 1=S e 0=N
Carro = [1; 1; 0; 0; 0; 1]; % 1=S e 0=N
Casado = [0; 1; 1; 1; 0; 1]; % 1=S e 0=N
Filhos = [0; 1; 2; 4; 0; 2];
Filhos = Filhos./max(Filhos);
Renda = [1200; 700; 800; 800; 1100; 500];
Renda = Renda./max(Renda);
Resposta = [0; 1; 1; 0; 1; 0];
Credito = [Idade Sexo Casa Carro Casado Filhos Renda];

Threshold_3 = 0;
Solucao = "Errada";
Maximo =  5;
Minimo = -5;
Passo = 0.0001;
Contador = 0;
Weights_Final = zeros(1,8);
for I1 = Minimo:Passo:Maximo
    for I2 = Minimo:Passo:Maximo
        for I3 = Minimo:Passo:Maximo 
            for I4 = Minimo:Passo:Maximo 
                for I5 = Minimo:Passo:Maximo 
                    for I6 = Minimo:Passo:Maximo 
                        for I7 = Minimo:Passo:Maximo
                            for Threshold_3 = Minimo:Passo:Maximo
                                Weights = [I1, I2, I3, I4, I5, I6, I7];
                                YY = NMCP(Credito,Weights,Threshold_3);

                                Contador = Contador + 1;
                                if YY == Resposta
                                    Solucao = "Correta"
                                    Weights_Final = [[Weights_Final];[Weights] [Threshold_3]]
                                    Contador
                                else
                                    Solucao = "Errada"
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
                            



    
    




          