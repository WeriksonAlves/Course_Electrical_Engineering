function [Teta1,Teta2] = CalculaAngulo(a1, a2, x, y)
    Teta2 = acos(((x^2)+(y^2)-(a1^2)-(a2^2))/(2*a1*a2));
    Alpha = atan2(y,x);
    Beta = atan2((a2*sin(Teta2)),(a1+(a2*cos(Teta2))));
    Teta1 = Alpha-Beta;
    if Teta1 < 0
        Teta1 = 2*pi + Teta1;
    end
    if Teta2 < 0
        Teta2 = 2*pi + Teta2;
    end
    
end