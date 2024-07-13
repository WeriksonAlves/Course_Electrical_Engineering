%% plot assintotico

clear all; close all; clc
w = logspace(-1,1,1e5);
K = 20*log10(10); % Fator constante
z = zeros(1, length(w));
K = K + z; % Cria o vetor fator constante
D = -20*log10(w); % Fator derivativo ou integrativo (depende do sinal)
PO1 = -20*log10((abs(j*w./1))); % Fator de primeira ordem (Se for polo será negativo o sinal)
PO2 = -20*log10((abs(j*w*2))); % Fator de primeira ordem
k = 1;

while w(k) < 1
    PO1(k) = 0; k = k+1;
end
k = 1;
while w(k) < 0.5
    PO2(k) = 0; k = k+1;
end
k = 1;

T = K + D + PO1 + PO2; % Calcula a assintotica resultante

figure;

semilogx(w, T) % Plota a resultante
hold on
semilogx(w, K) % Plota o fator constante
hold on
semilogx(w,D) % Plota o fator derivativo/integrativo
hold on
semilogx(w, PO1) % Plota o fator de primeira ordem
hold on
semilogx(w, PO2) % Plota o fator de primeira ordem
hold on
xlabel('Frequência (rad/s)', 'linewidth', 2)
ylabel('Magnitude (dB)', 'linewidth', 2)
grid on

%  LEGENDA 
legend('[Resultante]','[Fator Constante]','[Fator Derivativo]','[Polo/zero]','[Polo/zero]')
h = findobj(gcf, 'type', 'line');
set(h,'linewidth',2);