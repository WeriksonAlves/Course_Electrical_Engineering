function p = carregarObjetos

lim = [-.15/2 0.15/2 -.15/2 .15/2 -.01 1];
Ground = patch(lim([1 1 2 2]),lim([3 4 4 3]),lim([5 5 5 5]),[0.5 1 0.5]);
Ground.FaceAlpha = 0.25;

base = loadawobj('objetos\base.obj');
basez = loadawobj('objetos\basez.obj');
basey = loadawobj('objetos\basey.obj');
efetuador = loadawobj('objetos\efetuador.obj');
axisx = loadawobj('objetos\axisx.obj');
axisy = loadawobj('objetos\axisy.obj');
axisz = loadawobj('objetos\axisz.obj');
apoiox = loadawobj('objetos\apoiox.obj');
apoioy = loadawobj('objetos\apoioy.obj');
apoioz = loadawobj('objetos\apoioz.obj');

p(1) = patch('Vertices', base.v', 'Faces', base.f3','FaceAlpha', .5, 'FaceColor', 'b', 'EdgeColor', [0 0 0]);
p(2) = patch('Vertices', basez.v', 'Faces', basez.f3', 'FaceAlpha', .5, 'FaceColor', 'r', 'EdgeColor', [0 0 0]);
p(3) = patch('Vertices', basey.v', 'Faces', basey.f3', 'FaceAlpha', .5, 'FaceColor', 'g', 'EdgeColor', [0 0 0]);
p(4) = patch('Vertices', efetuador.v', 'Faces', efetuador.f3', 'FaceAlpha', .5, 'FaceColor', 'c', 'EdgeColor', [0 0 0]);
p(5) = patch('Vertices', axisx.v', 'Faces', axisx.f3', 'FaceAlpha', .5, 'FaceColor', 'r', 'EdgeColor', [0 0 0]);
p(6) = patch('Vertices', axisy.v', 'Faces', axisy.f3', 'FaceAlpha', .5, 'FaceColor', 'r', 'EdgeColor', [0 0 0]);
p(7) = patch('Vertices', axisz.v', 'Faces', axisz.f3', 'FaceAlpha', .5, 'FaceColor', 'r', 'EdgeColor', [0 0 0]);
p(8) = patch('Vertices', apoiox.v', 'Faces', apoiox.f3', 'FaceAlpha', .5, 'FaceColor', 'r', 'EdgeColor', [0 0 0]);
p(9) = patch('Vertices', apoioy.v', 'Faces', apoioy.f3', 'FaceAlpha', .5, 'FaceColor', 'r', 'EdgeColor', [0 0 0]);
p(10) = patch('Vertices', apoioz.v', 'Faces', apoioz.f3', 'FaceAlpha', .5, 'FaceColor', 'r', 'EdgeColor', [0 0 0]);

grid on
axis('equal')
view(45, 10)
%view(15, 50)
camlight
snapnow
xlabel('Eixo $x$', 'Interpreter','latex');
ylabel('Eixo $y$', 'Interpreter','latex');
zlabel('Eixo $z$', 'Interpreter','latex');


end