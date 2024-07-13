X2 = [-0.5:0.1:1.5];

figure
quiver(0,-0.2,0,1.4,'Color','k','AutoScaleFactor',1); hold on
quiver(-0.2,0,1.4,0,'Color','k','AutoScaleFactor',1)
plot(0,0,'.k','MarkerSize',20)
plot(0,1,'.k','MarkerSize',20)
plot(1,0,'.k','MarkerSize',20)
plot(1,1,'.k','MarkerSize',20)
text(-0.01,-0.01,'(0,0)','FontSize',16,'VerticalAlignment','top','HorizontalAlignment','right')
text(-0.01,0.99,'(0,1)','FontSize',16,'VerticalAlignment','top','HorizontalAlignment','right')
text(1.01,-0.01,'(1,0)','FontSize',16,'VerticalAlignment','top','HorizontalAlignment','right')
text(1.01,0.99,'(1,1)','FontSize',16,'VerticalAlignment','top','HorizontalAlignment','right')
text(-0.05,0.5,'X_1','FontSize',12,'FontAngle','italic','HorizontalAlignment','right')
text(0.5,-0.05,'X_2','FontSize',12,'FontAngle','italic','VerticalAlignment','top')
xlim([-0.2 1.2])
ylim([-0.2 1.2])
xticks([0 1])
yticks([0 1])
grid on


figure
X1 = -(-(-X2+1));
subplot(3,1,1)
quiver(0,-0.2,0,1.4,'Color','k','AutoScaleFactor',1); hold on
quiver(-0.2,0,1.4,0,'Color','k','AutoScaleFactor',1)
plot(X2,X1,'k')
plot(0,0,'.b','MarkerSize',20)
plot(0,1,'.b','MarkerSize',20)
plot(1,0,'.b','MarkerSize',20)
plot(1,1,'.r','MarkerSize',20)
text(-0.01,-0.01,'(0,0)','FontSize',16,'VerticalAlignment','top','HorizontalAlignment','right','Color',[0 0 1])
text(-0.01,0.99,'(0,1)','FontSize',16,'VerticalAlignment','top','HorizontalAlignment','right','Color',[0 0 1])
text(1.01,-0.01,'(1,0)','FontSize',16,'VerticalAlignment','top','HorizontalAlignment','right','Color',[0 0 1])
text(1.01,0.99,'(1,1)','FontSize',16,'VerticalAlignment','top','HorizontalAlignment','right','Color',[1 0 0])
text(-0.05,0.5,'X_1','FontSize',12,'FontAngle','italic','HorizontalAlignment','right')
text(0.5,-0.0,'X_2','FontSize',12,'FontAngle','italic','VerticalAlignment','top')
xlim([-0.2 1.2])
ylim([-0.2 1.2])
xticks([0 1])
yticks([0 1])
grid on
title('(A)NAND')