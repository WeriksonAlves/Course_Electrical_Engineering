function Distorcao_dB(x,y)
    % Equação passada no relatorio para medir a distorção em dB
    Dxy = 10*log10(mean((x-y).^2)./mean(x.^2));
    disp(Dxy)
end
    