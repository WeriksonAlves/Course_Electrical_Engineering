%%
% Código para projeto do controlador por avanço de fase
% Autor: Deus está vendo
%
%O suposto controlador será:
    % Gav = Kat * beta * ( (Ts + 1)/(T alfa s + 1) ) com 0 < alfa < 1
    % Gav = Kat *( (s + Z)/(s + P) )
% Cosiderações:
    % alfa  Atenuação
    % cor   De +5º a +12º  
    % Gat   Controlador por atraso de fase
    % GcG   FT de MA do sistema compensado
    % G1    Sistema com o ganho ajustado, mas não compensado
    % K2    Abreviação de Kat*beta
    % Ka    Constante do erro aceleração
    % Kat   Ganho do controlador
    % Kp    Constante do erro estático
    % Kv    Constante do erro velocidade
    % MF    Margem de fase
    % MG    Margem de ganho
    % P1    Polo do controlador de avanço
    % Z1    Zero do controlador de avanço
%% Parametros iniciais
clear; close all; clc; syms x positive; 
    % FT de MA
        num_G = 120000;
        den1 = [1 10 0];
        den2 = [1 60];
        den_G = conv(den1,den2);
        %den_G = poly([-6 -21]);
        G = tf(num_G,den_G);
        

    %Margens
        MF = 40; % Completar eqn corretamente
        MG = 8;  % Completar eqn corretamente
        Kp = 0;                                           %Não usado ainda
        Kv = 0;                                           %Não usado ainda
        Ka = 0;                                           %Não usado ainda
        cor= 5;  % Completar eqn corretamente
        K2 = 1/200;  % Completar eqn corretamente
        G1 = K2*G;
        eqnfase = -90*pi/180 - atan(x/10) - atan(x/60);   % Completar eqn corretamente
        eqnmod = 120000/(sqrt(100+x^2)*sqrt(60^2+x^2)); % Completar eqn corretamente

fprintf('Para uma MF inicial de %dº e uma MG inicial de %d.',MF,MG)
[Gm,Fm,WcF,WcG] = margin(G1);
GmdB = 20*log10(Gm);
display('Valores para Sistema com o ganho ajustado, mas não compensado: ');
fprintf('\nG1 tem margem de fase de %fº em %f rad/s.',Fm,WcG);
fprintf('\nG1 tem margem de modulo de %f em %f rad/s.',GmdB,WcF);

% Calculando beta e Wc
phi = MF - 180 + cor; %Graus
Wc = solve(eqnfase == phi*(pi/180),x,'PrincipalValue', true)
Wcsimp = input('\n Insira o valor simplificado de Wc: '); % Complete com o valor simplificado
An = subs(-20*log10(eqnmod),Wcsimp) %Para usar deve-se aplica log na em eqnmod acima.
Ansimp = input('\n Insira o valor simplificado de An: ');
%beta = 10^(Ansimp/(-20));

beta = subs(eqnmod,Wcsimp)
betasimp = input('\n Insira o valor simplificado de Beta: '); % Complete com o valor simplificado

% Calculando o polo e o zero do coontrolador
Z = Wcsimp/10;
P = Z/betasimp;
Kat = K2/betasimp;

% Montando Gc
Gc = Kat * tf([1 Z],[1 P])
GcG =Gc*G

w = logspace(-2,5,100);
bode(G,w);
grid on
hold on

bode(GcG,w);
grid on
title('Diagrama de Bode: Comparação entre G(s) e GcG(s)')
legend('[G(s)]','[GcG(s)]');

[Gm1,Fm1,WcF1,WcG1] = margin(GcG);
Gm1dB = 20*log10(Gm1);

fprintf('\n O valor do Zero (Z) é %d.\n O valor do Polo (P) é %f.\n O valor do ganho (Kc) é %f.\n',Z,P,Kat);
display('Valores para Sistema com o ganho ajustado e compensado: ');
fprintf('\nG1 tem margem de fase de %fº em %f rad/s.',Fm1,WcG1);
fprintf('\nG1 tem margem de modulo de %f dB em %f rad/s.',Gm1dB,WcF1);

    
  