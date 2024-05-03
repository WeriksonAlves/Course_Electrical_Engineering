function [PS] = RotacionaPS(PS,Passo,TI,TF,dx,dy,dz)
    % Clona os vertices
    for L1 = 1:2
        PS1(L1).Vertices = PS(L1).Vertices;
    end
    
    %Gira o link superior
    fprintf('\nGirando link superior.\n')
    for T = TI:Passo:TF
        % Transformação Rotacional em z
        PS1TZ = [cos(T) -sin(T) 0 dx;
                 sin(T)  cos(T) 0 dy;
                 0        0       1 dz;
                 0        0       0 1];
        for L2 = 1:2
            PS2VT = PS1TZ*[PS1(L2).Vertices'; ones(1,length(PS1(L2).Vertices))];
            PS2V = PS2VT(1:3,:)';
            PS(L2).Vertices = PS2V;
        end
        PS.Vertices;
        pause(0.01)
    end
end