%% P3 de GTD Antiga
% Questão 2
close all; clear all; clc;

% Definição das variaveis
R = 0;%Resistencia 
G = 0;%Condutancia
f = 60;%Frequencia Hz
V0 = (220/sqrt(3))*1e3;%V0 V
S0 = (150 + 50i)*1e6;

l = 300;%Comprimento km

L = 1.33e-7; %Indutancia do cabo por metro
C = 8.86e-12; %Capacitancia do cabo por metro

z = complex(R, 2*pi*f*L)
y = complex(G, 2*pi*f*C)
Zc = sqrt(z/y)
Gama = sqrt(z*y)

I0 = conj(S0/V0)

A = V0*cosh(Gama*l*1e3)
B = Zc*I0*sinh(Gama*l*1e3)
C = I0*cosh(Gama*l*1e3)
D = (V0/Zc)*sinh(Gama*l*1e3)

Vl = A - B
Il = C - D
Sl = Vl*conj(Il)
V = abs(A - B);
I = abs(C - D);
S = abs(Vl*conj(Il));
