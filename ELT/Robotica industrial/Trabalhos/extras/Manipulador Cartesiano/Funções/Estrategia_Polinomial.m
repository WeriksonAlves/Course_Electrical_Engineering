function [base,link_0,link_1,link_2,link_3,link_4] = Estrategia_Polinomial(ti,tf,qi,qf,Tipo,x0,y0,z0,phi,theta,psi)
    qid = [0 0 0]';
    qfd = [0 0 0]';
    Matriz_q = [qi qid qf qfd]';
    
    d0 = 20; a4 = 20; %[mm] Considerações físicas do manipulador
    
    Matriz_Equacao = [1 ti ti^2 ti^3;
                      0 1 2*ti 3*ti^2;
                      1 tf tf^2 tf^3;
                      0 1 2*tf 3*tf^2];

    A = inv(Matriz_Equacao)*Matriz_q;

    kk = 1;
    t=0;
    
    Verifica = tic;
    if Tipo == "Inversa"
        [d1,d2,d3] = Cinematica(d0,a4,Tipo,Matriz_q(1,1),Matriz_q(1,2),Matriz_q(1,3));
        [~,AT0,AT1,AT2,AT3,AT4] = Parametrizacao(d0,d1,d2,d3,a4,x0,y0,z0,phi,theta,psi);
        [base,link_0,link_1,link_2,link_3,link_4] = Plota_Manipulador(x0,y0,z0,AT0,AT1,AT2,AT3,AT4);

        while t < tf
            q(1) = A(1,1) + A(2,1)*t + A(3,1)*t^2 + A(4,1)*t^3;
            q(2) = A(1,2) + A(2,2)*t + A(3,2)*t^2 + A(4,2)*t^3;
            q(3) = A(1,3) + A(2,3)*t + A(3,3)*t^2 + A(4,3)*t^3;     

            hold on
            plot3(link_4.XData(2),link_4.YData(2),link_4.ZData(2),'.');
            grid on
            
            pause(0.5)
            
            [d1,d2,d3] = Cinematica(d0,a4,"Inversa",q(1),q(2),q(3));
            [~,AT0,AT1,AT2,AT3,AT4] = Parametrizacao(d0,d1,d2,d3,a4,x0,y0,z0,phi,theta,psi);
            delete(base),delete(link_0),delete(link_1),delete(link_2),delete(link_3),delete(link_4)
            [base,link_0,link_1,link_2,link_3,link_4] = Plota_Manipulador(x0,y0,z0,AT0,AT1,AT2,AT3,AT4);
            
            kk = kk+1;
            t = t + 0.5;
        end
        
    elseif Tipo == "Direta"
        %[x,y,z] = Cinematica(d0,a4,Tipo,Matriz_q(1,1),Matriz_q(1,2),Matriz_q(1,3));
        [~,AT0,AT1,AT2,AT3,AT4] = Parametrizacao(d0,Matriz_q(1,1),Matriz_q(1,2),Matriz_q(1,3),a4,x0,y0,z0,phi,theta,psi);
        [base,link_0,link_1,link_2,link_3,link_4] = Plota_Manipulador(x0,y0,z0,AT0,AT1,AT2,AT3,AT4);
        
        while t < tf
            q(1) = A(1,1) + A(2,1)*t + A(3,1)*t^2 + A(4,1)*t^3;
            q(2) = A(1,2) + A(2,2)*t + A(3,2)*t^2 + A(4,2)*t^3;
            q(3) = A(1,3) + A(2,3)*t + A(3,3)*t^2 + A(4,3)*t^3;     

            hold on
            plot3(link_4.XData(2),link_4.YData(2),link_4.ZData(2),'.');
            grid on
            
            pause(0.5)
            
            [~,AT0,AT1,AT2,AT3,AT4] = Parametrizacao(d0,q(1),q(2),q(3),a4,x0,y0,z0,phi,theta,psi);
            delete(base),delete(link_0),delete(link_1),delete(link_2),delete(link_3),delete(link_4)
            [base,link_0,link_1,link_2,link_3,link_4] = Plota_Manipulador(x0,y0,z0,AT0,AT1,AT2,AT3,AT4);
            
            kk = kk+1;
            t = t + 0.5;
        end
        
    else
        fprintf('Entrada invalida');
    end
    toc(Verifica)
end
    
    