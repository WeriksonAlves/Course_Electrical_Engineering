function [PI,PS] = RotacionaPI(PI,PS,Passo,TI,TF,dx,dy,dz)
    % Clona os vertices
    for L1 = 1:2
        PS1(L1).Vertices = PS(L1).Vertices;
        PI1(L1).Vertices = PI(L1).Vertices;
    end
    
    fprintf('\nMovendo dois links.\n')
    for T1 = TI:Passo:TF
        % Transformação Rotacional em z
        PI1TZ = [cos(T1) -sin(T1) 0 dx;
                 sin(T1)  cos(T1) 0 dy;
                 0        0       1 dz;
                 0        0       0 1];
        for L2 = 1:2
            %Superior
            PS1VT = PI1TZ*[PS1(L2).Vertices'; ones(1,length(PS1(L2).Vertices))];
            PS1V = PS1VT(1:3,:)';
            PS(L2).Vertices = PS1V;
            %Inferior
            PI1VT = PI1TZ*[PI1(L2).Vertices'; ones(1,length(PI1(L2).Vertices))];
            PI1V = PI1VT(1:3,:)';
            PI(L2).Vertices = PI1V;            
        end
        PI.Vertices;
        PS.Vertices;
        pause(0.01)
    end
end