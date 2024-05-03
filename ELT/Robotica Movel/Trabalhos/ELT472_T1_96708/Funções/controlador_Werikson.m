function P3DX = Ctrl_sqrt(P3DX)

%%% Ganhos usados
% Parâmetros de controle
umax = 1;%0.35;
wmax = 1;%0.44;
g1 = 0.98;
g2 = 2;

%%%
% Erro Instantâneo:
P3DX.pPos.Xtil = (P3DX.pPos.Xd - P3DX.pPos.X);

% Modelagem cinemática em coordenada polares:
P3DX.pPos.rho = norm(P3DX.pPos.Xtil(1:2));
P3DX.pPos.theta = atan2(P3DX.pPos.Xtil(2),P3DX.pPos.Xtil(1));
P3DX.pPos.alpha = P3DX.pPos.theta - P3DX.pPos.X(6);

if abs(P3DX.pPos.alpha) > pi
    if P3DX.pPos.alpha > 0
        P3DX.pPos.alpha = -2*pi + P3DX.pPos.alpha;
    else
        P3DX.pPos.alpha  = 2*pi + P3DX.pPos.alpha;
    end
end

if P3DX.pPos.rho > 0.003
    % o erro mínimo de posição adotado (\roh_min = 30mm), a fim de evitar
    % indeterminações no sistema de controle
    
    % Modelagem cinemática
    K = [cos(P3DX.pPos.X(6)) -P3DX.pPar.a*sin(P3DX.pPos.X(6));
        sin(P3DX.pPos.X(6))  P3DX.pPar.a*cos(P3DX.pPos.X(6))];
    
    % Função Raiz quadrada
    Funcao = K^(-1)*(P3DX.pPos.Xd(7:8) + g1*P3DX.pPos.Xtil(1:2)/sqrt((norm(P3DX.pPos.Xtil(1:2))^2)+(g2^2)));
    
    P3DX.pSC.Ud(1) = umax*Funcao(1);
    P3DX.pSC.Ud(2) = wmax*Funcao(2);
else
    P3DX.pSC.Ud(1:2) = 0;
end
% Fim da edição..........................................
end