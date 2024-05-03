%%
clc
clear
close

P1 = load('Werikson_Ex1.mat');

figure()
subplot(2,2,1)
plot(P1.XX(:,end),[P1.XX(:,1) P1.XX(:,13)],'LineWidth',1.5);
title('Posição X')
ylabel({'m'},'FontSize',18,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',18,'FontWeight','bold','interpreter','latex');
legend('Xd','X');
grid on

subplot(2,2,2)
plot(P1.XX(:,end),[P1.XX(:,2) P1.XX(:,14)],'LineWidth',1.5);
title('Posição Y')
ylabel({'m'},'FontSize',18,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',18,'FontWeight','bold','interpreter','latex');
legend('Xd','X');
grid on

subplot(2,2,3)
plot(P1.XX(:,end),P1.XX(:,25),'LineWidth',1.5);
title('Velocidade Linear')
ylabel({'m/s'},'FontSize',16,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',16,'FontWeight','bold','interpreter','latex');
legend('Ud');
grid on

subplot(2,2,4)
plot(P1.XX(:,end),P1.XX(:,26),'LineWidth',1.5);
title('Velocidade Angular')
ylabel({'rad/s'},'FontSize',16,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',16,'FontWeight','bold','interpreter','latex');
legend('Ud');
grid on

saveas(gcf,"Fotos\Sim_Pioneer_1.png")

%%
%clc
clear
%close

P2 = load('Werikson_Ex2.mat');

figure()
subplot(2,2,1)
plot(P2.XX(:,end),[P2.XX(:,1) P2.XX(:,13)],'LineWidth',1.5);
title('Posição X')
ylabel({'m'},'FontSize',18,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',18,'FontWeight','bold','interpreter','latex');
legend('Xd','X');
grid on

subplot(2,2,2)
plot(P2.XX(:,end),[P2.XX(:,2) P2.XX(:,14)],'LineWidth',1.5);
title('Posição Y')
ylabel({'m'},'FontSize',18,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',18,'FontWeight','bold','interpreter','latex');
legend('Xd','X');
grid on

subplot(2,2,3)
plot(P2.XX(:,end),P2.XX(:,25),'LineWidth',1.5);
title('Velocidade Linear')
ylabel({'m/s'},'FontSize',16,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',16,'FontWeight','bold','interpreter','latex');
legend('Ud');
grid on

subplot(2,2,4)
plot(P2.XX(:,end),P2.XX(:,26),'LineWidth',1.5);
title('Velocidade Angular')
ylabel({'rad/s'},'FontSize',16,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',16,'FontWeight','bold','interpreter','latex');
legend('Ud');
grid on

saveas(gcf,"Fotos\Sim_Pioneer_2.png")

%%
%clc
clear
%close

P3 = load('Werikson_Ex3.mat');

figure()
subplot(2,2,1)
plot(P3.XX(:,end),[P3.XX(:,1) P3.XX(:,13)],'LineWidth',1.5);
title('Posição X')
ylabel({'m'},'FontSize',18,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',18,'FontWeight','bold','interpreter','latex');
legend('Xd','X');
grid on

subplot(2,2,2)
plot(P3.XX(:,end),[P3.XX(:,2) P3.XX(:,14)],'LineWidth',1.5);
title('Posição Y')
ylabel({'m'},'FontSize',18,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',18,'FontWeight','bold','interpreter','latex');
legend('Xd','X');
grid on

subplot(2,2,3)
plot(P3.XX(:,end),P3.XX(:,25),'LineWidth',1.5);
title('Velocidade Linear')
ylabel({'m/s'},'FontSize',16,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',16,'FontWeight','bold','interpreter','latex');
legend('Ud');
grid on

subplot(2,2,4)
plot(P3.XX(:,end),P3.XX(:,26),'LineWidth',1.5);
title('Velocidade Angular')
ylabel({'rad/s'},'FontSize',16,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',16,'FontWeight','bold','interpreter','latex');
legend('Ud');
grid on

saveas(gcf,"Fotos\Sim_Pioneer_3.png")

%%
%clc
clear
%close

D1 = load('Werikson_Pvtol_Ex1.mat');

figure()
subplot(2,2,1)
plot(D1.XX(:,end),[D1.XX(:,3) D1.XX(:,15)],'LineWidth',1.5);
title('Posição Z')
ylabel({'m'},'FontSize',18,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',18,'FontWeight','bold','interpreter','latex');
legend('Xd','X');
grid on

subplot(2,2,2)
plot(D1.XX(:,end),[D1.XX(:,6) D1.XX(:,18)],'LineWidth',1.5);
title('Ângulo Phi')
ylabel({'rad'},'FontSize',18,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',18,'FontWeight','bold','interpreter','latex');
legend('Xd','X');
grid on

subplot(2,2,3)
plot(D1.XX(:,end),D1.XX(:,27),'-.b','LineWidth',1.5);
title('Velocidade Linear Z')
ylabel({'rad/s'},'FontSize',16,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',16,'FontWeight','bold','interpreter','latex');
legend('Ud(3)');
grid on

subplot(2,2,4)
plot(D1.XX(:,end),D1.XX(:,28),'-r','LineWidth',1.5);
title('Guinada')
ylabel({'rad/s'},'FontSize',16,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',16,'FontWeight','bold','interpreter','latex');
legend('Ud(4)');
grid on

saveas(gcf,"Fotos\Sim_ArDrone_1.png")

%%
%clc
clear
%close

D2 = load('Werikson_Pvtol_Ex2.mat');

figure()
subplot(2,2,1)
plot(D2.XX(:,end),[D2.XX(:,3) D2.XX(:,15)],'LineWidth',1.5);
title('Posição Z')
ylabel({'m'},'FontSize',18,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',18,'FontWeight','bold','interpreter','latex');
legend('Xd','X');
grid on

subplot(2,2,2)
plot(D2.XX(:,end),[D2.XX(:,6) D2.XX(:,18)],'LineWidth',1.5);
title('Ângulo Phi')
ylabel({'rad'},'FontSize',18,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',18,'FontWeight','bold','interpreter','latex');
legend('Xd','X');
grid on

subplot(2,2,3)
plot(D2.XX(:,end),D2.XX(:,27),'-.b','LineWidth',1.5);
title('Velocidade Linear Z')
ylabel({'rad/s'},'FontSize',16,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',16,'FontWeight','bold','interpreter','latex');
legend('Ud(3)');
grid on

subplot(2,2,4)
plot(D2.XX(:,end),D2.XX(:,28),'-r','LineWidth',1.5);
title('Guinada')
ylabel({'rad/s'},'FontSize',16,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',16,'FontWeight','bold','interpreter','latex');
legend('Ud(4)');
grid on

saveas(gcf,"Fotos\Sim_ArDrone_2.png")

%%
%clc
clear
%close

D3 = load('Werikson_Pvtol_Ex3.mat');

figure()
subplot(2,3,1)
plot(D3.XX(:,end),[D3.XX(:,1) D3.XX(:,13)],'LineWidth',1.5);
title('Posição X')
ylabel({'m'},'FontSize',18,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',18,'FontWeight','bold','interpreter','latex');
legend('Xd','X');
grid on

subplot(2,3,2)
plot(D3.XX(:,end),[D3.XX(:,3) D3.XX(:,15)],'LineWidth',1.5);
title('Posição Z')
ylabel({'m'},'FontSize',18,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',18,'FontWeight','bold','interpreter','latex');
legend('Xd','X');
grid on

subplot(2,3,3)
plot(D3.XX(:,end),[D3.XX(:,6) D3.XX(:,18)],'LineWidth',1.5);
title('Posição phi')
ylabel({'rad'},'FontSize',18,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',18,'FontWeight','bold','interpreter','latex');
legend('Xd','X');
grid on

subplot(2,3,4)
plot(D3.XX(:,end),D3.XX(:,26),'--k','LineWidth',1.5);
title('Arfagem')
ylabel({'m/s'},'FontSize',16,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',16,'FontWeight','bold','interpreter','latex');
legend('Ud(2)');
grid on

subplot(2,3,5)
plot(D3.XX(:,end),D3.XX(:,27),'-.b','LineWidth',1.5);
title('Velocidade Linear Z')
ylabel({'rad/s'},'FontSize',16,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',16,'FontWeight','bold','interpreter','latex');
legend('Ud(3)');
grid on

subplot(2,3,6)
plot(D3.XX(:,end),D3.XX(:,28),'-r','LineWidth',1.5);
title('Guinada')
ylabel({'rad/s'},'FontSize',16,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',16,'FontWeight','bold','interpreter','latex');
legend('Ud(4)');
grid on

saveas(gcf,"Fotos\Sim_ArDrone_3.png")

%%
%clc
clear
%close

D4 = load('Werikson_Pvtol_Ex4.mat');

figure()
subplot(2,3,1)
plot(D4.XX(:,end),[D4.XX(:,1) D4.XX(:,13)],'LineWidth',1.5);
title('Posição X')
ylabel({'m'},'FontSize',18,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',18,'FontWeight','bold','interpreter','latex');
legend('Xd','X');
grid on

subplot(2,3,2)
plot(D4.XX(:,end),[D4.XX(:,3) D4.XX(:,15)],'LineWidth',1.5);
title('Posição Z')
ylabel({'m'},'FontSize',18,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',18,'FontWeight','bold','interpreter','latex');
legend('Xd','X');
grid on

subplot(2,3,3)
plot(D4.XX(:,end),[D4.XX(:,6) D4.XX(:,18)],'LineWidth',1.5);
title('Posição phi')
ylabel({'rad'},'FontSize',18,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',18,'FontWeight','bold','interpreter','latex');
legend('Xd','X');
grid on

subplot(2,3,4)
plot(D4.XX(:,end),D4.XX(:,26),'--k','LineWidth',1.5);
title('Arfagem')
ylabel({'m/s'},'FontSize',16,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',16,'FontWeight','bold','interpreter','latex');
legend('Ud(2)');
grid on

subplot(2,3,5)
plot(D4.XX(:,end),D4.XX(:,27),'-.b','LineWidth',1.5);
title('Velocidade Linear Z')
ylabel({'rad/s'},'FontSize',16,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',16,'FontWeight','bold','interpreter','latex');
legend('Ud(3)');
grid on

subplot(2,3,6)
plot(D4.XX(:,end),D4.XX(:,28),'-r','LineWidth',1.5);
title('Guinada')
ylabel({'rad/s'},'FontSize',16,'FontWeight','bold','interpreter','latex');
xlabel({'$$t_{simu}$$ [s]'},'FontSize',16,'FontWeight','bold','interpreter','latex');
legend('Ud(4)');
grid on

saveas(gcf,"Fotos\Sim_ArDrone_4.png")
