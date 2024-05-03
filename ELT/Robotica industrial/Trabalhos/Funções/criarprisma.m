function [fcb, fcl, v] = criarprisma(n, r, h)
    ang = 360/n;
    t = 0:ang:360;
    x = [r*cosd(t) r*cosd(t)];
    y = [r*sind(t) r*sind(t)];
    z = [zeros(1, length(t)) h * ones(1, length(t))];

    v = [x; y; z]';

    % Faces de cima e baixo
    fcb = [1: n+1; n+2:2*(n+1)];
    %p(1) = patch('Vertices', v, 'Faces', fcb, ...
    %    'FaceAlpha', .9);
    % Faces laterais
    for ii= 1:n
        fcl(ii, :) = [ii ii+1 n+ii+2 n+ii+1]; 
    end

    %p(2) = patch('Vertices', v, 'Faces', fcl, ...
    %    'FaceAlpha', .5);

    %ver = p(1).Vertices; faces = p(2).Faces;

end