clc;
clear all;
close all;

I=[0 0.78 1.11 2.23 2.54 3.56 3.81];
V=[220 218 217 209 207 194 188];
plot(I,V,'k-');
xlabel('Corrente de armadura (A)');
ylabel('Tensão terminal (V)');
grid on