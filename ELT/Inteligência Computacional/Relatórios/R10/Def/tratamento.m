function Z = tratamento(X,xn,Y,yn)

Z(:,1) = [X(1)*ones(xn-1,1) ;X(1:end-xn+1)];
Z(:,xn+1) = [Y(1)*ones(yn,1) ;Y(1:end-yn)];

for ii = 2:xn
    A = [X(1)*ones(xn-ii,1) ;X(1:end+ii-xn)];
    Z(:,1:ii) = [Z(:,1:ii-1) A];
end
for ii = 2:yn
    A = [Y(1)*ones(yn-ii+1,1) ;Y(1:end+ii-yn-1)];
    Z(:,1:xn+ii) = [Z(:,1:xn+ii-1) A];
end