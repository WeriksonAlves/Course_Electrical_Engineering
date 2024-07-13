%% plot assintotico

clear all; close all; clc
w = logspace(-1,2,1e5);
K = 20*log10(60); % Fator constante
z = zeros(1, length(w));
K = K + z; % Cria o vetor fator constante
%D = -20*log10(w); % Fator derivativo ou integrativo (depende do sinal)
PO1 = -20*log10((abs(j*w./1))); % Fator de primeira ordem (Se for polo será negativo o sinal)
PO2 = -20*log10((abs(j*w./2))); % Fator de primeira ordem
PO3 = -20*log10((abs(j*w./4))); % Fator de primeira ordem (Se for polo será negativo o sinal)
k = 1;

while w(k) < 1
    PO1(k) = 0; k = k+1;
end
k = 1;
while w(k) < 2
    PO2(k) = 0; k = k+1;
end
k = 1;
while w(k) < 4
    PO3(k) = 0; k = k+1;
end

T = K + PO1 + PO2 + PO3; % Calcula a assintotica resultante

figure;

semilogx(w, T) % Plota a resultante
hold on
semilogx(w, K) % Plota o fator constante
hold on
%semilogx(w,D) % Plota o fator derivativo/integrativo
%hold on
semilogx(w, PO1) % Plota o fator de primeira ordem
hold on
semilogx(w, PO2) % Plota o fator de primeira ordem
hold on
semilogx(w, PO3) % Plota o fator de primeira ordem
hold on
xlabel('Frequência (rad/s)', 'linewidth', 2)
ylabel('Magnitude (dB)', 'linewidth', 2)
grid on

%  LEGENDA mag
title('Diagrama de Bode de G_1(s) = [480]/[(s+1)(s+2)(s+4)]')
legend('[Resultante]','[Fator Constante]','[Polo/zero]','[Polo/zero]','[Polo/zero]')
h = findobj(gcf, 'type', 'line');
set(h,'linewidth',2);