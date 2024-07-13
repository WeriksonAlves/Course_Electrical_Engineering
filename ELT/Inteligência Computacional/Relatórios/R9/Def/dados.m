clc
close all
clear all

fileID = fopen('entradasclassalunos.txt');
Xp = textscan(fileID,'%f %f %f %f %f %f %f %f %f');
Xp = cell2mat(Xp);
fclose(fileID);

fileID = fopen('entradasclassteste.txt');
Xt = textscan(fileID,'%f %f %f %f %f %f %f %f %f');
Xt = cell2mat(Xt);
fclose(fileID);

fileID = fopen('saidaclassalunos.txt');
Yp = textscan(fileID,'%f');
Yp = cell2mat(Yp);
fclose(fileID);

for ii = 1:length(Xp(:,1))
    for jj = 1:length(Xp(1,:))
        if isnan(Xp(ii,jj))
            Xp(ii,jj) = 0;
        end
    end
    if isnan(Yp(ii))
        Yp(ii,jj) = 0;
    end
end


treino = [Xp Yp];

%load('fis2.mat')
out_fis = readfis('out_fis.fis');

figure()
plot(1:length(Yp),Yp,1:length(Yp),evalfis(Xp,out_fis));
legend('Training Data','anfis Output');

figure()
Yt = evalfis(Xt,out_fis);
plot(1:length(Yt),Yt);

save('96708submissaoANFISclass.txt','Yt','-ascii')

y_teste = load('Resp - Copia.txt');
figure()
plot(1:length(Yt),Yt,1:length(y_teste),y_teste)
legend('Nossa resp','Iure');
