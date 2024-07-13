%%Relatorio 1 - Maquinas II

clc;
clear all;
close all;

%Dados Ensaio a vazio
Ef = [3.4 40.5 62.8 83.8 98 110 120.6 128.6 136.2 141.5 147 152.5 157 160.5 165.4];
If = [0:0.05:0.70];
plot (If,Ef,'linewidth',2);
xlabel('Corrente de Campo I_f(A)','fontsize',12);
ylabel('Tensção de Armadura E_f(V)','fontsize',12);
% title('Ensaio à Vazio','fontsize',14);
grid on;

%Dados do Ensaio CC
hold on;
Ia = [0 0.7 1.2 1.84 2.82 3.42 4 4.83];
If2 = [0:0.05:0.35];
plot (If2,Ia,'linewidth',2);
xlabel('Corrente de Campo I_f(A)','fontsize',12);
ylabel('Corrente de Armadura I_a(A)','fontsize',12);
% title('Ensaio à Vazio','fontsize',14);
grid on;

%Linha de entreferro
x=0:0.01:0.45;
y=((61.3-3.4)/0.1).*x+3.4;
plot(x,y,'linewidth',2);

%Plot
figure;
plotyy(If,Ef,If2,Ia);
xlabel('Corrente de Campo I_f (A)','fontsize',12);
[AX,H1,H2] = plotyy(If,Ef,If2,Ia,'plot');
hold on
plot(x,y,'linewidth',2.22,'linestyle','x');
set(get(AX(1),'Ylabel'),'String','Tensção de Armadura E_f (V)','fontsize',12) 
set(get(AX(2),'Ylabel'),'String','Corrente de Armadura I_a (A)','fontsize',12)
xlabel('Corrente de Campo I_f(A)','fontsize',12);
set(H1,'linewidth',2,'LineStyle','-')
set(H2,'linewidth',2,'LineStyle','--')
grid on;
