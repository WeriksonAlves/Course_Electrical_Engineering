function [base,link_0,link_1,link_2,link_3,link_4] = Plota_Manipulador(x0,y0,z0,AT0,AT1,AT2,AT3,AT4)
    ax = gca; % current axes
    ax.FontSize = 12;
    ax.TickDir = 'out';
    ax.TickLength = [0.01 0.02];

    xlabel('$x$ [m]','FontSize',18,'Interpreter','latex')
    ylabel('$y$ [m]','FontSize',18,'Interpreter','latex')
    zlabel('$z$ [m]','FontSize',18,'Interpreter','latex')

    %axis equal

    view(30,25)
    grid on

    % - Ground
    lim = [-100 100 -100 100 0 100]*1.5;
    Ground = patch(lim([1 1 2 2]),lim([3 4 4 3]),lim([5 5 5 5]),[0.5 1 0.5]);
    Ground.FaceAlpha = 0.25;
    axis(lim)
    hold on

    % - Plot robot
    base = plot3(x0,y0,z0,'-o','Color','k','MarkerSize',10,...
                 'MarkerFaceColor',[1 1 1]*0.5);

    link_0 = plot3([x0 AT0(1,4)],[y0 AT0(2,4)],[z0 AT0(3,4)],'-o','Color','r','MarkerSize',10,...
                 'MarkerFaceColor',[1 0 0]*0.5,'MarkerIndices',2);

    link_1 = plot3([AT0(1,4) AT1(1,4)],[AT0(2,4) AT1(2,4)],[AT0(3,4) AT1(3,4)],'-o','Color','g','MarkerSize',10,...
                 'MarkerFaceColor',[0 1 0]*0.5,'MarkerIndices',2);

    link_2 = plot3([AT1(1,4) AT2(1,4)],[AT1(2,4) AT2(2,4)],[AT1(3,4) AT2(3,4)],'-o','Color','b','MarkerSize',10,...
                 'MarkerFaceColor',[0 0 1]*0.5,'MarkerIndices',2);

    link_3 = plot3([AT2(1,4) AT3(1,4)],[AT2(2,4) AT3(2,4)],[AT2(3,4) AT3(3,4)],'-o','Color','k','MarkerSize',10,...
                 'MarkerFaceColor',[1 1 1]*0.75,'MarkerIndices',2);

    link_4 = plot3([AT3(1,4) AT4(1,4)],[AT3(2,4) AT4(2,4)],[AT3(3,4) AT4(3,4)],'-o','Color','k','MarkerSize',10,...
                 'MarkerFaceColor',[1 1 1]*0.75,'MarkerIndices',2);
end