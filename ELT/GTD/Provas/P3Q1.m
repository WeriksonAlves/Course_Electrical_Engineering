%% P3 de GTD Antiga
% Questão 1
close all; clear all; clc;

% Definição das variaveis
VL = 500;%Tensão da linha em kV
l = 250;%Comprimento km
V0 = 1;%V0 V
I0 = 1;%I0 A

z = complex(0.045,0.4)
y = complex(0    ,4e-6)

gama = sqrt(z*y)
Zc = sqrt(z/y)

A = V0*cosh(gama*l)
B = Zc*I0*sinh(gama*l)
C = I0*cosh(gama*l)
D = (1/Zc)*V0*sinh(gama*l)

Zeq = Zc*sinh(gama*l)
Yeq = tanh(gama*l/2)*(2/Zc)

