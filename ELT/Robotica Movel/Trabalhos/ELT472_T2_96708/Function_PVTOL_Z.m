function drone = Function_PVTOL_Z(drone,Kz,Kp)
%% V2: Controle da altura
Eq_u_1 = drone.pPos.dXd(9);
Eq_u_2 = Kz(1)*tanh(Kz(1)*(1/Kz(2))*drone.pPos.Xtil(3));
Eq_u_3 = Kz(3)*tanh(Kz(3)*(1/Kz(4))*drone.pPos.Xtil(9));
nz =  Eq_u_1 + Eq_u_2 + Eq_u_3;
u = drone.pPar.m*nz;

% V3: Controle de ...
Eq_Tp_1 = drone.pPos.dXd(12);
Eq_Tp_2 = Kp(1)*tanh(Kp(1)*(1/Kp(2))*drone.pPos.Xtil(6));
Eq_Tp_3 = Kp(3)*tanh(Kp(3)*(1/Kp(4))*drone.pPos.Xtil(12));
Tp = drone.pPar.Izz*(Eq_Tp_1 + Eq_Tp_2 + Eq_Tp_3);

% Enviando sinais
drone.pSC.Ud(3) = u;
drone.pSC.Ud(4) = -Tp;
end