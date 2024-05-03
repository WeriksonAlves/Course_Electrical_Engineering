%% Exemplo de transformações homogêneas
clear % limpa as variáveis da memória
close all % fecha todas as figuras
syms theta phi psi dx dy dz % atribui variáveis simbólicas a serem substituídas por números

% transformação Rotx
TX = [1    0        0       0;
      0 cos(phi) -sin(phi)  0;
      0 sin(phi)  cos(phi)  0;
      0    0        0       1];

% transformação Roty
TY = [cos(theta) 0 sin(theta) 0;
          0      1     0      0;
     -sin(theta) 0 cos(theta) 0;
          0      0     0      1];
 
% transformação Rotz
TZ = [cos(psi) -sin(psi) 0 0;
      sin(psi)  cos(psi) 0 0;
         0         0     1 0;
         0         0     0 1];


% transformação de distância/deslocamento  
Td = [1 0 0 dx;
      0 1 0 dy;
      0 0 1 dz;
      0 0 0  1];

% conjunto de pontos para formar um trapézio
x0 = [-1  1 .5 -.5 -1;
      -1 -1  1  1 -1 ;
       1  1  1  1  1 ;
       1  1  1  1  1 ];

clf % limpa a figura
plot3(x0(1,:),x0(2,:),x0(3,:)) % plota figura com pontos x0
hold on; xlabel('x'); ylabel('y');zlabel('z')
x1 = subs(Td,[dx dy dz],[5 0 8])*subs(TZ,psi,pi/2)*subs(TX,phi,0)*x0; % realiza transformação
plot3(x1(1,:),x1(2,:),x1(3,:)) % plota figura com pontos x1
grid on % adiciona grid à figura
axis equal 
