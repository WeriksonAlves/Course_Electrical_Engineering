% clc
% close all
% clear all

xn = 1;
yn = 1;

fileID = fopen('entradamodelagemalunos.txt');
Xp1 = textscan(fileID,'%f');
Xp1 = cell2mat(Xp1);
fclose(fileID);

fileID = fopen('entradamodelagemteste.txt');
Xt = textscan(fileID,'%f');
Xt = cell2mat(Xt);
fclose(fileID);

fileID = fopen('saidamodelagemalunos.txt');
Yp = textscan(fileID,'%f');
Yp = cell2mat(Yp);
fclose(fileID);

Xp = tratamento(Xp1,xn,Yp,yn);


readfis('out_fis.fis')

Yp2 = teste(Xp1,xn,Yp(1),yn,out_fis);
plot(1:length(Yp),Yp,1:length(Yp),Yp2);
legend('Training Data','anfis Output');

figure
Yt = teste(Xt,xn,Yp(end),yn,out_fis);
plot(1:length(Yt),Yt);

save('exemplosubmissaoanfis.txt','Yt','-ascii')

y_teste = load('Resp - Copia.txt');
figure()
plot(1:length(y_teste),y_teste)