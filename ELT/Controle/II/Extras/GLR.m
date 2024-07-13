% ------Gráfico do lugar da raízes ------
num = [1];
den = [1 1.1 10.3 5 0];
r = rlocus(num,den);
plot(r)
v = [-6 6 -6 6]; axis(v);
sgrid;
title('Grafico do Lugar das Raizes de G(s) = K/[s(s + 0.5)(s^2 + 0.6s + 10)]');
xlabel('Eixo Real');
ylabel('Eixo Imaginario');