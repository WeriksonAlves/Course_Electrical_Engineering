function [DH,AT0,AT1,AT2,AT3,AT4] = Parametrizacao(d0,d1,d2,d3,a4,x0,y0,z0,phi,theta,psi)
    % Dados da matriz de Devanit-Hartenberg
    T0 = deg2rad(0);
    T1 = deg2rad(0);
    T2 = deg2rad(-90);
    T3 = deg2rad(0);
    T4 = deg2rad(90);

    d4 = 0;  % [mm]

    a0 = 0;
    a1 = 0;
    a2 = 0;
    a3 = 0;

    A0 = deg2rad(-90);
    A1 = deg2rad(90);
    A2 = deg2rad(-90);
    A3 = deg2rad(0);
    A4 = deg2rad(0);

    DH = [[T0 d0 a1 A1];
          [T1 d1 a1 A1];
          [T2 d2 a2 A2];
          [T3 d3 a3 A3];
          [T4 d4 a4 A4]];

    % Definição das matrizes de transformação 
    AT0 = Matriz_Transformacao(T0,d0,a0,A0)
    A01 = Matriz_Transformacao(T1,d1,a1,A1)
    A12 = Matriz_Transformacao(T2,d2,a2,A2)
    A23 = Matriz_Transformacao(T3,d3,a3,A3)
    A34 = Matriz_Transformacao(T4,d4,a4,A4)
    
    % Deslocamento e orientação da base do manipulador cartesiano
    [~,~,~,H_00] = Transformacao_Homogenea(x0,y0,z0,phi,theta,psi);

    AT0 = H_00*AT0
    AT1 = AT0*A01
    AT2 = AT1*A12
    AT3 = AT2*A23
    AT4 = AT3*A34
end