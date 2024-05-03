%% Imprimi os eixos com a devida rotação em relação ao eixos originais

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

%Ângulo de rotação desejado e abreviação trigonometrica
phi = input('Entre com valor do ângulo de rotação:'); 
c = cosd(phi);
s = sind(phi);

%Matriz de rotação e novos vetores rotacionados
Rot = [[1 0 0];
       [0 c -s];
       [0 s c]];
X1 = Rot*X0;
Y1 = Rot*Y0;
Z1 = Rot*Z0;

% Imprimi a matriz de rotação R
fprintf('A matriz de rotação R, dado o ângulo %d graus é:\n',phi);
disp(Rot)

hold on
plot3(X1(1,:),X1(2,:),X1(3,:),'r')
plot3(Y1(1,:),Y1(2,:),Y1(3,:),'g')
plot3(Z1(1,:),Z1(2,:),Z1(3,:),'b')
