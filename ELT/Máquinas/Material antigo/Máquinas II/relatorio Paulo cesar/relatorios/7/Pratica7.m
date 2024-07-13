clear all
clc

load('Pratica7.mat');
R = 1.95;
Xs = 20.54;

Ia = Pratica7(:,2).*(Pratica7(:,5) - j*sin(acos(Pratica7(:,5))));
Ef = Pratica7(:,3)/sqrt(3) - Ia.*(R + j*Xs);
mEf = abs(Ef);
fEf = 180*angle(Ef)/pi;
Ef = [mEf fEf]
Ia = [abs(Ia) 180*angle(Ia)/pi]
