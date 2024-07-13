% anfis genfis1 mam2sug demo non linear system identification

clc
close all
clear all

Xp = load('entradasclassalunos.txt');
Yp = load('saidaclassalunos.txt');

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

options = genfisOptions('GridPartition');
options.NumMembershipFunctions = 2;
in_fis  = genfis(Xp,Yp,options);
 
options = anfisOptions;
options.InitialFIS = in_fis;
options.EpochNumber = 20;
options.ErrorGoal = 1;
out_fis = anfis([Xp Yp],options);
plot(1:length(Yp),Yp,1:length(Yp),evalfis(out_fis,Xp));
legend('Training Data','anfis Output');

writeFIS(out_fis,'out_fis');