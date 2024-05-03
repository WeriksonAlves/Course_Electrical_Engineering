
% clc, clearvars, close all

% parameters
d0 = 0.25; % [m]
a3 = 0.25; % [m]

% generalized coordinates
d1 = 0.5; % [m]
d2 = 0.5; % [m]
d3 = 0.5; % [m]
q = [d1 d2 d3];

% homogeneous transform
x0 = 0; y0 = 0; z0 = 0; phi = 0; theta = 0; psi = 0;
Rx = [1    0         0;
      0 cos(phi) -sin(phi);
      0 sin(phi)  cos(phi)];
Ry = [ cos(theta) 0 sin(theta);
           0      1      0    ;
      -sin(theta) 0 cos(theta)];
Rz = [cos(psi) -sin(psi) 0;
      sin(psi)  cos(psi) 0;
         0         0     1];
H_0l0 = [Rx*Ry*Rz [x0 y0 z0]'; 0 0 0 1]; % caso queira deslocar a base do robô e orientá-lo

H_0w  = [1 0 0 0; 0 0 -1 0; 0 1 0 d0; 0 0 0 1];
A_10  = [1 0 0 0; 0 0 1 0; 0 -1 0 d1; 0 0 0 1];
A_21  = [0 0 1 0; -1 0 0 0; 0 -1 0 d2; 0 0 0 1];
A_3l2 = [1 0 0 0; 0 1 0 0; 0 0 1 d3; 0 0 0 1];
A_33l = [0 -1 0 0; 1 0 0 a3; 0 0 1 0; 0 0 0 1];

H_0w  = H_0l0*H_0w;
H_1w  = H_0l0*H_0w*A_10;
H_2w  = H_0l0*H_0w*A_10*A_21;
H_3lw = H_0l0*H_0w*A_10*A_21*A_3l2;
H_3w  = H_0l0*H_0w*A_10*A_21*A_3l2*A_33l;


% - figures
fig = figure();%'Position',[1534,43,1024,953]);

ax = gca; % current axes
ax.FontSize = 12;
ax.TickDir = 'out';
ax.TickLength = [0.01 0.02];

xlabel('$x$ [m]','FontSize',18,'Interpreter','latex')
ylabel('$y$ [m]','FontSize',18,'Interpreter','latex')
zlabel('$z$ [m]','FontSize',18,'Interpreter','latex')

axis equal

view(30,25)
grid on

% - Ground
lim = [-1 1 -1 1 0 1]*1.5;
Ground = patch(lim([1 1 2 2]),lim([3 4 4 3]),lim([5 5 5 5]),[0.5 1 0.5]);
Ground.FaceAlpha = 0.25;
axis(lim)
hold on

% - Plot robot
base = plot3(x0,y0,z0,'-o','Color','k','MarkerSize',10,...
             'MarkerFaceColor',[1 1 1]*0.5);

link_0 = plot3([x0 H_0w(1,4)],[y0 H_0w(2,4)],[z0 H_0w(3,4)],'-o','Color','r','MarkerSize',10,...
             'MarkerFaceColor',[1 0 0]*0.5,'MarkerIndices',2);

link_1 = plot3([H_0w(1,4) H_1w(1,4)],[H_0w(2,4) H_1w(2,4)],[H_0w(3,4) H_1w(3,4)],'-o','Color','g','MarkerSize',10,...
             'MarkerFaceColor',[0 1 0]*0.5,'MarkerIndices',2);

link_2 = plot3([H_1w(1,4) H_2w(1,4)],[H_1w(2,4) H_2w(2,4)],[H_1w(3,4) H_2w(3,4)],'-o','Color','b','MarkerSize',10,...
             'MarkerFaceColor',[0 0 1]*0.5,'MarkerIndices',2);

link_3aux = plot3([H_2w(1,4) H_3lw(1,4)],[H_2w(2,4) H_3lw(2,4)],[H_2w(3,4) H_3lw(3,4)],'-o','Color','k','MarkerSize',10,...
             'MarkerFaceColor',[1 1 1]*0.75,'MarkerIndices',2);

link_3 = plot3([H_3lw(1,4) H_3w(1,4)],[H_3lw(2,4) H_3w(2,4)],[H_3lw(3,4) H_3w(3,4)],'-o','Color','k','MarkerSize',10,...
             'MarkerFaceColor',[1 1 1]*0.75,'MarkerIndices',2);


% while t < 10
% 
%     
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
%     
%     t = t + 0.1;
% end




