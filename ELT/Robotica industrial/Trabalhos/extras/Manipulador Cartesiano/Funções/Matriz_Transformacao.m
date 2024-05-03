function A = Matriz_Transformacao(T,d,a,A)
    A = [[cos(T) -sin(T)*cos(A) sin(T)*sin(A) a*cos(T)];
         [sin(T) cos(T)*cos(A) -cos(T)*sin(A) a*sin(T)];
         [0      sin(A)         cos(A)        d      ];
         [0      0              0             1       ]];
end