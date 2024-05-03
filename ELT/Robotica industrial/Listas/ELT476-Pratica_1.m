% Limpar todas as variaveis, janelas e o command window
clear all;
close all;
clc

% Inicializa o sistema de coordenadas
X0 = [0 1; 0 0; 0 0];
Y0 = [0 0; 0 1; 0 0];
Z0 = [0 0; 0 0; 0 1];

% Plot do sistema de cooredenas
hold on
plot3(X0(1,:),X0(2,:),X0(3,:),'r')
plot3(Y0(1,:),Y0(2,:),Y0(3,:),'g')
plot3(Z0(1,:),Z0(2,:),Z0(3,:),'b')

% Pausa de 5 segundos para ajustar o grafico
pause(5)

% For utilizado para fazer a rotação de 360 graus
% com passo de 2 graus
for i=0:2:360
  
  % Calculo do seno e cosseno do angulo de rotação
  c = cosd(i);
  s = sind(i);
  
  % Matriz de rotação
  R = [1 0 0;
       0 c -s;
       0 s c];
  
  % Novo sistema de coordenadas
  x0 = R*X0;
  y0 = R*Y0;
  z0 = R*Z0;
  
  
  % Plot do novo sistema
  x = plot3(x0(1,:),x0(2,:),x0(3,:),'r');
  y = plot3(y0(1,:),y0(2,:),y0(3,:),'g');
  z = plot3(z0(1,:),z0(2,:),z0(3,:),'b');
  grid on
 
  
  % Plot do plano girando em cinza claro
  w = patch(x0 * 0, z0, y0, 'k');
  set(w,'facealpha', 0.1);
  
  
  % Pausa de 10milisegundos
  pause(.01);
  
  % Delete do novo sistema de coordenadas para plotagem
  % do proximo
  delete(x)
  delete(y)
  delete(z)
  delete(w)
 end
 
 % Plot para manter o plano ao final da simulação
 w = patch(X0 * 0, Z0, Y0, 'k');
 set(w,'facealpha', 0.1);

