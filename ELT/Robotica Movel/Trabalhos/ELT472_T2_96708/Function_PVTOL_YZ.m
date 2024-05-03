function drone = Function_PVTOL_YZ(drone,Ky,Kz,Kf)
%% V2: Controle da altura
Eq_u_1 = drone.pPos.dXd(9);
Eq_u_2 = Kz(1)*tanh(Kz(1)*(1/Kz(2))*drone.pPos.Xtil(3));
Eq_u_3 = Kz(3)*tanh(Kz(3)*(1/Kz(4))*drone.pPos.Xtil(9));
nz =  Eq_u_1 + Eq_u_2 + Eq_u_3;
u = (drone.pPar.m/cos(drone.pPos.X(4)))*(nz + drone.pPar.g);

%% V3: Controle de Rolagem
Eq_Tf_1 = drone.pPos.dXd(10);
Eq_Tf_2 = Kf(1)*tanh(Kf(1)*(1/Kf(2))*drone.pPos.Xtil(4));
Eq_Tf_3 = Kf(3)*tanh(Kf(3)*(1/Kf(4))*drone.pPos.Xtil(10));
Tf = drone.pPar.Ixx*(Eq_Tf_1 + Eq_Tf_2 + Eq_Tf_3);

%% V1: Phi desejado
Eq_Td_1 = drone.pPos.dXd(8);
Eq_Td_2 = Ky(1)*tanh(Ky(1)*(1/Ky(2))*drone.pPos.Xtil(2));
Eq_Td_3 = Ky(3)*tanh(Ky(3)*(1/Ky(4))*drone.pPos.Xtil(8));
Td = atan2((Eq_Td_1 + Eq_Td_2 + Eq_Td_3),(-(nz + drone.pPar.g)));

%% Enviando sinais

drone.pSC.Ud(3) = u;
drone.pSC.Ud(1) = -Tf;
drone.pPos.Xd(4) = Td;

drone.pSC.Ud = tanh(drone.pSC.Ud);
end