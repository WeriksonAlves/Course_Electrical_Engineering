function Y = teste(X,xn,Y0,yn,fis)


for ii = 1:length(X)
    if ii < xn
        Xi = [X(1)*ones(1,xn-ii) X(1:ii)'];
    else
        Xi = X(ii-xn+1:ii)';
    end
    if ii == 1
        Xi = [Xi Y0*ones(1,yn)];
    elseif ii < yn+1
        Xi = [Xi Y0*ones(1,yn-ii+1) Y(1:ii-1)'];
    else
        Xi = [Xi Y(ii-yn:ii-1)'];
    end
    
    Y(ii,1) = evalfis(fis,Xi);

end