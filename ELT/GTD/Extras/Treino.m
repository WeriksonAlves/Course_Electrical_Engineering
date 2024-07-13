%% P3 de GTD

%% Seção 5.9 - Exemplo 1
close all; clear all; clc;

% Definição das variaveis
r = 0.02;%Raio m
D = 1;%Distanciamneto m
R = 0;%Resistencia 
G = 0;%Condutancia
f = 60;%Frequencia Hz
V0 = 130*1e3;%V0 V
I0 = 46.9846-17.1010i;%I0 A
%S0 = (150 + 50i)*1e6;
%I0 = conj(S0/V0);
l = 200;%Comprimento km
Xi = 0;%Xinicial
Xf = 5000;%Xfinal km

%L = 1.33e-7; %Indutancia do cabo por metro
%C = 8.86e-12; %Capacitancia do cabo por metro

mi0 = pi*4e-7;
ep0 = (1e-9)/(36*pi);
L = (mi0/pi)*log(D/(r*0.7788))
C = (pi*ep0)/log(D/r)
z = complex(R, 2*pi*f*L)
y = complex(G, 2*pi*f*C)
Zc = sqrt(z/y)
Gama = sqrt(z*y)
alpha = real(Gama);
beta = imag(Gama);

x = linspace(Xi,Xf,5001);
Vx = zeros(1,Xf);
Ix = zeros(1,Xf);
Sx = zeros(1,Xf);
I1 = Zc*I0*complex(0,1);
V1 = V0/Zc*complex(0,1);

for a = 0:Xf
    
    Vx(a+1) = abs(V0*cos(beta*a*1e3) - I1*sin(beta*a*1e3));
    Ix(a+1) = abs(I0*cos(beta*a*1e3) - V1*sin(beta*a*1e3));
    Sx(a+1) = Vx(a+1)*conj(Ix(a+1));
end

figure(1)
plot(x,Vx, 'LineWidth',2.0)
grid on
title ('Tensão ao longo da linha','Fontsize',18)
xlabel('x[km]','Fontsize',20)
ylabel('V [kV]','Fontsize',20')
axis([0 Xf 0 150e3])

figure(2)
plot(x,Vx, 'LineWidth',2.0)
grid on
title ('Tensão ao longo da linha','Fontsize',18)
xlabel('x[km]','Fontsize',20)
ylabel('V [kV]','Fontsize',20')
axis([0 l 0 150e3])

figure(3)
plot(x,Ix, 'LineWidth',2.0)
grid on
title ('Corrente ao longo da linha','Fontsize',18)
xlabel('x[km]','Fontsize',20)
ylabel('I [A]','Fontsize',20')
axis([0 Xf 0 300])

% figure(3)
% plot(x,Sx, 'LineWidth',2.0)
% grid on
% title ('Potencia ao longo da linha','Fontsize',18)
% xlabel('x[km]','Fontsize',20)
% ylabel('V [kV]','Fontsize',20')
% axis([0 xf 0 150e3])

