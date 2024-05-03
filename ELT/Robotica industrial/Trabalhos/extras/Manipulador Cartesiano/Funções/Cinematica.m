function [Resposta1,Resposta2,Resposta3] = Cinematica(d0,a4,Tipo,Valor1,Valor2,Valor3)
    %Pf^2 = H1^2 + (d2 + d0 - a4)^2 = x^2 + y^2 + z^2
    %H1^2 = d1^2 + d3^2 = x^2 + y^2
    if Tipo == "Inversa"
        Resposta1 = Valor2;
        Resposta2 = Valor3 - d0 + a4;
        Resposta3 = Valor1;
    elseif Tipo == "Direta"
        Resposta1 = Valor3;
        Resposta2 = Valor1;
        Resposta3 = Valor2 + d0 - a4;
    end   
end
