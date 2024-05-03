function [t1, t2] = calcangles(a1, a2, x, y)

t2 = acos((x^2 + y^2 - a1^2 - a2^2)/(2*a1*a2));
s2 = sin(t2); c2 = cos(t2);

alpha = atan2(y,x);
beta = atan2(a2*s2,(a1 + a2*c2));

t1 = alpha - beta;
% t1 = rad2deg(t1);
% t2 = rad2deg(t2);
end