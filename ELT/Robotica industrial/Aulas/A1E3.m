%% Imprimi os eixos girando com a devida rotação em relação a um eixo

% Limpar todas as variaveis, janelas e o command window
close all; clear all; clc; 

% Inicializa o sistema de coordenadas, criando a orientação original
X0 = [0 1; 0 0; 0 0];
Y0 = [0 0; 0 1; 0 0];
Z0 = [0 0; 0 0; 0 1];

% Plot do sistema de cooredenas com a devida orientação
plot3(X0(1,:),X0(2,:),X0(3,:),'r','Linewidth',3.0)
xlabel('x')
plot3(Y0(1,:),Y0(2,:),Y0(3,:),'g','Linewidth',3.0)
ylabel('y')
plot3(Z0(1,:),Z0(2,:),Z0(3,:),'b','Linewidth',3.0)
zlabel('z')
grid on
hold on

X1 = X0;
Y1 = Y0;
Z1 = Z0;

% plotagem do grafico dinâmico
a = plot3(X1(1,:),X1(2,:),X1(3,:),'r','Linewidth',3.0);
b = plot3(Y1(1,:),Y1(2,:),Y1(3,:),'g','Linewidth',3.0);
c = plot3(Z1(1,:),Z1(2,:),Z1(3,:),'b','Linewidth',3.0);

axis([-.5 1.5 -1.5 1.5 -1.5 1.5])

% For utilizado para fazer a rotação de 360 graus
for ii = 0:5:3*360
    R1 = [1 0 0;
        0 cosd(ii) -sind(ii);
        0 sind(ii) cosd(ii)];
    % novo eixo de coordenadas rotacionada
    X1 = R1*X0;
    Y1 = R1*Y0;
    Z1 = R1*Z0;
    
    % plotagem do grafico dinâmico
    a.XData = X1(1,:); a.YData = X1(2,:); a.ZData = X1(3,:);
    b.XData = Y1(1,:); b.YData = Y1(2,:); b.ZData = Y1(3,:);
    c.XData = Z1(1,:); c.YData = Z1(2,:); c.ZData = Z1(3,:);
    
    pause(0.01)
end
