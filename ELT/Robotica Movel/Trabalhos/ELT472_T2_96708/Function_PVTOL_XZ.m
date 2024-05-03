function drone = Function_PVTOL_XZ(drone,Kx,Kz,Kt)
%% V2: Controle da altura
Eq_u_1 = drone.pPos.dXd(9);
Eq_u_2 = Kz(1)*tanh(Kz(1)*(1/Kz(2))*drone.pPos.Xtil(3));
Eq_u_3 = Kz(3)*tanh(Kz(3)*(1/Kz(4))*drone.pPos.Xtil(9));
nz =  Eq_u_1 + Eq_u_2 + Eq_u_3;
u = (drone.pPar.m/cos(drone.pPos.X(5)))*(nz);

%% V3: Controle de Arfagem
Eq_Tt_1 = drone.pPos.dXd(11);
Eq_Tt_2 = Kt(1)*tanh(Kt(1)*(1/Kt(2))*drone.pPos.Xtil(5));
Eq_Tt_3 = Kt(3)*tanh(Kt(3)*(1/Kt(4))*drone.pPos.Xtil(11));
Tt = drone.pPar.Iyy*(Eq_Tt_1 + Eq_Tt_2 + Eq_Tt_3);

%% V1: Theta desejado
Eq_Td_1 = drone.pPos.dXd(7);
Eq_Td_2 = Kx(1)*tanh(Kx(1)*(1/Kx(2))*drone.pPos.Xtil(1));
Eq_Td_3 = Kx(3)*tanh(Kx(3)*(1/Kx(4))*drone.pPos.Xtil(7));
Td = atan2((Eq_Td_1 + Eq_Td_2 + Eq_Td_3),(nz));

%% Enviando sinais
drone.pSC.Ud(3) = u;
drone.pSC.Ud(2) = -Tt;
drone.pPos.Xd(5) = Td;
end