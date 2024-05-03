function [Face_Topo,Face_Lateral,Vertices] = CriaElo2(Num_Faces,Raio,Altura)
    %Inicializa o cilindro
    Angulo_Faces = 2*pi/Num_Faces;
    Angulo_Inicial = 0:Angulo_Faces:2*pi;
    Cx = [0.2*Raio*cos(Angulo_Inicial) 0.2*Raio*cos(Angulo_Inicial)];
    Cy = [0.2*Raio*sin(Angulo_Inicial) 0.2*Raio*sin(Angulo_Inicial)];
    Cz = [zeros(1, length(Angulo_Inicial)) Altura*ones(1, length(Angulo_Inicial))];
    VC = [Cx; Cy; Cz]';
    % Transformação Rotacional em z
    PS1TZ = [cos(-pi/2) -sin(-pi/2) 0 0.2*Raio;
             sin(-pi/2) cos(-pi/2) 0 0;
             0 0 1 0;
             0 0 0 1];
    PS1VT = PS1TZ*[VC'; ones(1,size(VC,1))];
    PS1V = PS1VT(1:3,:)';
    VC = PS1V;
    
    %Numero de faces do elo
    Face = Num_Faces+2;
    
    %Cria as faces de cima e de baixo do elo
    Face_Topo = [1: Face; Face+1:2*(Face)];
    
    %Cria as faces laterais do elo
    for F= 1:Face
        if F<Face
            Face_Lateral(F,:) = [F F+1 Face+F+1 Face+F];
        else
            Face_Lateral(F,:) = [F 1 F+1 2*F];
        end
    end
    
    %Cria os vertices do elo
    Linha = 2*(Face);
    for L1 = 1:Linha
        if L1<= Linha/2
            if L1 <= Linha/4
                Vertices(L1,:) = [VC(L1,1)+(0.6*Raio),VC(L1,2),VC(L1,3)];
            elseif L1 == (Linha/4)+1
                Vertices(L1,:) = [VC(L1-1,1),VC(L1-1,2),VC(L1-1,3)];
            else
                Vertices(L1,:) = [VC(L1-1,1),VC(L1-1,2),VC(L1-1,3)];
            end
        else
            if L1 <= 3*Linha/4
                Vertices(L1,:) = [VC(L1-1,1)+(0.6*Raio),VC(L1-1,2),VC(L1-1,3)];
            elseif L1 == (3*Linha/4)+1
                Vertices(L1,:) = [VC(L1-2,1),VC(L1-2,2),VC(L1-2,3)];
            else
                Vertices(L1,:) = [VC(L1-2,1),VC(L1-2,2),VC(L1-2,3)];
            end
        end
    end
end