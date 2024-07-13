% Wérikson F. de O. Alves - 96708
% Trabalho de Simulação 2 - ELT492
% Calculo da potência monofásica no circuito RC série
%..........................................................................
% Dados iniciais (Monofásicos)
Vf = 127; % Volts, Tensão da Fonte RMS
R = 100; % Ohms, Resistência
C = 25e-6; % Faraday, Capacitor
f = 60; % Hertz, Frequência da Fonte
A1 = 0; % Rad, Fase da Tensão
W = 2*pi*60; % Rad/s, Frequência Angular
t = 0:1e-6:0.03; % Intervalo analisado
%..........................................................................
% Corrente (Monofásico)
Xc = 1/(j*W*C); % Reatância Capacitiva
B1 = atan2(-abs(Xc),R); % Fase da Corrente em rad
Z = abs(R + Xc); % Modulo da Impedância
If = (Vf)/Z; % Valor da corrente RMS
i = (If)*( sqrt(2) )*cos( (W*t) + B1 ); % Corrente em função do tempo
I = 100*(i); % Corrente mutiplicada pelo faor de escala
%..........................................................................
%Tensão (Monofásica)
v = ( Vf )*( sqrt(2) )*cos( (W*t) + A1 ); % Vetor tensão em função do tempo
%..........................................................................
% Potência ativa instantânea (Monofásica)
Pa = v.*i
%..........................................................................
% Potência media (Monofásica)
Pm= [ ];
for d = 1 : length(t)
    Pm(d)= (Vf)*(If)*cos(A1 - B1);
end;
%..........................................................................
% Plotagem dos Gráficos (Monofásico)
figure(1);
grid on
hold on
plot(t,v,'r','linewidth',2);
plot(t,I,'m','linewidth',2);
plot(t,Pa,'b','linewidth',2);
plot(t,Pm,'g','linewidth',2);
legend('Tensão','Corrente (x100)','Potência Instantânea','Potência Média');
xlabel('t[s]');
ylabel('V,A,W');
title('Simulação 2: Gráfico 1','Fontsize',24);

%..........................................................................
% Dados iniciais, Van está na referência, Tensão (Trifásico), ABC
Alfa1 = 0*(pi/180);
Alfa2 = -120*(pi/180);
Alfa3 = 120*(pi/180);
Van = (Vf)*( sqrt(2) )*cos( (W*t) + Alfa1);
Vbn = (Vf)*( sqrt(2) )*cos( (W*t) + Alfa2);
Vcn = (Vf)*( sqrt(2) )*cos( (W*t) + Alfa3);
%..........................................................................
% Corrente (Trifásico), R, C e Z são os mesmos
Beta1 = (Alfa1) - (B1);
Beta2 = (Alfa2) - (B1);
Beta3 = (Alfa3) - (B1);
Ia = (If)*( sqrt(2) )*cos((W*t) + Beta1);
Ib = (If)*( sqrt(2) )*cos((W*t) + Beta2);
Ic = (If)*( sqrt(2) )*cos((W*t) + Beta3);
%..........................................................................
% Potência ativa instantânea (Trifásico)
P3 = (Van.*Ia)+(Vbn.*Ib)+(Vcn.*Ic)
%..........................................................................
% Plotagem dos Gráficos (Trifásico)
figure(2)
grid on
hold on
plot(t,Pa,'b','linewidth',2);
plot(t,Pm,'g','linewidth',2);
plot(t,P3,'k','linewidth',2);
legend('Potência Instantânea','Potência Média','Potência Trifásica');
xlabel('t[s]');
ylabel('W');
title('Simulação 2: Gráfico 2','Fontsize',24);