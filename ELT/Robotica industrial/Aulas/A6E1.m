% Werikson Alves - 96708
% Aula 06 DE ELT 476 (07/07/22)
%==========================================================================
% Limpar todas as variaveis, janelas e o command window
close all; clear all; clc;

% Procura o diretorio com todos os arquivos relacionados ao projeto
PastaAtual = pwd;
PastaRaiz = 'ELT 476';
cd(PastaAtual(1:(strfind(PastaAtual,PastaRaiz)+numel(PastaRaiz)-1)))
addpath(genpath(pwd))
%% Plotar um caminho onde q0 = 0, q1~=1, q0~=q1 = 0, t=10s

ti = 0;
tf = 10;
Meqn = [1 ti ti^2 ti^3;
        0 1 2*ti 3*ti^2;
        1 tf tf^2 tf^3;
        0 1 2*tf 3*tf^2];  
Mq = [0 0 1 0]';
A = inv(Meqn)*Mq;
%%
x = [];
kk = 1;
t = tic;
tc = tic;
while toc(t) < tf
    if toc(tc) > 0.1
        tc = tic;
        q = A(1) + A(2)*toc(t) + A(3)*toc(t)^2 + A(4)*toc(t)^3;
        %qd = A(2)*t + 2*A(3)*t + 3*A(4)*t^2;        
        x(:,kk) = [toc(t);q];
        kk = kk+1;
    end
end
plot(x(1,:),x(2,:),'.');
grid on
