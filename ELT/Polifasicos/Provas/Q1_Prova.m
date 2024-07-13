% questao 1 - prova ELT 492 - PEO
%% Sequencia acb - van 127V na referência
clear all
clc
alfa = -0.5 + (sqrt(3)/2)*i; %% 1 fase 120º
fase30 = (sqrt(3)/2) + 0.5*i; %fase 30º
fase_30 = (sqrt(3)/2) - 0.5*i; %fase -30º
%%
% tesnões de fase
van = 127;
vbn = van*alfa;
vcn = van*alfa^2;
%tensões de linha
vab = sqrt(3)*van*fase_30;
vbc = vab*alfa;
vca = vab*alfa^2;
% coordenada polar
[vab_fase, vab_mod] = cart2pol(real(vab), imag(vab)); vab_fase_grau = vab_fase*180/pi;
[vbc_fase, vbc_mod] = cart2pol(real(vbc), imag(vbc)); vbc_fase_grau = vbc_fase*180/pi;
[vca_fase, vca_mod] = cart2pol(real(vca), imag(vca));vca_fase_grau = vca_fase*180/pi;

[van_fase, van_mod] = cart2pol(real(van), imag(van));van_fase_grau = van_fase*180/pi;
[vbn_fase, vbn_mod] = cart2pol(real(vbn), imag(vbn));vbn_fase_grau = vbn_fase*180/pi;
[vcn_fase, vcn_mod] = cart2pol(real(vcn), imag(vcn));vcn_fase_grau = vcn_fase*180/pi;
%% Potência Aparente do Motor
% dados
Pmec = 10; %10CV
cv_w = 736; %1cv = 736w
n = 0.6; % rendimento
fp = 0.86; % fator de potência

% potência aparente Sm
Sm_mod = (Pmec*cv_w)/(n*fp);
Sm_fase = acos(fp);
Sm_fase_grau = Sm_fase*180/pi;

% corrente do motor
Im_mod = Sm_mod/vbc_mod;
Im_fase = -(Sm_fase - vbc_fase);
Im_fase_grau = -(Sm_fase_grau - vbc_fase_grau);
[Im_real, Im_img] = pol2cart(Im_fase, Im_mod);
Im_cart = Im_real + i*Im_img;
%% Chuveiro
% Pch = 6600; %Potência do chuveiro
Pch = input('abce:')
Pch_fase = 0;
% corrente do chuveiro
Ich_mod = Pch/vab_mod;
Ich_fase = -(Pch_fase - vab_fase);
Ich_fase_grau = -(Pch_fase - vab_fase_grau);
[Ich_real, Ich_img] = pol2cart(Ich_fase, Ich_mod);
Ich_cart = Ich_real + i*Ich_img;
%% Cálculos das correntes de linha
Ia_mod = Ich_mod;
Ia_fase = Ich_fase;
Ia_fase_grau = Ich_fase_grau;
Ia_cart = Ich_cart;

Ib_cart = Im_cart - Ich_cart;
[Ib_fase, Ib_mod] = cart2pol(real(Ib_cart), imag(Ib_cart));Ib_fase_grau = Ib_fase*180/pi;

Ic_cart = -Im_cart;
[Ic_fase, Ic_mod] = cart2pol(real(Ic_cart), imag(Ic_cart));Ic_fase_grau = Ic_fase*180/pi;

%% corrente do neutro
In_cart = Ia_cart + Ib_cart + Ic_cart;
% In_cart = 0;
[In_fase, In_mod] = cart2pol(real(In_cart), imag(In_cart));In_fase_grau = In_fase*180/pi;

%% Respostas
Ia_mod
Ia_fase_grau
Ib_mod
Ib_fase_grau
Ic_mod
Ic_fase_grau
In_mod
In_fase_grau
