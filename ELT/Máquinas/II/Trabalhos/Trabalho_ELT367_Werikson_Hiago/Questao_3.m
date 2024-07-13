% Trabalho de Laboratório de Máquinas 2 - ELT 367
% Integrantes:
    % Werikson Alves 96708
    % Hiago Batista 96704
    
% Terceira Questão – No laboratório foi feito o ensaio para a determinação 
% das reatâncias síncronas de eixo direto e de eixo em quadratura, conforme
% tabela abaixo. Faça um programa de computador que possibilite traçar um 
% conjunto de curvas  da potência em p.u em função do ângulo de potência, 
% admitindo que a tensão da rede  e  a tensão de excitação sejam  de  1,0 
% p.u. Com base no programa obtém-se os gráficos:

clear all; close all; clc;

Wr = 1778; % velocidade do rotor
V_max = 59;
V_min = 58; 
Imaximo = [1.48 1.2 1.36]; % correntes mÃ¡ximas por fase
Iminimo = [1.15 1.14 1.16]; % correntes minimas por fase
I_max = sum(Imaximo)/3; % corrente maxima (mÃ©dia dos valores de fase)
I_min = sum(Iminimo)/3; % corrente minima (mÃ©dia dos valores de fase)

Sb = 2e3; % potencia aparente
Vb = 230; % tensÃ£o terminal de linha 
Zb = Vb^2/Sb; % impedÃ¢ncia base

Xd = (V_max/I_min)/Zb; % reatÃ¢ncia de eixo direto em pu
Xq = (V_min/I_max)/Zb; % reatÃ¢ncia em quadratura em pu
Xbar = 0.1; % impedÃ¢ncia da linha 

delta = linspace(0, pi, 100); % Ã¢ngulo delta de 0 a 180Â°

Vt = 1; % valor em pu
Ef = Vt;

Pf  = Vt* Ef.*sin(delta)/Xd ; % Potência devido a excitaÃ§Ã£o de campo
Pr  = (Vt^2*(Xd - Xq).*sin(2.*delta))/(2*Xd*Xq); % Potência devido a relutÃ¢ncia

P = Pf + Pr; % Potencia ativa 

% a) gerador ligado na rede elÃ©trica
% plotagem 
figure(1)
plot(delta,P, 'LineWidth',2.0)
hold on
plot(delta,Pf,'k','LineWidth',2.0)
plot(delta,Pr,'r','LineWidth',2.0)
grid on
title ('Gerador ligado na rede elétrica','Fontsize',18)
xlabel('Ângulo \delta','Fontsize',20)
ylabel('Potência','Fontsize',20')
legend('Pot. Ativa resultante','Pot. devido excitaÃ§Ã£o','Pot. devido relutÃ¢ncia','Fontsize',14)

% b) Gerador ligado na rede elétrica por meio de um barramento de 0,1 pu
Xq = (V_min/I_max)/Zb; % reatÃ¢ncia em quadratura
Xd = (V_max/I_min)/Zb; % reatÃ¢ncia de eixo direto 
Xbar = 0.1; 

Pfb = Vt* Ef.*sin(delta)/(Xd + Xbar); % Potência devido a excitaÃ§Ã£o de campo
Prb = (Vt^2*(Xd - Xq +Xbar).*sin(2.*delta))/(2*Xd*(Xq + Xbar)); % Potência devido a relutÃ¢ncia

Pb= Pfb + Prb;

figure(2)
plot(delta,Pb, 'LineWidth',2.0)
hold on
plot(delta,Pfb,'k','LineWidth',2.0)
plot(delta,Prb,'r','LineWidth',2.0)
grid on
title ('Gerador ligado na rede elétrica por meio de um barramento de 0,1 pu','Fontsize',18)
xlabel('Ângulo \delta','Fontsize',20)
ylabel('Potência','Fontsize',20')
legend('Pot. Ativa resultante','Pot. devido excitaÃ§Ã£o','Pot. devido relutÃ¢ncia','Fontsize',14)

% c)  gerador ligado diretamente na rede onde Xd = Xq
Xq = (V_min/I_max)/Zb; % reatÃ¢ncia em quadratura
Xd = Xq; % reatÃ¢ncia de eixo direto 

Pfc = Vt* Ef.*sin(delta)/Xd ; % Potência devido a excitaÃ§Ã£o de campo
Prc = (Vt^2*(Xd - Xq).*sin(2.*delta))/(2*Xd*Xq); % Potência devido a relutÃ¢ncia

Pc = Pfc + Prc; % Potência resultante
% plotagem 
figure(3)
plot(delta,Pc, 'LineWidth',2.0)
hold on
plot(delta,Pfc,'k','LineWidth',2.0)
plot(delta,Prc,'r','LineWidth',2.0)
grid on
title ('Gerador ligado diretamente na rede com Xd = Xq','Fontsize',25)
xlabel('Ângulo \delta','Fontsize',20)
ylabel('Potência','Fontsize',20')
legend('Pot. Ativa resultante','Pot. devido excitaÃ§Ã£o','Pot. devido relutÃ¢ncia','Fontsize',14)

% d) gerador ligado a rede por meio de um barramento de 0.1 pu e Xd = Xq

Xq = (V_min/I_max)/Zb; % reatÃ¢ncia em quadratura
Xd = Xq; % reatÃ¢ncia de eixo direto 
Xbar = 0.1; 

Pfd = Vt* Ef.*sin(delta)/(Xd + Xbar); % Potência devido a excitaÃ§Ã£o de campo
Prd = (Vt^2*(Xd - Xq +Xbar).*sin(2.*delta))/(2*Xd*(Xq + Xbar)); % Potência devido a relutÃ¢ncia

Pd = Pfd + Prd;

figure(4)
plot(delta,Pd, 'LineWidth',2.0)
hold on
plot(delta,Pfd,'k','LineWidth',2.0)
plot(delta,Prd,'r','LineWidth',2.0)
grid on
title ('Gerador ligado na rede elétrica por meio de um barramento de 0,1 pu e Xd = Xq','Fontsize',25)
xlabel('Ângulo \delta','Fontsize',20)
ylabel('Potência','Fontsize',20')
legend('Pot. Ativa resultante','Pot. devido excitaÃ§Ã£o','Pot. devido relutÃ¢ncia','Fontsize',14)
