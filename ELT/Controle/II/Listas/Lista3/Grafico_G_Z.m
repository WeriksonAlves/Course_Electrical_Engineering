%Este script calcula a resposta contínua no tempo para
%um degrau unitário,
%
%Gp
clear; close all; clc;
numg = 1; deng = [1 1]; 
%num0 = [0 0.095163 0]; den0 = conv([1 -1],[1 -0.809675]);%C/R

%Aproximação para (1-e^-(sT))/s
[nd,dd] = pade(1,2);
numd = dd - nd; dend = conv([1 0], dd);

[n1,d1] = series(numd,dend,numg,deng);
[num,den] = cloop(n1,d1);
t = 0:0.1:40;
figure()
step(num,den,t)
grid on
title ('Resposta ao Degrau Unitário contínua no tempo')
xlabel ('Tempo')
ylabel ('Amplitude')
% Este script gera a resposta para um degrau unitário, y(kT),
% para o sistema com dados amostrados
%
num0 = [0 0 0.095163]; den0 = [0 1 -0.809675];
k1 = 0:1:40;
figure()
dstep(num0,den0,k1);
grid on
title ('Resposta ao Degrau Unitário discretizada no tempo')
xlabel ('Amostras')
ylabel ('Amplitude')
%%
numg = 10; deng = [10 1];
[nd,dd] = pade(2,2);
numd = dd - nd; dend = conv([1 0], dd);
G = tf(numd,dend);
H = tf([0.05],[1]);
F = G/(1+G*H);
figure()
step(10*F);
%%
%parametros de Gp
num = [1];
den = [1 1];
T = 0.1;

%Gera G(z)
[numd,dend] = c2dm(num,den,T,'zoh');
printsys(numd,dend,'z')

%pegar func de malha aberta
numm = [0   0.095163];
denn = [1   0.904837];

%malha fechada
denf = numm + denn;
printsys(numm,denf,'z')

%respostas 
figure()
dstep(numm,denf)

figure()
dstep(numm,denn)

%%  Inversa
syms z k1 k2
g = (z+2)/((z-2)*z^2);

f = iztrans(g,z,k1)
%k = linspace(0,5,10);

k1 = 0:0.1:10;
gn1 = double( subs(f, sym('k1'), k1) );
figure();
stem(gn1, k1)


f = 2^k2 - kroneckerDelta(k2, 0) - kroneckerDelta(k2 - 1, 0);
k2=0:0.1:10;
gn2 = double( subs(f, sym('k2'), k2) );
figure();
stem(gn2, k2)


figure();
gfera = gn1-gn2;
plot(gfera,k2);