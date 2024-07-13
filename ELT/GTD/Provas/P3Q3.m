%% P3 de GTD Antiga
% Questão 3
close all; clear all; clc;

% Definição das variaveis
r = 0.0085;%Raio m
D = 1.6;%Distanciamneto m
P0 = 2500e3; 
f = 60;%Frequencia Hz
V0 = 11*1e3;%V0 V
l = 18;%Comprimento km
R = 0.3722;%Resistencia 

mi0 = pi*4e-7;
ep0 = (1e-9)/(36*pi);
L = (mi0/pi)*log(D/(r*0.7788))
C = (pi*ep0)/log(D/r)
XL = 2*pi*f*L
XC = inv(2*pi*f*C)
XLl = XL*l*1e3

z = complex(R, 2*pi*f*L)
y = complex(G, 2*pi*f*C)
Zc = sqrt(z/y)
Gama = sqrt(z*y)
alpha = real(Gama);
beta = imag(Gama);

