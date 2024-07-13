%% plot assintotico
clear all; close all; clc

w = logspace(-2,1,1e5);
K = 20*log10(1/5); % Fator constante
z = zeros(1, length(w));
K = K + z; % Cria o vetor fator constante
D = -20*log10(w); % Fator derivativo ou integrativo (depende do sinal)
Z1 = 20*log10((abs(j*w./0.1))); % Fator de primeira ordem (Se for polo será negativo o sinal)
P2 = -20*log10((abs(j*w./0.5))); % Fator de primeira ordem
P3 = -20*log10((abs(j*w./1))); % Fator de primeira ordem (Se for polo será negativo o sinal)
k = 1;

while w(k) < 0.1
    Z1(k) = 0; k = k+1;
end
k = 1;
while w(k) < 0.5
    P2(k) = 0; k = k+1;
end
k = 1;
while w(k) < 1
    P3(k) = 0; k = k+1;
end

T = K + D + Z1 + P2 + P3; % Calcula a assintotica resultante

figure;

semilogx(w, T) % Plota a resultante
hold on
semilogx(w, K) % Plota o fator constante
hold on
semilogx(w,D) % Plota o fator derivativo/integrativo
hold on
semilogx(w, Z1) % Plota o fator de primeira ordem
hold on
semilogx(w, P2) % Plota o fator de primeira ordem
hold on
semilogx(w, P3) % Plota o fator de primeira ordem
hold on
xlabel('Frequência (rad/s)', 'linewidth', 2)
ylabel('Magnitude (dB)', 'linewidth', 2)
grid on

%  LEGENDA
title('Diagrama de Bode de G(s)H(s)')
legend('[Resultante]','[Fator Constante]','[Fator derivativo]','[Zero]','[Polo]','[Polo]')
h = findobj(gcf, 'type', 'line');
set(h,'linewidth',2);

%% plot Bode pela FT
clear all; close all; clc

num = [50];
den = [1 1 0];
w = logspace(-2,2,100);
bode(num,den,w)
grid on
title('Diagrama de Bode de G1(s)')
%% Obtem o grafico com os valores das margens
clear all; close all; clc

beta = 15;
num = [5];
%den = conv([0.1 1],[1 1 0]);
cont1 = 64.447*tf([1 4.429],[1 28.545])
%cont2 = tf([1 0.745],[1 0.745*beta]);
den = poly([0 -1]);
G = tf(num,den)
sys = G * cont1% * cont2;
w = logspace(-2,5,100);
bode(sys,w)
grid on
title('Diagrama de Bode de Gc(s)G(s)')
[Gm,pm,wcp,wcg] = margin(sys);
GmdB = 20*log10(Gm);
[GmdB pm wcp wcg];

ans
%% Obtem o grafico nyquist
clear all; close all; clc
num = [1 2];
den = poly([0 -1 -10]); %conv([1 0],[1 3]);
den2 = [1 6];
%den = conv(den1,den2);
GH = tf(num,den);
nyquist(100*GH);
grid
title('Diagrama de Nyquist de G(s)'); 
%%
%step(F)
%hold on
step(F1)