%%
% Código para projeto do controlador por avanço de fase
% Autor: Zé pequeno 1
%
%O suposto controlador será:
    % Gav = Kav * alfa * ( (Ts + 1)/(T alfa s + 1) ) com 0 < alfa < 1
    % Gav = Kav *( (s + Z)/(s + P) )
% Cosiderações:
    % alfa  Atenuação
    % cor   De +5º a +12º  
    % Gav   Controlador por avanço de fase
    % GcG   FT de MA do sistema compensado
    % G1    Sistema com o ganho ajustado, mas não compensado
    % K1    Abreviação de Kav*alfa
    % Ka    Constante do erro aceleração
    % Kav   Ganho do controlador
    % Kp    Constante do erro estático
    % Kv    Constante do erro velocidade
    % MF    Margem de fase
    % MG    Margem de ganho
    % P1    Polo do controlador de avanço
    % Z1    Zero do controlador de avanço

%% Parametros iniciais
clear; close all; clc; syms x positive; 
    % FT de MA
        num_G = 1;
        den1 = [1 1 0];
        den2 = [0.1 1];
        den_G = conv(den1,den2);
        %den_G = poly([-6 -21]);
        G = tf(num_G,den_G);
       
    %Margens
        MF = 45; % Completar eqn corretamente
        MG = 8;  % Completar eqn corretamente
        Kp = 0;                                           %Não usado ainda
        Kv = 0;                                           %Não usado ainda
        Ka = 0;                                           %Não usado ainda
        cor= 12;  % Completar eqn corretamente
        K1 = 4;  % Completar eqn corretamente
        G1 = K1*G;
        eqnfase = -90*pi/180 - atan(x/1) - atan(0.1*x);   % Completar eqn corretamente
        eqnmod = 4/(sqrt(1+(0.1*x)^2)*sqrt(1^2+x^2)); % Completar eqn corretamente

fprintf('Para uma MF inicial de %dº e uma MG inicial de %d.',MF,MG)  
[Gm,Fm,WcF,WcG] = margin(G1);
GmdB = 20*log10(Gm);
display('Valores para Sistema com o ganho ajustado, mas não compensado: ');
fprintf('\nG1 tem margem de fase de %fº em %f rad/s.',Fm,WcG);
fprintf('\nG1 tem margem de modulo de %f em %f rad/s.',GmdB,WcF);

phi = MF - Fm + cor; %Graus
alfa = (1 - sin(phi*pi/180))/(1 + sin(phi*pi/180));
modG1 = - 20*log10(1/sqrt(alfa));

syms x positive
% Completar eqn corretamente
eqn = 20*log10(4) - 20*log10(x) - 20*log10(sqrt(0.01*x^2 +1)) - 20*log10(sqrt(x^2 + 1)); % == modG1;
Wc = solve(eqnmod==modG1,x,'PrincipalValue', true)

% Calculando o polo e o zero do coontrolador
Wcsimp = input('\n Insira o valor simplificado de Wc: '); % Complete com o valor simplificado
Z = Wcsimp*sqrt(alfa);
P = Wcsimp/sqrt(alfa);
Kav = K1/alfa;
fprintf('\n O valor do Zero (Z) é %d.\n O do Polo (P) é %d.\n O ganho (Kc) é %f.',Z,P,Kav);
% Montando Gc
Gc = Kav * tf([1 Z],[1 P])
GcG =Gc*G

figure(1)
w = logspace(-2,5,100);
bode(G,w);
grid on
hold on
%title('Diagrama de Bode de G1(s)')

%figure(2)
bode(GcG,w);
grid on
title('Diagrama de Bode: Comparação entre G(s) e GcG(s)')
legend('[G(s)]','[GcG(s)]');

[Gm1,Fm1,WcF1,WcG1] = margin(GcG);
Gm1dB = 20*log10(Gm1);
%[Gm1dB Fm1 WcF1 WcG1]

display('Valores para Sistema com o ganho ajustado e compensado: ');
fprintf('\nG1 tem margem de fase de %fº em %f rad/s.',Fm1,WcG1);
fprintf('\nG1 tem margem de modulo de %f em %f rad/s.',Gm1dB,WcF1);
