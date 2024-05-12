%%
clc
clear
close

Simulacao = load('Werikson_Ex3.mat');
Dados = Simulacao.XX;
% Parâmetros de desempenho
IAE = 0;
ITAE = 0;
IASC = 0;
tap = Dados(end,end)-Dados(end-1,end); % taxa de atualização do pioneer
data = [];
for t = 1:size(Dados,1)
    if t>60
        ITAE = t*norm(Dados(t,1:2)-Dados(t,13:14))*tap;
        IAE = 0;
        IASC = 0;
    else
        IASC = norm(Dados(t,25:26))*tap;
        IAE = norm(Dados(t,1:2)-Dados(t,13:14))*tap;
        ITAE = 0;
    end
    data = [data; IAE ITAE IASC t];
end
Indices = [sum(data(:,1),1),sum(data(:,2),1),sum(data(:,3),1)]
save("Fotos\Sim_Pioneer_3.mat","Indices")